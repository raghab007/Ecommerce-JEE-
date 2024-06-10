<%@page import="java.io.PrintWriter"%>
<%@page import="Model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="utils.StringUtils"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utils.StringUtils"%>
   
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>    
 <%
String contextPath =(String)request.getContextPath();
 HttpSession userSession = request.getSession();
 String currentUser = (String) userSession.getAttribute(StringUtils.USERNAME);
 String orderSuccess = (String) request.getAttribute("orderSuccess");

%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=contextPath%>/stylesheets/index.css">
    
    
    <title>E.Store</title>
     <style>
     /* Basic reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  padding: 20px; /* Add some padding around the grid */
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Responsive grid, each column min 300px wide */
  gap: 20px; /* Spacing between products */
}

.product {
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 20px;
  text-align: center;
  overflow: hidden; /* Prevents content from overlapping */
}

.product img {
  width: 100%;
  height: auto; /* Change height to auto to maintain aspect ratio */
  max-height: 200px; /* Set a maximum height to prevent overly large images */
  object-fit: contain; /* Keep the aspect ratio and fit within the container */
  border-radius: 5px;
}

.product p {
  margin-top: 10px;
  font-size: 18px; /* Increase font size for product name */
  font-weight: bold; /* Make product name bold */
}

.product p.price {
  font-weight: bold;
  margin: 10px 0;
  font-size: 16px; /* Decrease font size for price */
}

.product button {
  padding: 10px 20px;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.product .add-to-cart {
  background-color: #28a745; /* Green color for add to cart button */
}

.product .buy-now {
  background-color: #007bff; /* Blue color for buy now button */
}

.product button:hover {
  filter: brightness(90%);
}

    </style>
</head>

<body>
  <jsp:include page="/pages/header.jsp"></jsp:include>
    
    <div class="slider">
        <img src="resources/images/electronics.png" alt="" class="sliderImg">
    </div>
 
	<jsp:include page="<%=StringUtils.PAGE_URL_FOOTER%>"></jsp:include>
	
	
	
     <%
    	if(orderSuccess!=null){
    		
    		%>
    	<script type="text/javascript">alert("Prodcuts will be deliver in some time /nThank you")</script>
    	
    <% 
    	
    	}
    %>
	<script type="text/javascript">
    
    </script>
   
</body>

</html>