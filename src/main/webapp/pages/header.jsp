<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utils.StringUtils"%>  
 <%
String contextPath =(String)request.getContextPath();
 HttpSession userSession = request.getSession();
 String currentUser = (String) userSession.getAttribute(StringUtils.USERNAME);

%>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="<%=contextPath%>/stylesheets/index.css">
        
    
<meta charset="UTF-8">
<style type="text/css">
/* CSS for navigation bar */
#nav_container_custom {
    background-color: #3498db; /* Lighter background color */
    padding: 20px;
}

.navTop_custom {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navItem_custom {
    display: flex;
    align-items: center;
}

.search_custom {
    position: relative;
}

.searchInput_custom {
    padding: 10px;
    border: 2px solid #ccc;
    border-radius: 5px;
    width: 300px;
    font-size: 16px;
    transition: all 0.3s;
    height: 30px;
}

.searchInput_custom:focus {
    outline: none;
    border-color: #66ccff;
    box-shadow: 0 0 5px #66ccff;
}

.searchInput_custom:hover {
    background-color: #f2f2f2;
}

.searchIcon_custom {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
}

.loginButton_custom {
    border: none;
    background: none;
    cursor: pointer;
    color: #fff;
}

.signupLink_custom {
    margin-right: 20px;
    cursor: pointer;
    color: #fff;
}

.navBottom_custom {
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

.navbarButton_custom {
    border: none;
    background: none;
    padding: 10px 20px;
    margin: 0 10px; /* Add spacing between buttons */
    cursor: pointer;
    font-size: 16px;
    color: #fff;
    transition: background-color 0.3s, color 0.3s; /* Add transition effect */
    border-radius: 5px;
}

.navbarButton_custom:hover {
    background-color: #2980b9; /* Darker background color on hover */
    color: #000; /* Change text color on hover */
}

.navTitle_custom {
    font-size: 24px;
    color: #fff;
    transition: color 0.3s; /* Add transition effect */
}

.navTitle_custom:hover {
    color: #66ccff;
}
</style>

<title>Smart Home Care</title>
</head>
<body>
    <nav id="nav_container_custom">
        <div class="navTop_custom">
            <div class="navItem_custom">
                <h2 class="navTitle_custom">Smart Home Care</h2>
            </div>
            <div class="navItem_custom">
                <div class="search_custom">
                	<form style="display: inline" action="<%=contextPath%>/Search"> <input  name="productName" type="text" placeholder="Search..." class="searchInput_custom"></form>
                   
                    <img src="<%=contextPath%>/resources/images/products/search.png" width="20" height="20" alt="" class="searchIcon_custom">
                </div>
            </div>
            <div class="navItem_custom">
            
             <form action="<%
                    // Conditionally set the action URL based on user session
                    if (currentUser != null) {
                        out.print(contextPath + StringUtils.SERVLET_URL_LOGOUT);
                    } else {
                        out.print(contextPath + StringUtils.PAGE_URL_LOGIN);
                    }
                %>" method="post">
                    <input style="display: inline" class= "loginButton_custom" type="submit" value="<%
                        // Conditionally set the button label based on user session
                        if (currentUser != null) {
                            out.print(StringUtils.LOGOUT);
                        } else {
                            out.print(StringUtils.LOGIN);
                        }
                    %>"/>
                </form>
            
               
                <a href="<%=contextPath%>/pages/signup.jsp" class="signupLink_custom">Signup</a>
                <i class="fa-regular fa-cart-shopping" id="icon"></i>

            </div>
        </div>
        <div class="navBottom_custom">
            <button id="homeButton_custom" class="navbarButton_custom"><a  class="navbarButton_custom" href="<%=contextPath%>/home.jsp">Home</a></button> 
           <form action="<%=contextPath%>/Home"><button id="productsButton_custom" class="navbarButton_custom">Products</button></form>
           <form action="<%=contextPath%>/AdminProfileServlet"><button id="profileButton_custom" <%if(currentUser == null){%>style="display: none"<%}%>   class="navbarButton_custom">User Profile</button></form>
            
    		<form action="<%
                        if (currentUser == null) {
                            out.print(contextPath+"/pages/login.jsp");
                        } else {
                            out.print(contextPath+"/CartList");
                        }
                    %>" method="get">
    			<button id="cartButton_custom" class="navbarButton_custom">Cart List</button>
    			</form>
    			
    		<form action="<%
                        if (currentUser == null) {
                            out.print(contextPath+"/pages/login.jsp");
                        } else {
                            out.print(contextPath+"/UserOrderHistory");
                        }
                    %>" method="get">
    			<button id="orderHistoryButton_custom" class="navbarButton_custom">Order History</button>
    			</form>	
    			
    		 <button id="aboutUsButton_custom" class="navbarButton_custom"><a class="navbarButton_custom"  href="<%=contextPath%>/pages/aboutus.jsp">About Us</a></button> 
    			
          
        </div>
        
        
        
        
    </nav>

<script>
  // Get the navbar buttons
  const homeButton_custom = document.getElementById('homeButton_custom');
  const productsButton_custom = document.getElementById('productsButton_custom');
  const profileButton_custom = document.getElementById('profileButton_custom');
  const cartButton_custom = document.getElementById('cartButton_custom');
  const orderHistoryButton_custom = document.getElementById('orderHistoryButton_custom');
  const aboutUsButton_custom = document.getElementById('aboutUsButton_custom');

  // Add click event listeners to each button
  homeButton_custom.addEventListener('click', () => {
    removeUnderline_custom();
    homeButton_custom.classList.add('underline_custom');
  });

  productsButton_custom.addEventListener('click', () => {
    removeUnderline_custom();
    productsButton_custom.classList.add('underline_custom');
  });

  profileButton_custom.addEventListener('click', () => {
    removeUnderline_custom();
    profileButton_custom.classList.add('underline_custom');
  });

  cartButton_custom.addEventListener('click', () => {
    removeUnderline_custom();
    cartButton_custom.classList.add('underline_custom');
  });
  
  orderHistoryButton_custom.addEventListener('click', () => {
    removeUnderline_custom();
    orderHistoryButton_custom.classList.add('underline_custom');
  });
  
  aboutUsButton_custom.addEventListener('click', () => {
    removeUnderline_custom();
    aboutUsButton_custom.classList.add('underline_custom');
  });

  // Function to remove underline from all buttons
  function removeUnderline_custom() {
    homeButton_custom.classList.remove('underline_custom');
    productsButton_custom.classList.remove('underline_custom');
    profileButton_custom.classList.remove('underline_custom');
    cartButton_custom.classList.remove('underline_custom');
    orderHistoryButton_custom.classList.remove('underline_custom');
    aboutUsButton_custom.classList.remove('underline_custom');
  }
</script>

</body>
</html>
