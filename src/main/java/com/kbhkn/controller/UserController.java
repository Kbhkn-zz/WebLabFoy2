package com.kbhkn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kbhkn.model.User;
import com.kbhkn.service.GenericService;
import com.kbhkn.service.impl.GenericServiceImpl;

/**
 * Created by kbhkn on 22.10.2016 21:00.
 */
@WebServlet("/userProcess.do")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		GenericService service = new GenericServiceImpl();

		String type = request.getParameter("processType");

		switch (type) {
		case "add":
			addNewUser(request, service, response);
			break;

		case "update":
			updateUser(request, service, response);
			break;

		case "delete":
			deleteUser(request, service, response);
			break;
		}
		
		request.getRequestDispatcher("User.jsp").forward(request, response);
	}

	private static void addNewUser(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		dao.save(new User(request.getParameter("username"), request.getParameter("password")));
	}

	private static void updateUser(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		dao.update(new User(Integer.parseInt(request.getParameter("userId")), request.getParameter("username"), request.getParameter("password")));
	}

	private static void deleteUser(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		dao.delete(User.class, Integer.parseInt(request.getParameter("userId")));
	}
}
