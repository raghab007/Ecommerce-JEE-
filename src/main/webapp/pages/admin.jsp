<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Product"%>
<%
String contextPath =(String) request.getContextPath();
String alreadyExists = (String) request.getAttribute("alreadyExists");
String productAdded = (String)request.getAttribute("productAdded");

%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin </title>
    <link rel="stylesheet" href="<%=contextPath%>/stylesheets/admin.css">
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
      }

      .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 60%;
        max-width: 500px;
      }

      .close {
        color: #aaa;
        float: right;
        font-size: 24px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: #333;
        text-decoration: none;
        cursor: pointer;
      }

      .form-group {
        margin-bottom: 20px;
      }

      label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
      }

      input[type="text"],
      input[type="number"],
      textarea {
        width: calc(100% - 22px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
        margin-top: 5px;
      }

      textarea {
        resize: vertical;
        min-height: 100px;
      }

      input[type="file"] {
        width: calc(100% - 22px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
        margin-top: 5px;
      }

      button[type="submit"] {
        background-color: #4caf50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
      }

      button[type="submit"]:hover {
        background-color: #45a049;
      }
      
      
      
      
      
      
      
      
      
          body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;

        .custom-modal {
          display: none;
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          overflow: auto;
          background-color: rgba(0, 0, 0, 0.6);
          animation: fadeIn 0.3s ease-out;
        }

        .custom-modal-content {
          background-color: #fefefe;
          margin: 10% auto;
          padding: 10px;
          border-radius: 10px;
          box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
          width: 50%; /* Decreased width */
          max-width: 400px; /* Decreased max-width */
          animation: slideIn 0.5s ease-out;
        }

        .custom-close {
          color: #aaa;
          float: right;
          font-size: 24px;
          font-weight: bold;
          cursor: pointer;
          transition: color 0.3s;
        }

        .custom-close:hover {
          color: #333;
        }

        .custom-form-group {
          margin-bottom: 15px; /* Decreased margin */
        }

        .custom-label {
          display: block;
          font-weight: bold;
          margin-bottom: 5px;
        }

        .custom-input,
        .custom-textarea {
          width: calc(100% - 22px);
          padding: 8px; /* Decreased padding */
          border: 1px solid #ccc;
          border-radius: 3px;
          font-size: 14px; /* Decreased font size */
          box-sizing: border-box;
          margin-top: 5px;
          transition: border-color 0.3s, box-shadow 0.3s;
        }

        .custom-input:hover,
        .custom-textarea:hover {
          border-color: #999; /* Hover effect */
        }

        .custom-textarea {
          resize: vertical;
          min-height: 80px; /* Decreased min-height */
        }

        .custom-file-input {
          width: calc(100% - 22px);
          padding: 8px;
          border: 1px solid #ccc;
          border-radius: 3px;
          font-size: 14px;
          box-sizing: border-box;
          margin-top: 5px;
          transition: border-color 0.3s, box-shadow 0.3s;
        }

        .custom-file-input:hover {
          border-color: #999; /* Hover effect */
        }

        .custom-btn {
          background-color: #4caf50;
          color: white;
          padding: 10px 15px; /* Decreased padding */
          border: none;
          border-radius: 3px;
          cursor: pointer;
          font-size: 14px; /* Decreased font size */
          transition: background-color 0.3s;
        }

        .custom-btn:hover {
          background-color: #45a049;
        }

        @keyframes slideIn {
          from {
            transform: translateY(-50px);
            opacity: 0;
          }
          to {
            transform: translateY(0);
            opacity: 1;
          }
        }

        @keyframes fadeIn {
          from {
            opacity: 0;
          }
          to {
            opacity: 1;
          }
        }
      }
      
      
      
         .custom-input {
        position: relative;
        display: inline-block;
      }

      .custom-input select {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
      }

      .custom-input select option {
        padding: 10px;
      }
      
      
      
          /* CSS styles */
      .custom-modal2 {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
      }

      .custom-modal-content2 {
        background-color: #f9f9f9;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #ddd;
        width: 70%;
        max-width: 400px;
        position: relative;
        animation-name: modalopen;
        animation-duration: 0.5s;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      @keyframes modalopen {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }

      .custom-close2 {
        position: absolute;
        top: 0;
        right: 10px;
        font-size: 24px;
        cursor: pointer;
        color: #555;
      }

      .custom-close2:hover,
      .custom-close2:focus {
        color: #000;
      }

      .custom-modal-content2 h2 {
        text-align: center;
        color: #333;
      }

      .custom-form-group2 {
        margin-bottom: 15px;
      }

      .custom-form-group2 label {
        display: block;
        font-weight: bold;
        color: #555;
      }

      .custom-form-group2 input[type="text"],
      .custom-form-group2 input[type="number"],
      .custom-form-group2 textarea,
      .custom-form-group2 select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }

      .custom-form-group2 select {
        padding: 8px 38px 8px 8px; /* To adjust for the dropdown arrow */
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        background-image: url('data:image/svg+xml;utf8,<svg fill="#555" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
        background-repeat: no-repeat;
        background-position: right 8px center;
      }

      .custom-form-group2 textarea {
        resize: vertical;
        min-height: 100px;
      }

      .custom-form-group2 input[type="file"] {
        padding: 5px;
      }

      button[type="submit"] {
        background-color: #4caf50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
      }

      button[type="submit"]:hover {
        background-color: #45a049;
      }
      
      
      
    </style>
</head>
<body>
    <div class="container">
        <nav class="sidebar">
            <div class="logo-details">
                <img src="<%=contextPath%>/resources/images/admin/icons8-smart-home-50.png" class="logo">
                <div class="title">
                    <h4>Smart Home Care</h4>
                    <p>One Solution for Every Problem</p>
                </div>
            </div>
            <ul>
                <li><img src="<%=contextPath%>/resources/images/admin/dashboard.png" class="dashboard"><span>Dashboard</span></li>
                <li><img src="<%=contextPath%>/resources/images/admin/group.png" class="users"><span>User</span></li>
                <li><img src="<%=contextPath%>/resources/images/admin/in-stock.png" class="product"><form action="<%=contextPath%>/AdminProducts" method="post" ><span><button class="openFormBtn" class="custom-btn">Products</button></span></form></li>
                <li><img src="<%=contextPath%>/resources/images/admin/order-delivery.png" class="order"><form action="<%=contextPath%>/AllOrders" method="post" ><span><button class="openFormBtn" class="custom-btn">Order history</button></span></form></li>
                <li><img src="<%=contextPath%>/resources/images/admin/settings.png" class="setting"><form action="<%=contextPath%>/AdminProfileServlet"><span><button class="openFormBtn"  class="custom-btn">Setting</button></span></form></li>
                <li><img src="<%=contextPath%>/resources/images/admin/out.png" class="dashboard">,<form action="<%=contextPath%>/logout" method="post" ><span><button class="openFormBtn" class="custom-btn">Logout</button></span></form></li>

            </ul>
        </nav>
        <div class="main-content">
            <div class="action-row">
                <div class="card">
                    <a href="#"><img src="<%=contextPath%>/resources/images/admin/add-product.png">
                     <button id="openUpdateButton" class="custom-btn">Update Product</button>
                       
                    </a>
                </div>
                <div class="card">
                    <a href="#"><img src="<%=contextPath%>/resources/images/admin/add-product.png">
                     <button id="openCustomFormBtn" class="custom-btn">Add Product</button>
                       
                    </a>
                </div>
                <div class="card">
                    <a href="#"> <img src="<%=contextPath%>/resources/images/admin/remove.png">
                        <button style="background: red" id ="openDeleteBtn" class="custom-btn">Delete Product</button>
                    </a>
                </div>
            </div>

            <div>
                
                
            </div>
        </div>
    </div>
    

    
 
<form action="<%=contextPath%>/AddProduct" method="post">
	<label></label>
	
</form>

   <!-- Button to open the modal -->
   

    <!-- The Modal -->
    <div id="deleteForm" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        
        <h2 style="text-align: center">Delete Product</h2>
        <form
          id="productForm"
          action="<%=contextPath%>/DeleteProduct"
          method="post"
         
        >
          <div class="form-group">
            <label for="productName">Product ID:</label>
            <input type="number" id="productID" name="productId" required />
          </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>
    
    
    
    
    <!--Add product model  -->
      <div id="customProductForm" class="custom-modal">
      <div class="custom-modal-content">
        <span class="custom-close">&times;</span>
        <h2 style="text-align: center">Add Product</h2>
        <form action = "<%= contextPath%>/AddProduct" method="post" id="customProductForm" enctype="multipart/form-data">
          <div class="custom-form-group">
            <label for="customProductId" class="custom-label"
              >Product ID:</label
            >
            <input
              type="text"
              id="customProductId"
              name="productId"
              class="custom-input"
              required
            />
          </div>

          <div class="custom-form-group">
            <label for="customProductName" class="custom-label"
              >Product Name:</label
            >
            <input
              type="text"
              id="customProductName"
              name="productName"
              class="custom-input"
              required
            />
          </div>

          <div class="custom-form-group">
            <label for="customProductDescription" class="custom-label"
              >Description:</label
            >
            <textarea
              id="customProductDescription"
              name="productDescription"
              class="custom-textarea"
              required
            ></textarea>
          </div>

          <div class="custom-form-group">
            <label for="customProductPrice" class="custom-label">Price:</label>
            <input
              type="number"
              id="customProductPrice"
              name="productPrice"
              class="custom-input"
              required
            />
          </div>

          
         
          <div class="custom-input drop-down">
           <label for="appliance" class="custom-label">Category ID:</label>
        <select id="appliance" name="categoryId">
          <option value="1">Vacuum Cleaner</option>
          <option value="2">Refrigerator</option>
          <option value="3">Air Conditioner</option>
          <option value="4">Washing Machine</option>
       	 </select>
      		</div>

          <div class="custom-form-group">
            <label for="customProductQuantity" class="custom-label"
              >Quantity:</label
            >
            <input
              type="number"
              id="customProductQuantity"
              name="productQuantity"
              class="custom-input"
              required
            />
          </div>

          <div class="custom-form-group">
            <label for="customProductImage" class="custom-label"
              >Product Image:</label
            >
            <input
              type="file"
              id="customProductImage"
              name="productImage"
              class="custom-file-input"
              accept="image/*"
            />
          </div>

          <button type="submit" class="custom-btn">Submit</button>
        </form>
      </div>
    </div>
    
    
    
    
        <!-- Update product model -->
    <div id="customProductForm2" class="custom-modal2">
      <div class="custom-modal-content2">
        <span class="custom-close2">&times;</span>
        <h2>Update Product</h2>
        <form
          action="<%= contextPath%>/UpdateProduct"
          method="post"
          id="productForm2"
          enctype="multipart/form-data"
        >
          <div class="custom-form-group2">
            <label for="customProductId">Product ID:</label>
            <input type="text" id="customProductId" name="productId" required />
          </div>
          <div class="custom-form-group2">
            <label for="customProductName">Product Name:</label>
            <input
              type="text"
              id="customProductName"
              name="productName"
              required
            />
          </div>
          <div class="custom-form-group2">
            <label for="customProductDescription">Description:</label>
            <textarea
              id="customProductDescription"
              name="productDescription"
              required
            ></textarea>
          </div>
          <div class="custom-form-group2">
            <label for="customProductPrice">Price:</label>
            <input
              type="number"
              id="customProductPrice"
              name="productPrice"
              required
            />
          </div>
          <div class="custom-form-group2">
            <label for="appliance">Category ID:</label>
            <select id="appliance" name="categoryId">
              <option value="1">Vacuum Cleaner</option>
              <option value="2">Refrigerator</option>
              <option value="3">Air Conditioner</option>
              <option value="4">Washing Machine</option>
            </select>
          </div>
          <div class="custom-form-group2">
            <label for="customProductQuantity">Quantity:</label>
            <input
              type="number"
              id="customProductQuantity"
              name="productQuantity"
              required
            />
          </div>
          <div class="custom-form-group2">
            <label for="customProductImage">Product Image:</label>
            <input
              type="file"
              id="customProductImage"
              name="productImage"
            />
          </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>
    
    
    
    
    
    
    
    
    <%
    	if(alreadyExists!=null){
    		
    		%>
    	<script type="text/javascript">alert("Product Id already exists")</script>
    	
    <% 
    	
    	}
    %>
    
    
     <%
    	if(productAdded!=null){
    		
    		%>
    	<script type="text/javascript">alert("Product Add ")</script>
    	
    <% 
    	
    	}
    %>
    
    
    
    

    
<script>
      var modal = document.getElementById("deleteForm");

      var btn = document.getElementById("openDeleteBtn");

      btn.addEventListener("click", function () {
        modal.style.display = "block";
      });

      window.addEventListener("click", function (event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      });
    </script>
    
    
   <script>
      document
        .getElementById("openCustomFormBtn")
        .addEventListener("click", function () {
          document.getElementById("customProductForm").style.display = "block";
        });

      document
        .querySelector(".custom-close")
        .addEventListener("click", function () {
          document.getElementById("customProductForm").style.display = "none";
        });
    </script>
    
    
    
    
      <script>
      // JavaScript for opening, closing, and submitting the form
      document.addEventListener("DOMContentLoaded", function () {
        var modal = document.getElementById("customProductForm2");

        var btn = document.getElementById("openUpdateButton");

        var span = document.querySelector(".custom-close2");
        btn.onclick = function () {
          modal.style.display = "block";
        };
        span.onclick = function () {
          modal.style.display = "none";
        };
        window.onclick = function (event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        };

       
      });
    </script>
    
    
  
</body>
</html>
