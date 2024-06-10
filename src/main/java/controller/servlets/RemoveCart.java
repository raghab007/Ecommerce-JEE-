package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.databases.DatabaseController;


@WebServlet("/RemoveCart")
public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController;
       
    
    public RemoveCart() {
    	super();
    	this.dbController  = new DatabaseController();   
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int cartId = Integer.parseInt(request.getParameter("cartId"));
	System.out.print(cartId);
	int result = dbController.removeCart(cartId);
	if(result==1) {
		
		response.sendRedirect(request.getContextPath()+"/CartList");
	}
	
	
	}

}
