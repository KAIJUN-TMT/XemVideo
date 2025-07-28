package com.j4.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.UserDAO;
import com.j4.entity.User;

@WebServlet("/user/list")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String idParam = request.getParameter("id");

		if (action != null && idParam != null) {
			try {
				int id = Integer.parseInt(idParam);
				User user = UserDAO.findById(id);

				if (user != null) {
					switch (action) {
						case "delete":
							UserDAO.delete(user);
							break;
						case "lock":
						    user.setStatus(false);
						    UserDAO.update(user);
						    break;
						case "unlock":
						    user.setStatus(true);
						    UserDAO.update(user);
						    break;

						case "changePassword":
							// Hiển thị form đổi mật khẩu
							request.setAttribute("userId", id);
							request.getRequestDispatcher("/views/doimatkhau.jsp").forward(request, response);

							return;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Thao tác thất bại: " + e.getMessage());
			}
		}

		List<User> users = UserDAO.findAll();
		request.setAttribute("users", users);
		request.getRequestDispatcher("/views/admin/user/UserList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("changePassword".equals(action)) {
			handleChangePassword(request, response);
			return;
		}

		doGet(request, response);
	}

	private void handleChangePassword(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String idParam = request.getParameter("id");
	    String current = request.getParameter("currentPassword");
	    String newPass = request.getParameter("newPassword");
	    String confirm = request.getParameter("confirmPassword");

	    try {
	        int id = Integer.parseInt(idParam);
	        User user = UserDAO.findById(id);

	        if (user != null) {
	            if (!user.getPassword().equals(current.trim())) {
	                request.setAttribute("message", "Mật khẩu hiện tại không đúng!");
	            } else if (!newPass.equals(confirm)) {
	                request.setAttribute("message", "Mật khẩu mới không khớp!");
	            } else {
	                user.setPassword(newPass.trim()); // có thể mã hóa ở đây nếu cần
	                UserDAO.update(user);
	                request.setAttribute("message", "Đổi mật khẩu thành công!");

	                // Sau khi đổi mật khẩu thành công, chuyển hướng về trang chủ
	                response.sendRedirect(request.getContextPath() + "/trang-chu"); // Hoặc trang chủ khác
	                return;
	            }
	            request.setAttribute("userId", id); // Để giữ lại id khi hiện lại form
	        } else {
	            request.setAttribute("message", "Không tìm thấy người dùng.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("message", "Lỗi đổi mật khẩu: " + e.getMessage());
	    }

	    // Nếu có lỗi hoặc không phải lỗi đổi mật khẩu, vẫn chuyển tiếp về trang đổi mật khẩu
	    request.getRequestDispatcher("/views/doimatkhau.jsp").forward(request, response);
	}
}