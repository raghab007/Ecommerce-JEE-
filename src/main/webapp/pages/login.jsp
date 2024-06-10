
<%@page import="utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%
String contextPath = request.getContextPath();
String errMsg = (String) request.getAttribute(StringUtils.MESSAGE_ERROR);
%>  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="<%=contextPath%>/stylesheets/login.css" />
  </head>
  <body>
    <div class="login-form">
      <div class="container">
        <div class="main">
          <div class="form-img">
            <img src="<%=contextPath%>/resources/bg.jpeg" alt="" />
          </div>
          <div class="content">
            <h2>Log In</h2>
            <%
            
            if (errMsg != null) {
    			%>
    			<p class="error-msg" style="color:red">
    				<%
    				out.println(errMsg);
    				%>
    			</p>
    			<%
    			}
            
            %>
            <form action="<%=contextPath+StringUtils.SERVLET_URL_LOGIN %>" method="post">
              <input
                type="text"
                name="userName"
                placeholder="User Name"
                required
                autofocus="autofocus"
              />
              <input
                type="password"
                name="password"
                placeholder="User Password "
       
                required
                autofocus="autofocus"
              />
              <button class="btn" type="submit">Login</button>
            </form>
            <p class="account">
              Don't Have An Account?
              <a href="<%=contextPath%>/pages/signup.jsp">Register</a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
    