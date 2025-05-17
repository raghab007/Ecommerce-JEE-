package controller.servlets;

import java.io.IOException;

import Model.Product;
import controller.databases.DatabaseController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ProductDetail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController controller;
       
    
     
    public ProductDetailServlet() {
    	this.controller = new  DatabaseController();
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId =Integer.parseInt( request.getParameter("productId"));
		Product product = 	controller.getProductDetail(productId);
		request.setAttribute("product", product);
		request.getRequestDispatcher("/pages/product_details.jsp").forward(request, response);
		
			
	}

}
