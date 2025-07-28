package com.j4.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.LikeDAO;
import com.j4.dao.VideoDAO;
import com.j4.entity.Like;
import com.j4.entity.User;
import com.j4.entity.Video;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet({"/yeu-thich", "/yeu-thich/them"})
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uriString = request.getRequestURI();
		
		if (uriString.contains("yeu-thich/them")) {
			if (request.getSession().getAttribute("user") == null) {
				response.sendRedirect(request.getContextPath() +  "/dang-nhap");
				return;
			}
			User user =  (User) request.getSession().getAttribute("user");
			String videoId = request.getParameter("id");
			Video video = VideoDAO.findById(Integer.parseInt(videoId));
			Like like = new Like();
			like.setLikeDate(new Date());
			like.setUser(user);
			like.setVideo(video);
			LikeDAO.insert(like);
			response.sendRedirect(request.getContextPath() +  "/trang-chu");
			
		}else {
			System.out.println("yeu thich");
			if (request.getSession().getAttribute("user") == null) {
				response.sendRedirect(request.getContextPath() +  "/dang-nhap");
				return;
			}
			User user =  (User) request.getSession().getAttribute("user");
			List<Video> list = VideoDAO.findVideoByUserId(user.getId());
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/client/like.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
