
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "utils.StringUtils"%>
    
 <%
String contextPath = request.getContextPath();
String errMsg = (String) request.getAttribute(StringUtils.MESSAGE_ERROR);
String successMsg = (String) request.getAttribute(StringUtils.MESSAGE_SUCCESS);
String username = (String) request.getAttribute(StringUtils.USERNAME);
String successParam = request.getParameter(StringUtils.SUCCESS);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
<link rel="stylesheet" href="<%=contextPath%>/stylesheets/signup.css">
</head>
<body>
    <div class="signup-form">
        <h2>Sign Up <p>Form</p></h2>
        
        <form action=" <%=contextPath+StringUtils.SERVLET_URL_REGISTER %>" method="post"  enctype="multipart/form-data">
       	<%
            
            if (errMsg != null) {
    			%>
    			<p class="error-msg " style="color:red ;font:10px;margin-top:30px">
    				<%
    				out.println(errMsg);
    				%>
    			</p>
    			<%
    			}
            
            %>
        <div class="container">
            <div class="main">
                <div class="content">
                        <input type="text" name="fullName" placeholder="Full Name" required autofocus="">
                        <input type="email" name="email" placeholder="Email" required autofocus="">
                        <input type="text" name="userName" placeholder="User Name" required autofocus="">
                        <input type="text" name="phoneNumber" placeholder="Phone No." required autofocus="">
                        <input type="text" name="address" placeholder="Address" required autofocus="">
                        <input type="password" name="password" placeholder="Password" required autofocus="">
                        <input type="password" name="confirmPassword" placeholder="Confirm Password" required autofocus="">
                        
                        
                    
                </div>
                    <div class="contents">
                        <div class="date-details">
                            <span class="date-title">Birth Date</span>
                            <input name="birthDate" type="date" id="Birtday" value="Birtday">
                        </div>
                       
                        <div class="gender-details" >
                            <input type="radio" name="gender" value="Male" id="zero-1">
                            <input type="radio" name="gender" value="Female" id="zero-2">
                            <span class="gender-title">Gender</span>
                            <div class="category">
                                <label for="zero-1">
                                    <span class="zero one"></span>
                                    <span class="gender">Male</span>
                                </label>
                                <label for="zero-2">
                                    <span class="zero two"></span>
                                    <span class="gender">Female</span>
                                </label>
                            </div>
                            
                        </div>
                   
          <div class="form-group">
				<div class="col">
					<label for="image">Profile Picture</label> <input type="file"
						id="image" name="image">
				</div>
			</div>
          
          
                        <button class="btn" type="submit">
                            Signup
                        </button>
                    <p class="account">Already have an account? <a href="login.jsp">Login</a></p>
                </div>
            </div>
        </div>
        </form>
    </div>
    
    
</body>
</html>