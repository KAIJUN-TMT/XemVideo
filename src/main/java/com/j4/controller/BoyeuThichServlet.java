package com.j4.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.LikeDAO;
import com.j4.entity.User;

/**
 * Servlet implementation class BoyeuThichServlet
 */
@WebServlet("/bo-yeu-thich")
public class BoyeuThichServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BoyeuThichServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy user từ session
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect("dang-nhap"); // Nếu chưa đăng nhập thì chuyển hướng
                return;
            }

            // Lấy videoId từ request
            String videoIdRaw = request.getParameter("id");
            int videoId = Integer.parseInt(videoIdRaw);

            // Xóa like (bỏ yêu thích)
            LikeDAO.delete(user.getId(), videoId);

            // Chuyển hướng về trang danh sách yêu thích
            response.sendRedirect("yeu-thich"); // hoặc bạn có thể để trang-chu nếu muốn
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi bỏ yêu thích.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}