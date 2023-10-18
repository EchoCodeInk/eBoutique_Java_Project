<%-- 
    Document   : login
    Created on : 7 avr. 2023, 09 h 36 min 06 s
    Author     : isi
--%>
<%@page import="entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    String message = (String) request.getAttribute("message");

%>



<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User informations</title>
        <link rel="stylesheet" href="./assets/css/styles.css" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="shortcut icon" href="./assets/images/x-icon.png" type="image/x-icon">
    </head>

    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="servlet"><img src="./assets/images/iconlogo.png" alt="logo"></a>
                </div>
                <nav>
                    <ul id="menuitems">
                        <li><a href="servlet">home</a></li>
                        <li><a href="servlet?products=products">products</a></li>
                        <li><%= "<a href=\"profil.jsp\" class=\"profil\">" + (customer != null ? customer.getUserName() + "</a><a href=\"login?account=disconnect\"><img src=\"./assets/images/eteindre.png\" alt=\"eteindre\"></a>" : "<a href=\"login?account=connect\">account</a>")%></li>
                    </ul>
                </nav>
                <%= (customer != null ? "<a href=\"servlet?cart=cart\"><img src=\"./assets/images/cart.png\" alt=\"cart\" width=\"30px\" height=\"30px\"></a>" : "")%>
                <img class="menu-icon" src="./assets/images/menu.png" alt="menu" onClick="menutoggle()">
            </div>

        </div>
        <!--(message != "Email exist pas!" ? "<p>Your password is: " + message + "</p>" : "<p>" + message + "</p>")-->
        <!--------account page------->
        <div class="account-page">
            <div class="container">
                <div class="row" >
                    <div class="col-2">
                        <div class="form-container" style="height: 700px;">
                            <div class="form-btn">
                                <h2>User informations</h2>
                            </div>
                            <%= (message != null ? "<p>" + message + "</p>" : "")%>

                            <form id="profil" action="profil?id=<%= customer.getId()%>" method="POST">
                                <input type="text" placeholder="Username" name="username" value="Username: <%= customer.getUserName()%>" required disabled>
                                <input type="email" placeholder="Email" name="email" value="<%= customer.getEmail()%>" required>
                                <input type="text" placeholder="First Name" name="firstname" value="<%= (customer.getFirstName() != null ? customer.getFirstName() : "")%>">
                                <input type="text" placeholder="Last Name" name="lastname" value="<%= (customer.getLastName() != null ? customer.getLastName() : "")%>">
                                <input type="tel" placeholder="Phone: 123-456-7890"  name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="<%= (customer.getPhone() != null ? customer.getPhone() : "")%>">                               
                                <input type="text" placeholder="Address" name="address" value="<%= (customer.getAddress() != null ? customer.getAddress() : "")%>">
                                <input type="text" placeholder="City" name="city" value="<%= (customer.getCity() != null ? customer.getCity() : "")%>">
                                <input type="text" placeholder="State" name="state" value="<%= (customer.getState() != null ? customer.getState() : "")%>">
                                <input type="text" placeholder="Zip Code" name="zipcode" maxlength="20" value="<%= (customer.getZipCode() != null ? customer.getZipCode() : "")%>">
                                <input type="password" placeholder="Password" name="password" value="<%= customer.getPassword()%>" required>
                                <button type="submit" class="btn">Modify</button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-------------footer------------>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>download our app</h3>
                        <p>download app for android and ios mobile phone.</p>
                        <div class="app-loho">
                            <img src="./assets/images/app-store.png" alt="app">
                            <img src="./assets/images/play-store.png" alt="app">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="./assets/images/while-logo.png" alt="logo">
                        <p>our purpose is to sustainably maintain website functionality and performance, develop
                            high-quality websites...
                        </p>
                    </div>
                    <div class="footer-col-3">
                        <h3>useful links</h3>
                        <ul>
                            <li>coupons</li>
                            <li>blog post</li>
                            <li>return policy</li>
                            <li>join affliate</li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>follow us</h3>
                        <ul>
                            <li>facebook</li>
                            <li>twitter</li>
                            <li>instagram</li>
                            <li>youtube</li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!---------- js for toggle menu-------->


    </body>

</html>