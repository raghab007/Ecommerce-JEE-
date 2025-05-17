package controller.servlets;

import java.io.IOException;


import Model.User;
import controller.databases.DatabaseController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.StringUtils;


@WebServlet("/AdminProfileServlet")
public class AdminProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController;
       
    
    public AdminProfileServlet() {
    	this.dbController = new DatabaseController();
    }

	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession  userSession  = request.getSession(false);
		if(userSession!=null) {
				String userName = (String)userSession.getAttribute(StringUtils.USERNAME);
		
			if(userName.equals("ananta777")) {
				
				User admin = dbController.getUserDetail(userName);
				request.setAttribute("user", admin);
				request.getRequestDispatcher("/pages/admin_details.jsp").forward(request, response);
			}
			else {
				User user = dbController.getUserDetail(userName);
				request.setAttribute("user", user);
				request.getRequestDispatcher("/pages/user_profile.jsp").forward(request, response);
				 
		}	
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
