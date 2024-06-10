package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.databases.DatabaseController;
import utils.StringUtils;

@WebServlet("/CreateOrder")
public class CreateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController;
       
    public CreateOrder() {
        super();
    	dbController = new DatabaseController();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession userSession = request.getSession();
		String userName = (String)userSession.getAttribute(StringUtils.USERNAME);
		int result  = dbController.createOrder(userName);
		if(result==1) {
			
			request.setAttribute("orderSuccess", "Success");
			request.getRequestDispatcher("/home.jsp").forward(request, response);	
			
		}else {

	
			
		}
				
	}

}
