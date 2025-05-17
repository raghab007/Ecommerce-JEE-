package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;

 

import Model.CartModel;
import Model.Product;
import controller.databases.DatabaseController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.StringUtils;


@WebServlet("/CartList")
public class CartList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController;
       
    
    public CartList() {
    	super();
    	this.dbController = new DatabaseController();
    	
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session  = request.getSession();
		String userName = (String)session.getAttribute(StringUtils.USERNAME);
		ArrayList<CartModel> cartList = (ArrayList<CartModel>)dbController.getAllCartItems(userName);
		request.setAttribute("cartList", cartList);
		request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

}
