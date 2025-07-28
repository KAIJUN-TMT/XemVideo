package com.j4.controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.j4.dao.VideoDAO;
import com.j4.entity.Video;

@MultipartConfig()
@WebServlet({"/admin/video/list", "/admin/video/add","/admin/video/insert", "/admin/video/edit","/admin/video/update", "/admin/video/delete"})
public class VideoManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VideoManagementServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriString = request.getRequestURI();
		if (uriString.contains("add")) {
			request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
		}else if (uriString.contains("edit")) {
			String id = request.getParameter("id");
			Video video = VideoDAO.findById(Integer.parseInt(id));
			request.setAttribute("video", video);
			request.getRequestDispatcher("/views/admin/video/edit.jsp").forward(request, response);
		}else if (uriString.contains("delete")) {
			String id = request.getParameter("id");
			VideoDAO.delete(Integer.parseInt(id));
			response.sendRedirect(request.getContextPath() + "/admin/video/list");
		}else {
			List<Video> list = VideoDAO.findAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/admin/video/list.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriString = request.getRequestURI();
		if (uriString.contains("insert")) {
			int rs = 0;
			try {
				String title = request.getParameter("title");
				String urlVideo = request.getParameter("urlVideo");
				String description = request.getParameter("description");
			
				String active = request.getParameter("active");
				Part part = request.getPart("poster");

				boolean hasError = false;
				if (title == null || title.trim().isEmpty()) {
					request.setAttribute("titleError", "Tiêu đề không được để trống.");
					hasError = true;
				}
				if (urlVideo == null || urlVideo.trim().isEmpty()) {
					request.setAttribute("urlVideoError", "URL video không được để trống.");
					hasError = true;
				}
				if (description == null || description.trim().isEmpty()) {
					request.setAttribute("descriptionError", "Mô tả không được để trống.");
					hasError = true;
				}
				if (part == null || part.getSize() == 0) {
					request.setAttribute("posterError", "Vui lòng chọn ảnh đại diện.");
					hasError = true;
				}
			

		
				if (hasError) {
					request.setAttribute("title", title);
					request.setAttribute("urlVideo", urlVideo);
					request.setAttribute("description", description);
					request.setAttribute("active", active);
					request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
					return;
				}

				String fileName = part.getSubmittedFileName();
				String path = "images/" + fileName;
				String realPath = request.getServletContext().getRealPath(path);
				if(!Files.exists(Path.of(realPath))) {
					Files.createDirectories(Path.of(realPath));
				}
				part.write(realPath);

				Video video = new Video();
				video.setTitle(title);
				video.setUrlVideo(urlVideo);
				video.setDescription(description);
				video.setPoster(fileName);
				video.setActive(Boolean.valueOf(active));
				rs = VideoDAO.insert(video);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if (rs > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/video/list");
			}else {
				request.setAttribute("message", "Thêm video thất bại");
				request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
			}

		} else {
			int rs = 0;
			String id = request.getParameter("id");
			try {
				String title = request.getParameter("title");
				String urlVideo = request.getParameter("urlVideo");
				String description = request.getParameter("description");
				String active = request.getParameter("active");
				Part part = request.getPart("poster");

				boolean hasError = false;
				if (title == null || title.trim().isEmpty()) {
					request.setAttribute("titleError", "Tiêu đề không được để trống.");
					hasError = true;
				}
				if (urlVideo == null || urlVideo.trim().isEmpty()) {
					request.setAttribute("urlVideoError", "URL video không được để trống.");
					hasError = true;
				}
				if (description == null || description.trim().isEmpty()) {
					request.setAttribute("descriptionError", "Mô tả không được để trống.");
					hasError = true;
				}

				if (hasError) {
					Video video = VideoDAO.findById(Integer.parseInt(id));
					video.setTitle(title);
					video.setUrlVideo(urlVideo);
					video.setDescription(description);
					video.setActive(Boolean.valueOf(active));
					request.setAttribute("video", video);
					request.getRequestDispatcher("/views/admin/video/edit.jsp").forward(request, response);
					return;
				}

				String fileName = "";
				if (!part.getSubmittedFileName().isEmpty()) {
					fileName = part.getSubmittedFileName();
					String path = "images/" + fileName;
					String realPath = request.getServletContext().getRealPath(path);
					if(!Files.exists(Path.of(realPath))) {
						Files.createDirectories(Path.of(realPath));
					}
					part.write(realPath);
				}

				Video video = VideoDAO.findById(Integer.parseInt(id));
				video.setTitle(title);
				video.setUrlVideo(urlVideo);
				video.setDescription(description);
				video.setActive(Boolean.valueOf(active));
				if (!fileName.isEmpty()) {
					video.setPoster(fileName);
				}
				rs = VideoDAO.update(video);
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (rs > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/video/list");
			}else {
				request.setAttribute("message", "Cập nhật video thất bại");
				request.getRequestDispatcher("/views/admin/video/edit.jsp").forward(request, response);
			}
		}
	}
}
