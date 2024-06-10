package controller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Product;
import controller.databases.DatabaseController;
import utils.StringUtils;


@WebServlet("/AddProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController db = new DatabaseController();

        public AddProductServlet() {
        super();
    }


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId=     Integer.parseInt(request.getParameter("productId"));
		String productName =  request.getParameter("productName");
		String description = request.getParameter("productDescription");
		int price = Integer.parseInt(request.getParameter("productPrice"));
		System.out.print(request.getParameter("categoryId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		int quantity = Integer.parseInt(request.getParameter("productQuantity"));
		Part part = request.getPart("productImage");
		
		Product product = new Product(productId, productName, description, price, categoryId, quantity,part);
		String savePath = StringUtils.IMAGE_DIR_SAVE_PATH;
	    String fileName = product.getImageUrlFromPart();
	    if(!fileName.isEmpty() && fileName != null)
    		part.write(savePath + fileName);

		
		
		
	int res = db.addProduct(product);
	if (res==1) {
		request.setAttribute("productAdded", "yes");
		request.getRequestDispatcher("/pages/admin.jsp").forward(request, response);
		}
	else if(res==-1) {
		
		request.setAttribute("alreadyExists", "yes");
		request.getRequestDispatcher("/pages/admin.jsp").forward(request, response);
			
		
	}	
		
	}


}
