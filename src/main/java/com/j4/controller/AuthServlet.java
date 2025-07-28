package com.j4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.j4.dao.UserDAO;
import com.j4.entity.User;
import com.j4.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

@WebServlet({ "/dang-nhap", "/dang-ky", "/dang-xuat", "/list" })
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AuthServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("dang-ky")) {
            request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
        } else if (uri.contains("dang-xuat")) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/trang-chu");
        } else if (uri.contains("list")) {
            String action = request.getParameter("action");
            String userId = request.getParameter("id");

            if (userId != null && action != null) {
                int id = Integer.parseInt(userId);
                User user = UserDAO.findById(id);

                if (user != null) {
                    if ("lock".equals(action)) {
                        user.setStatus(false);
                    } else if ("unlock".equals(action)) {
                        user.setStatus(true);
                    }
                    UserDAO.update(user);
                }
            }
            response.sendRedirect("list");
        } else {
            request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("dang-ky")) {
            handleDangKy(request, response);
        } else {
            handleDangNhap(request, response);
        }
    }

    private void handleDangKy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeatPassword");
        String fullName = request.getParameter("fullName");

        boolean hasError = false;

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("emailError", "Email không được để trống.");
            hasError = true;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("passwordError", "Mật khẩu không được để trống.");
            hasError = true;
        }

        if (repeatPassword == null || repeatPassword.trim().isEmpty()) {
            request.setAttribute("repeatPasswordError", "Xác nhận mật khẩu không được để trống.");
            hasError = true;
        } else if (!password.equals(repeatPassword)) {
            request.setAttribute("repeatPasswordError", "Mật khẩu xác nhận không khớp.");
            hasError = true;
        }

        if (fullName == null || fullName.trim().isEmpty()) {
            request.setAttribute("fullNameError", "Họ tên không được để trống.");
            hasError = true;
        }

        // Đổ lại dữ liệu nếu có lỗi
        request.setAttribute("email", email);
        request.setAttribute("fullName", fullName);

        // Kiểm tra email trùng
        if (!hasError) {
            User existingUser = UserDAO.findByIdOrEmail(email);
            if (existingUser != null) {
                request.setAttribute("emailError", "Email đã được sử dụng. Vui lòng chọn email khác.");
                hasError = true;
            }
        }

        if (hasError) {
            request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
            return;
        }

        User user = new User(null, email, password, fullName, false, true, null, null);
        dangKy(user);

        response.sendRedirect(request.getContextPath() + "/dang-nhap");
    }


    private void handleDangNhap(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean hasError = false;

        if (email == null || email.isEmpty()) {
            request.setAttribute("emailError", "Email không được để trống.");
            hasError = true;
        }

        if (password == null || password.isEmpty()) {
            request.setAttribute("passwordError", "Mật khẩu không được để trống.");
            hasError = true;
        }

        if (hasError) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
            return;
        }

        User user = UserDAO.findByIdOrEmail(email);

        if (user == null) {
            request.setAttribute("emailError", "Email không tồn tại.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
            return;
        }

        if (user.getPassword() == null || !user.getPassword().equals(password)) {
            request.setAttribute("passwordError", "Mật khẩu không đúng.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
            return;
        }

        if (!user.isStatus()) {
            request.setAttribute("error", "Tài khoản của bạn đã bị khóa.");
            request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
            return;
        }

        request.getSession().setAttribute("user", user);
        request.getSession().removeAttribute("uriString");

        Object redirectUri = request.getSession().getAttribute("uriString");
        if (redirectUri != null) {
            response.sendRedirect(redirectUri.toString());
        } else {
            response.sendRedirect(request.getContextPath() + "/trang-chu");
        }
    }


    private void dangKy(User user) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        try {
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
}
