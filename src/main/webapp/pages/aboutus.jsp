<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String contextPath =(String) request.getContextPath();
%>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="<%=contextPath%>/stylesheets/aboutus.css">
</head>

<body>


    <div class="contact-container">
        <div class="contact-info">
            <!--About smart home care.-->
            <ul>
                <h2>About Us</h2>
                <p>We deliver happiness not products</p>
                <li><img src="<%=contextPath%>/resources/images/aboutus/phone.png" class="dashboard"><span>Phone Number: +977-984578990</span></li>
                <li><img src="<%=contextPath%>/resources/images/aboutus/location.png" class="dashboard"><span>Location: Baneshowr, kathmandu Nepal </span>
                </li>
                <li><img src="<%=contextPath%>/resources/images/aboutus/email.png" class="dashboard"><span>Email: smarthomecare@gmail.com</span></li>
            </ul>
        </div>
        <div class="contact-form">
            <!-- Customer feedback  -->
            <h2>Send Us a Message</h2>
            <form action="" method="post">

                <div class="customer-mail">
                    <label for="email">Your Email:</label>
                    <input type="email" id="email" name="email" required><br>
                </div>

                <div class="customer-message">
                    <label for="message">Please leave your message here</label>
                    <textarea id="message" name="message" rows="2" required></textarea>
                </div>

                <div class="button">
                    <button type="submit">Send</button>
                </div>

            </form>
        </div>
    </div>
    
    

</body>

</html>