<%-- 
    Document   : services
    Created on : 7 avr. 2023, 09 h 35 min 25 s
    Author     : isi
--%>

<%@page import="entities.Customer"%>
<%@page import="entities.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Service> services = (ArrayList<Service>) request.getAttribute("listeServices");
    String categorieParam = request.getParameter("categorie");
    Customer customer = (Customer) session.getAttribute("customer");

%>

<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-ico" href="./assets/images/icon.ico">
        <title>All Products</title>
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
        <!-------------- products------------->
        <div class="small-container">
            <div class="row row-2">
                <h2>All Products</h2>
                <div>Price:
                    <% if (categorieParam != null) {%>
                    <a href="servlet?categorie=<%=categorieParam%>&price=desc">High to Low</a>
                    |
                    <a href="servlet?categorie=<%=categorieParam%>&price=asc">Low to High</a>
                    <%} else {%>
                    <a href="servlet?product=product&price=desc">High to Low</a>
                    |
                    <a href="servlet?product=product&price=asc">Low to High</a>
                    <%}%>

                </div>
            </div>
            <div class="row">
                <% for (int i = 0; i < services.size(); i++) {%>
                <div class="col-4">
                    <a href="servlet?id=<%= services.get(i).getId()%>">
                        <img src="./assets/images/<%= services.get(i).getImage()%>" alt="<%= services.get(i).getImage()%>">
                        <h4><%= services.get(i).getName()%></h4>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <p>$<%= services.get(i).getPrice()%></p>
                    </a>
                </div>
                <% }%>
            </div>
            <div class="page-btn">
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>&#8594</span>
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

