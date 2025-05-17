package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;


import Model.Product;
import controller.databases.DatabaseController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/AdminProducts")
public class AdminProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController;
	
    public AdminProducts() {
    	dbController = new DatabaseController();
        
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> products = (ArrayList<Product>) dbController.getAllProducts();
		request.setAttribute("productList", products);
		request.getRequestDispatcher("/pages/admin_product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
