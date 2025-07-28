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
 * Servlet implementation class HomeServlet
 */
@WebServlet({"/trang-chu", "/gioi-thieu","/lien-he"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String  uriString = request.getRequestURI();
		if(uriString.contains("gioi-thieu")) {
			request.getRequestDispatcher("/views/gioithieu.jsp").forward(request, response);
		}else if(uriString.contains("lien-he")) {
			request.getRequestDispatcher("/views/lienhe.jsp").forward(request, response);
		}
		else {
			List<Video> list =VideoDAO.findAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/client/home.jsp").forward(request, response);
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
