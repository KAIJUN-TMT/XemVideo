package com.j4.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.j4.dao.LikeDAO;
import com.j4.dao.UserDAO;
import com.j4.dao.VideoDAO;
import com.j4.dto.LikeDTO;
import com.j4.entity.Like;
import com.j4.entity.User;
import com.j4.entity.Video;
import com.j4.util.JsonIO;

/**
 * Servlet implementation class ApiLikeServlet
 */
@WebServlet({"/api/like/add", "/api/like/delete"})
public class ApiLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rs = "";
		try {
			String json = JsonIO.read(request);
			System.out.println("json: " + json);
			ObjectMapper mapper = new ObjectMapper();
			LikeDTO likeDTO = mapper.readValue(json, LikeDTO.class);
			User user = UserDAO.findById(likeDTO.getUserId());
			Video video = VideoDAO.findById(likeDTO.getVideoId());
			Like like = new Like();
			like.setLikeDate(new Date());
			like.setUser(user);
			like.setVideo(video);
			LikeDAO.insert(like);
			rs = "{\"status\":\"ok\", \"message\":\"success\"}";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			rs = "{\"status\":\"fail\", \"message\":\"error\"}";
		}
		
		JsonIO.write(response, rs);
	}
	 @Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
