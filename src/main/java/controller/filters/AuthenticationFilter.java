package controller.filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.StringUtils;

public class AuthenticationFilter implements Filter {

   @Override
   public void init(FilterConfig filterConfig) throws ServletException {
	   // Initialization code if needed
   }
    

    @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
           throws IOException, ServletException {

       // Cast request and response objects to HttpServletRequest and HttpServletResponse for type safety
       HttpServletRequest req = (HttpServletRequest) request;
       HttpServletResponse res = (HttpServletResponse) response;

       // Get the requested URI
       String uri = req.getRequestURI();
      

       if (uri.endsWith(StringUtils.URL_INDEX) || uri.endsWith("home.jsp") || uri.endsWith("/")
               || uri.endsWith("login.jsp") || uri.endsWith("products.jsp") || uri.endsWith("cart.jsp")
                || uri.endsWith("aboutus.jsp") || uri.endsWith("header.jsp") || uri.endsWith("footer.jsp")
                || uri.endsWith("signup.jsp") || uri.endsWith("filteredproducts.jsp")
                || uri.endsWith("user_order_history.jsp") || uri.endsWith("user_profile.jsp")) {

    	   HttpSession session = req.getSession(false);
            boolean isLoggedIn = session != null && session.getAttribute(StringUtils.USERNAME) != null;
            boolean isAdmin = isLoggedIn && session.getAttribute(StringUtils.USERNAME).equals("username");

          if (isLoggedIn && isAdmin) {
                // If admin is logged in, redirect to admin page
                res.sendRedirect(req.getContextPath() + StringUtils.PAGE_URL_ADMIN);
                return;
            }
        }
        // Allow access to static resources (CSS) and the index page without checking login
        if (uri.endsWith(".css") || uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith("home.jsp")) {
            chain.doFilter(request, response);
            return;
        }

      // Allow access to the servlet with URL /Home even when the user is not logged in
        if (uri.endsWith(StringUtils.SERVLET_URL_HOME) || uri.endsWith("products.jsp") ||uri.endsWith("ProductDetail") ||uri.endsWith("AddToCart") || uri.endsWith("home.jsp")) {
            chain.doFilter(request, response);
            return;
        }
        
        
     // Separate flags for login, login/logout servlets, and register page/servlet for better readability
        boolean isLogin = uri.endsWith(StringUtils.PAGE_URL_LOGIN);
        boolean isLoginServlet = uri.endsWith(StringUtils.SERVLET_URL_LOGIN);
        boolean isLogoutServlet = uri.endsWith(StringUtils.SERVLET_URL_LOGOUT);
        boolean isRegisterPage = uri.endsWith(StringUtils.PAGE_URL_SIGNUP);
        boolean isRegisterServlet = uri.endsWith("/signup");

        // Allow access to home.jsp for non-logged-in users or non-admin logged in users
        HttpSession session = req.getSession(false);
        boolean isLoggedIn = session != null && session.getAttribute(StringUtils.USERNAME) != null;
        boolean isAdmin = isLoggedIn && session.getAttribute(StringUtils.USERNAME).equals("username");
        
        if(isLoggedIn && !isAdmin && (uri.endsWith("admin.jsp") || uri.endsWith("admin_product.jsp") || uri.endsWith("admin_details.jsp") )) {
        	
        	
        	res.sendRedirect(req.getContextPath()+"/home.jsp");
        	
        }
        
        if(!isLoggedIn && uri.endsWith("home.jsp")) {
        	
        	res.sendRedirect(req.getContextPath()+"/home.jsp");
        }
        
        
       if (!isAdmin) {
            if (uri.endsWith("/home.jsp") || uri.endsWith("/Home") ) {
                res.sendRedirect(req.getContextPath() + StringUtils.PAGE_URL_ADMIN);
                return;
            }
        }

       // Redirect to login if user is not logged in and trying to access a protected resource
      if (!isLoggedIn && !(isLogin || isLoginServlet || isRegisterPage || isRegisterServlet )) {
            res.sendRedirect(req.getContextPath() + StringUtils.PAGE_URL_LOGIN);
        }else if (isLoggedIn &&  isAdmin && !uri.endsWith(StringUtils.SERVLET_URL_HOME) && !(!isLogin || isLogoutServlet)) { // Redirect logged-in users to the index page if trying to access login page again
            res.sendRedirect(req.getContextPath() + StringUtils.URL_INDEX);
        } else {
            // Allow access to the requested resource if user is logged in or accessing unprotected resources
            chain.doFilter(request, response);
        }
    }

    @Override
  public void destroy() {
       // Cleanup code if needed
    }
}
