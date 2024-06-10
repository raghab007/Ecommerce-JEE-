package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.databases.DatabaseController;
import utils.StringUtils;

@WebServlet("/DeleteProduct")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController db;
       
    
    
    public DeleteProductServlet() {
    	this.db = new DatabaseController();
    	
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		int result = db.deleteProduct(productId);
		request.getRequestDispatcher("/AdminProducts").forward(request, response);

		
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productId = Integer.parseInt(req.getParameter("productId"));
		int result = db.deleteProduct(productId);
		if(result==1) {
			req.setAttribute(StringUtils.MESSAGE_SUCCESS, "SuccessFully deleted");
			req.getRequestDispatcher(StringUtils.PAGE_URL_ADMIN).forward(req, resp);


			
			
		}else if(result==-1) {
			
			req.setAttribute(StringUtils.MESSAGE_SUCCESS, "Product Doesnot Exists");
			req.getRequestDispatcher(StringUtils.PAGE_URL_ADMIN).forward(req, resp);
			
			
		}else {
			System.out.print("What the fuck");
			
		}
		
	}	

}
