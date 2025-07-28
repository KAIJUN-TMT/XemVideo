package com.j4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.VideoDAO;
import com.j4.entity.Video;

/**
 * Servlet implementation class ChitietServlet
 */
@WebServlet("/chi-tiet")
public class ChitietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChitietServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idParam = request.getParameter("id");
		if (idParam == null || idParam.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing video ID");
			return;
		}

		try {
			int id = Integer.parseInt(idParam);
			Video video = VideoDAO.findById(id);

			if (video == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found");
				return;
			}

			// ✅ Tăng lượt xem lên 1
			video.setViews(video.getViews() + 1);
			VideoDAO.update(video); // Cập nhật lại vào database

			List<Video> videos = VideoDAO.findAll(); // Lấy toàn bộ danh sách video

			request.setAttribute("video", video);
			request.setAttribute("videos", videos); // Truyền danh sách sang JSP

			request.getRequestDispatcher("/views/client/video/detail.jsp").forward(request, response);

		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid video ID format");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
