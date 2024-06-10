<%@page import="Model.CartModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

    
    
 <%
 ArrayList<CartModel> products =(ArrayList<CartModel>) request.getAttribute("cartList");
 String contextPath = request.getContextPath();
 %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product List</title>
    <style>
      /* CSS styles for product list */
      #product-list {
        max-width: 600px;
        margin: 0 auto;
      }

      .product-row {
        border: 1px solid #eaeaea;
        border-radius: 8px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        padding: 10px;
        margin-bottom: 10px;
        position: relative;
        transition: transform 0.3s ease;
        display: flex;
        align-items: center;
      }

      .product-row:hover {
        transform: translateY(-5px);
      }

      .product-info {
        margin-left: 10px;
        flex-grow: 1;
      }

      .product-name {
        font-size: 16px;
        font-weight: bold;
        color: #333;
      }

      .product-description {
        color: #666;
      }

      .product-quantity {
        color: #333;
      }

      .remove-button {
        background-color: #f44336;
        color: white;
        border: none;
        padding: 8px 16px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 20px; /* Make button more round */
        transition: background-color 0.3s;
      }

      .remove-button:hover {
        background-color: #ff6666;
      }

      /* CSS styles for buy button */
      #buy-form {
        text-align: center;
      }

      .buy-button {
        background-color: #4caf50;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 30px; /* Make button more round */
        transition: background-color 0.3s;
      }

      .buy-button:hover {
        background-color: #45a049;
      }

      /* CSS styles for heading */
      .heading {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
      }

      /* CSS styles for images */
      .product-image {
        width: 60px; /* Adjust size as needed */
        height: auto; /* Maintain aspect ratio */
        border-radius: 8px;
        margin-right: 10px;
      }
    </style>
  </head>
  <body>
   <jsp:include page="/pages/header.jsp"></jsp:include>
    <h1 class="heading">Cart List</h1>

    
      <div id="product-list">
         <c:if test="${empty cartList}">
          <h3 style="margin-left: auto;">NO ITEMS IN THE CART</h3>
        </c:if>
        <c:if test="${not empty cartList}">
          <p>Products found.</p>
          <c:forEach var="product" items="${cartList}">
            <div class="product-row">
              <img class="product-image" src="resources/images/products/${product.imageUrl}" alt="Product Image">
              <div class="product-info">
                <p class="product-name">${product.productName}</p>
                <p class="product-description">${product.description}</p>
                <p class="product-quantity">Product Quantity: ${product.quantity}</p>
               
              </div>
              <form action="<%=contextPath%>/RemoveCart" method="post" > <button type="submit" class="remove-button">Remove</button>
               <input type="hidden" name="cartId" value="${product.cartId}" />
               
               </form> 
            </div>
          </c:forEach>
          
                <form id="buy-form" action="<%=contextPath%>/OrderServlet"  >
      		<input type="submit" class="buy-button" value="Order Now" />
    	</form>
                    
        </c:if>  
      </div>
      
      	<jsp:include page="/pages/footer.jsp"></jsp:include>
      

  </body>
</html>
