package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CartModel;
import Model.Product;
import controller.databases.DatabaseController;
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
