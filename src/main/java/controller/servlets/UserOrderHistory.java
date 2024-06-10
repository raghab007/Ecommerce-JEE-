package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Order;
import controller.databases.DatabaseController;
import utils.StringUtils;


@WebServlet("/UserOrderHistory")
public class UserOrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController;
       
    
    public UserOrderHistory() {
        super();
        dbController = new DatabaseController();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session  = request.getSession();
		String userName =(String) session.getAttribute(StringUtils.USERNAME);
		ArrayList<Order> orders =(ArrayList<Order>) dbController.getUserOrderHistory(userName);
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/pages/user_order_history.jsp").forward(request, response);
		
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
