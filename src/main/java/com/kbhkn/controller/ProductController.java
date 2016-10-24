package com.kbhkn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kbhkn.model.Product;
import com.kbhkn.service.GenericService;
import com.kbhkn.service.impl.GenericServiceImpl;

/**
 * Created by kbhkn on 22.10.2016 20:51.
 */
@WebServlet("/productProcess.do")
public class ProductController extends HttpServlet {
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
					addNewProduct(request, service, response);
					break;

				case "update":
					updateProduct(request, service, response);
					break;

				case "delete":
					deleteProduct(request, service, response);
					break;
				}
			}
		} catch (Exception e) {}
		
		request.getRequestDispatcher("Product.jsp").forward(request, response);
	}

	private static void addNewProduct(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		dao.save(new Product(request.getParameter("productname"), request.getParameter("productinfo"), Double.parseDouble(request.getParameter("productprice"))));
	}

	private static void updateProduct(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		dao.update(new Product(Integer.parseInt(request.getParameter("productId")),request.getParameter("productname"), request.getParameter("productinfo"), Double.parseDouble(request.getParameter("productprice"))));
	}

	private static void deleteProduct(HttpServletRequest request, GenericService dao, HttpServletResponse response) throws ServletException, IOException {
		dao.delete(Product.class, Integer.parseInt(request.getParameter("productId")));
	}
}
