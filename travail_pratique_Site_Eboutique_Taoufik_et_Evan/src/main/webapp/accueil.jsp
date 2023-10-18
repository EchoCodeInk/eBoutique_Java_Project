<%-- 
    Document   : acceuil
    Created on : 7 avr. 2023, 09 h 01 min 27 s
    Author     : isi
--%>

<%@page import="entities.Customer"%>
<%@page import="entities.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Service> services = (ArrayList<Service>) request.getAttribute("listeServices");
    ArrayList<Service> cookies = (ArrayList<Service>) session.getAttribute("listServiceCookies");
    Customer customer = (Customer) session.getAttribute("customer");
    session = request.getSession(false);

%>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/styles.css" type="text/css">

        <link rel="shortcut icon" href="./assets/images/x-icon.png" type="image/x-icon">
    </head>

    <body>
        <header>
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
                <div class="row">
                    <div class="col-2">
                        <h1>Find the perfect freelance<br />services for your business</h1>
                        <a href="servlet?products=products" class="btn">explore now &#8594</a>
                    </div>
                    <div class="col-2">
                        <img src="./assets/images/freelance.png" alt="freelance">
                    </div>
                </div>
            </div>
        </header>

        <!-------------- featured categories------------->
        <div class="categories">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <a href="servlet?categorie=webProgramming">
                            <img src="./assets/images/web-programming.png" alt="">
                            <h4>web programming</h4>
                        </a>
                    </div>
                    <div class="col-3">
                        <a href="servlet?categorie=websiteMaintenance">
                            <img src="./assets/images/website-maintenance.png" alt="">
                            <h4>website maintenance</h4>
                        </a>
                    </div>
                    <div class="col-3">
                        <a href="servlet?categorie=websiteDevelopment">
                            <img src="./assets/images/website-development.png" alt="">
                            <h4>website development</h4>
                        </a>
                    </div>
                    <div class="col-3">
                        <a href="servlet?categorie=databases">
                            <img src="./assets/images/databases.png" alt="">
                            <h4>databases</h4>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-------------- Featured Services------------->



        <div class="small-container">
            <h2 class="title">featured services</h2>
            <div class="row">
                <% for (int i = 0; i < 4; i++) {%>
                <div class="col-4">
                    <a href="servlet?id=<%= services.get(i).getId()%>">
                        <img src="./assets/images/<%= services.get(i).getImage()%>" alt="<%= services.get(i).getImage()%>">
                        <h4><%= services.get(i).getName()%></h4>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <p>$<%= services.get(i).getPrice()%></p>
                    </a>
                </div>
                <% }%>
            </div>




            <!-------------- Latest Services Visited ------------->



            <% if (cookies != null && customer != null) {  %>
            <h2 class="title">Latest services Visited</h2>
            <div class="row">
                <% for (int i = 0; i < cookies.size(); i++) {%>
                <div class="col-4">
                    <a href="servlet?id=<%= cookies.get(i).getId()%>">
                        <img src="./assets/images/<%= cookies.get(i).getImage()%>" alt="<%= cookies.get(i).getImage()%>">
                        <h4><%= cookies.get(i).getName()%></h4>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <p>$<%= cookies.get(i).getPrice()%></p>
                    </a>
                </div>
                <% }%>
                <% }%>
            </div>
        </div>
        <!-----------------offer-------------->
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <img src="./assets/images/exclusive.png" class="offer-img" alt="smart">
                    </div>
                    <div class="col-2">
                        <h1>Programming & Tech</h1>
                        <p>You think it. A programmer develops it. </p>
                        <a class="btn" href="servlet?products=products">explore now &#8594</a>
                    </div>
                </div>
            </div>
        </div>
        <!------------------ testimonial--------------->
        <div class="testimonial">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                            the industry's standard dummy text ever since the 1500s</p>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <img src="./assets/images/user-1.png" alt="user1">
                        <h3>Taoufik Boussemousse </h3>
                    </div>

                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                            the industry's standard dummy text ever since the 1500s</p>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <img src="./assets/images/user-2.png" alt="user1">
                        <h3>Evan Cholette</h3>
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
    </body>

</html>
