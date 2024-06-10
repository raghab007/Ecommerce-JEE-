<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@page import="Model.Order"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% 
    String contextPath = (String) request.getContextPath();
%>

<title>Order History</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0 20%;
        padding-top: 20px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        border-radius: 5px;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s;
        border: 1px solid transparent; /* Added border with transparent color */
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        transition: background-color 0.3s, color 0.3s;
    }
    th {
        background-color: black; /* Changed background color to black */
        color: white; /* Changed font color to white */
        font-weight: bold; /* Made font bold */
        border-bottom: 2px solid transparent; /* Added border bottom with transparent color */
    }
    th:hover {
        border-bottom-color: white; /* Smooth hover effect for border color */
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #e0e0e0;
    }
    td:hover {
        color: #333;
    }
    table:hover {
        box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        border-color: #ddd; /* Smooth hover effect for table border color */
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
        background-color: #ff847c; /* Changed lighter color for button hover */
    }
    .delivered-button {
        background-color: #ccc; /* Changed color for delivered button */
        cursor: not-allowed; /* Changed cursor for delivered button */
    }
    .status-pending {
        background-color: #ffebcc; /* Changed background color for pending status */
    }
    .status-delivered {
        background-color: #ccffcc; /* Changed background color for delivered status */
    }
</style>
</head>
<body>

<h1>Order History</h1>

<table>
    <thead>
        <tr>
            <th>Ordered By</th>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Product Price</th>
            <th>Product Name</th>
            <th>Status</th>
            <th>Finish Order</th>
        </tr>
    </thead>
    <tbody> 
        <c:if test="${not empty orders}">        
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.userName}</td>
                    <td>${order.orderId}</td>
                    <td>${order.orderDate}</td>
                    <td>Rs ${order.productPrice}</td>
                    <td>${order.productName}</td>
                    <td class="<c:if test='${order.status eq "Delivered"}'>status-delivered</c:if><c:if test='${order.status eq "Pending"}'>status-pending</c:if>">${order.status}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 'Delivered'}">
                                <button class="delivered-button" disabled>Finished</button>
                            </c:when>
                            <c:otherwise>
                                <form style="display:inline" id="deleteForm" method="post" action="<%=contextPath%>/ChangeDeliveryStatus">
                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                    <button>Finish</button>    
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </td>  
                </tr>
            </c:forEach>    
        </c:if>
    </tbody>
</table>

</body>
</html>
