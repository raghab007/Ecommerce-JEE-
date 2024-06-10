package controller.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Product;
import controller.databases.DatabaseController;
import utils.PasswordEncryption;
import utils.StringUtils;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DatabaseController db = new DatabaseController();  
    public LoginServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		int result = db.userInfo(userName, password);
		if(result==1) {
			HttpSession userSession = request.getSession();
			userSession.setAttribute(StringUtils.USERNAME, userName);
			userSession.setMaxInactiveInterval(30*60);
			
			Cookie userCookie= new Cookie(StringUtils.USER, userName);
			userCookie.setMaxAge(30*60);
			response.addCookie(userCookie);
			
//			ArrayList<Product> products = (ArrayList<Product>) db.getAllProducts();
//			int productQuantity = db.getProductsQuantity();
			
			request.setAttribute(StringUtils.MESSAGE_SUCCESS, StringUtils.MESSAGE_SUCCESS_LOGIN);
//			request.setAttribute("products", products);
//			request.setAttribute("quantity", productQuantity);
			RequestDispatcher rd = request.getRequestDispatcher(StringUtils.PAGE_URL_ADMIN);
			rd.forward(request, response);
			//response.sendRedirect(request.getContextPath()+StringUtils.PAGE_URL_ADMIN);
			
			
		}else if (result==2) {
			HttpSession userSession = request.getSession();
			userSession.setAttribute(StringUtils.USERNAME, userName);
			userSession.setMaxInactiveInterval(30*60);
			
			Cookie userCookie= new Cookie(StringUtils.USER, userName);
			userCookie.setMaxAge(30*60);
			response.addCookie(userCookie);
			
            request.setAttribute(StringUtils.MESSAGE_SUCCESS, StringUtils.MESSAGE_SUCCESS_LOGIN);
   
			//request.getRequestDispatcher("/Home").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/home.jsp");
			
			
		}else if(result==-2) {
			request.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_LOGIN_USERNAME);
			RequestDispatcher rd = request.getRequestDispatcher(StringUtils.PAGE_URL_LOGIN);
			rd.forward(request, response);
			
		}else if (result==-3) {
			request.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_LOGIN_PASSOWRD);
			RequestDispatcher rd = request.getRequestDispatcher(StringUtils.PAGE_URL_LOGIN);
			rd.forward(request, response);

			
		}else if(result==-1) {
			request.setAttribute(StringUtils.MESSAGE_ERROR, "Internal Server Error occurred");
			RequestDispatcher rd = request.getRequestDispatcher(StringUtils.PAGE_URL_LOGIN);
			rd.forward(request, response);	
			
		}
		
	}

}
