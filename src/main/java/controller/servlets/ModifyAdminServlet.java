package controller.servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Model.ModifyUserModel;
import controller.databases.DatabaseController;
import utils.StringUtils;

/**
 * Servlet implementation class ModifyAdminServlet
 */
@WebServlet("/ModifyAdmin")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class ModifyAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    DatabaseController dbController;
    public ModifyAdminServlet() {
        super();
        this.dbController = new DatabaseController();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName = request.getParameter("userFullName");
		String address = request.getParameter("userAddress");
		String phoneNumber = request.getParameter("userPhoneNumber");
		String email = request.getParameter("userEmail");
		Part part = request.getPart("userImage");
		String gender= request.getParameter("userGender");
		System.out.print(gender);

		//LocalDate date =LocalDate.parse( request.getParameter("userBirthDate"));
		
		
		
		ModifyUserModel newUser = new ModifyUserModel(fullName, address, phoneNumber, email, gender,part);
		String savePath = StringUtils.IMAGE_DIR_SAVE_PATH_USER;
	    String fileName = newUser.getImageUrlFromPart();
	    
	    if(!fileName.isEmpty() && fileName != null)
    	part.write(savePath + fileName);
	
		HttpSession  userSession  = request.getSession(false);
		String userName = (String)userSession.getAttribute(StringUtils.USERNAME);
		int result = dbController.modifyUser(newUser,userName);
		if(result==1) {
			
		request.getRequestDispatcher("/AdminProfileServlet").forward(request, response);
		
		
		}
			
		
	}

}
