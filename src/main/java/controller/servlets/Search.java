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
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController ;
       
    public Search() {
    	dbController = new DatabaseController();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter("productName");
		ArrayList<Product> products = (ArrayList<Product>)dbController.getFilteredProducts(productName);
		request.setAttribute("productList", products);
		request.getRequestDispatcher("/pages/products.jsp").forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
