<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Product"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String contextPath = (String) request.getContextPath();
%>

    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
  }
  th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    transition: background-color 0.3s;
  }
  th {
    background-color: #4CAF50;
    color: white;
  }
  tr:hover {
    background-color: #f0f0f0;
  }
  tr:hover td {
    background-color: #e5e5e5;
  }
  img {
    max-width: 50px;
    max-height: 50px;
  }
  button {
    padding: 8px 12px;
    background-color: #ff6347;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
  }
  button:hover {
    background-color: #cc4c39;
  }
</style>
</head>
<body>

	<h1 style="margin: auto">All Products</h1>

<table>
  <thead>
    <tr>
      <th>Product ID</th>
      <th>Product Name</th>
      <th>Price</th>
      <th>Category</th>
      <th>Quantity</th>
      <th>Delete</th>
    </tr>
  </thead>
  <tbody> 
  	
    <c:if test="${not empty productList}">		
		<c:forEach var="product" items="${productList}">
		<tr>
	      <td>${product.productId}</td>
	      <td>${product.productName}</td>
	      <td>${product.price}</td>
	      <td>${product.categoryId}</td>
	      <td>${product.quantity}</td>
	      <td><form style="display:inline" id="deleteForm" method="post" action="<%=contextPath%>/DeleteProduct">
    	 <input type="hidden" name="productId" value="${product.productId}">
  		<button>Delete</button>	
		</form></td>
	       
	      
    	</tr>
    	
    
		</c:forEach>	
		
	
	</c:if>
  </tbody>
</table>



</body>
</html>
    