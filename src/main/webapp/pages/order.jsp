<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.Product"%>

<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utils.StringUtils"%>
   
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>    
 <%    
 String contextPath = request.getContextPath();
 String totalPrice =(String) request.getAttribute("totalPrice");
 
 
 
 %> 
 <!DOCTYPE html>  
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Smart Home Care - Checkout</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
      }

      header {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 20px 0;
      }

      h1 {
        margin: 0;
      }

      main {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
      }

      .product {
        background-color: white;
        padding: 10px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        width: 300px;
        transition: transform 0.3s ease-in-out;
      }

      .product:hover {
        transform: scale(1.05);
      }

      .product-details {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .product-name {
        font-weight: bold;
        margin-bottom: 5px;
        font-size: 18px;
      }

      .product-quantity {
        margin-bottom: 5px;
      }

      .product-price {
        font-size: 16px;
        color: #007bff;
        margin-bottom: 5px;
      }

      .prices {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        margin-bottom: 20px;
      }

      .button-container {
        display: flex;
        justify-content: space-between;
        width: 300px;
      }

      .button {
        width: 45%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      .button:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <header>
      <jsp:include page="/pages/header.jsp"></jsp:include>
    
      <h1>Smart Home Care</h1>
    </header>
    <form action="<%=contextPath %>/CreateOrder" method="post">
      <main>  
       <c:if test="${not empty order}">
        <c:forEach var="product" items="${order}">
         <div class="product">
          <div class="product-details">
            <div class="product-name">${product.productName}</div>
            <p class="product-quantity">${product.quantity}</p>
            <p class="product-price">Rs:${product.price}</p>
          </div>
        </div>
        </c:forEach>
       </c:if>
        	
     
        
        <div class="prices">
          <h2>Prices</h2>
          <p>Total Price:Rs <%=totalPrice %></p>
          <p>Delivery Price: Free</p>
        </div>
        <div class="button-container">
          <button type="submit" class="button"> Confirm Order</button>
          <button type="button" class="button" onclick="cancelOrder()">
            Cancel 
          </button>
        </div>
      </main>
    </form>
    
    	<jsp:include page="/pages/footer.jsp"></jsp:include>
    

    <script>
      function cancelOrder() {
        alert("Order Cancelled!");
      }
    </script>
  </body>
</html>
    