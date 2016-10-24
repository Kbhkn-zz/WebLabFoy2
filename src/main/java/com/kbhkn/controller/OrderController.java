package com.kbhkn.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kbhkn.model.Order;
import com.kbhkn.model.Product;
import com.kbhkn.model.User;
import com.kbhkn.service.GenericService;
import com.kbhkn.service.impl.GenericServiceImpl;

/**
 * Created by kbhkn on 22.10.2016 20:40.
 */
@WebServlet("/orderProcess.do")
public class OrderController extends HttpServlet {
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

		try {
			if (type != null) {
				switch (type) {
				case "add":
					addNewOrder(request, service, response);
					break;

				case "delete":
					deleteOrder(request, service, response);
					break;
				}
			}
		} catch (Exception e) {}
		
		request.getRequestDispatcher("Order.jsp").forward(request, response);
	}

	private static void addNewOrder(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		Order o = new Order();
		o.setUser(new User(Integer.parseInt(request.getParameter("userId"))));
		o.setProduct(new Product(Integer.parseInt(request.getParameter("productId"))));
		o.setOrderDate(new Date());
		o.setOrderCount(Integer.parseInt(request.getParameter("qty")));
		
		dao.save(o);
	}
	
	private static void deleteOrder(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		dao.delete(Order.class, Integer.parseInt(request.getParameter("orderId")));
	}
}
