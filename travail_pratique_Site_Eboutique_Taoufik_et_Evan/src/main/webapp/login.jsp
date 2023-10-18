<%-- 
    Document   : login
    Created on : 7 avr. 2023, 09 h 36 min 06 s
    Author     : isi
--%>
<%@page import="entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String message = (String) request.getAttribute("message");
    Customer customer = (Customer) session.getAttribute("customer");
%>



<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account</title>
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

        <!--------account page------->
        <div class="account-page">
            <div class="container">
                <div class="row">
                    <div class="col-2">
                        <div class="form-container">
                            <div class="form-btn">
                                <span onClick="register()">Register</span>
                                <span onClick="login()">Login</span>
                                <hr id="Indicator">
                            </div>
                            <form id="LoginForm" action="login" method="POST">

                                <%= (message != null ? "<p>" + message + "</p>" : "")%>
                                <input type="text" placeholder="Username" name="username" required>
                                <input type="password" placeholder="Password" name="password" required>
                                <button type="submit" class="btn">Login</button>
                                <a href="forget_password.jsp">Forgot password</a>
                            </form>

                            <form id="RegForm" action="register" method="POST">
                                <input type="text" placeholder="Username" name="username" required>
                                <input type="email" placeholder="Email" name="email" required>
                                <input type="password" placeholder="Password" name="password" required>
                                <button type="submit" class="btn">Register</button>
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
        <script>
            var menuitems = document.getElementById("menuitems");

            menuitems.style.maxHeight = "0px";

            function menutoggle() {
                if (menuitems.style.maxHeight == "0px") {
                    menuitems.style.maxHeight = "200px";
                } else {
                    menuitems.style.maxHeight = "0px";
                }
            }
        </script>

        <!-------js for form------->
        <script>
            var LoginForm = document.getElementById("LoginForm");
            var RegForm = document.getElementById("RegForm");
            var Indicator = document.getElementById("Indicator");


            function login() {
                LoginForm.style.transform = "translateX(0px)";
                RegForm.style.transform = "translateX(0px)";
                Indicator.style.transform = "translateX(100px)";
            }

            function register() {
                LoginForm.style.transform = "translateX(300px)";
                RegForm.style.transform = "translateX(300px)";
                Indicator.style.transform = "translateX(0px)";
            }



        </script>

    </body>

</html>