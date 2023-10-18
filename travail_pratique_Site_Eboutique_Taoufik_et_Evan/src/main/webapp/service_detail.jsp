<%-- 
    Document   : service_detail
    Created on : 7 avr. 2023, 09 h 37 min 38 s
    Author     : isi
--%>

<%@page import="entities.Customer"%>
<%@page import="entities.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Service> services = (ArrayList<Service>) request.getAttribute("listeServices");
    Customer customer = (Customer) session.getAttribute("customer");
%>

<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detail</title>
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
        <!--------------single products details------------->
        <div class="small-container single-product">
            <div class="row">
                <div class="col-2">
                    <% for (Service service : services) {%>
                    <img src="./assets/images/<%= service.getImage()%>" alt="<%= service.getImage()%>">

                    <div class="small-img-row">
                        <div class="small-img-col">
                            <img class="small-img" src="./assets/images/<%= service.getImage()%>" alt="<%= service.getImage()%>">
                        </div>
                        <div class="small-img-col">
                            <img class="small-img" src="./assets/images/<%= service.getImage()%>" alt="<%= service.getImage()%>">
                        </div>
                        <div class="small-img-col">
                            <img class="small-img" src="./assets/images/<%= service.getImage()%>" alt="<%= service.getImage()%>">
                        </div>
                        <div class="small-img-col">
                            <img class="small-img" src="./assets/images/<%= service.getImage()%>" alt="<%= service.getImage()%>">
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <h1><%= service.getName()%></h1>
                    <h4>$<%= service.getPrice()%></h4>
                    <div>
                        <a href="servlet?categorie=<%= service.getCategory()%>"><%= service.getCategory()%></a>
                    </div>

                    <form action="cartservlet">
                        <input type="number" min="1" value="1" name="quantity">
                        <input value="<%=service.getId()%>" name="serviceId" class="toHide">
                        <input type="submit" value="Add to cart" class="btn">
                    </form>
                    <h3>Details <i class="fa fa-indent"></i></h3>
                    <br>
                    <p><%= service.getDescripton()%></p> 
                </div>
                <% }%>
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





        <!--------js for product gallery------->
        <script>
            var ProductImg = document.getElementById("ProductImg");
            var SmallImg = document.getElementsByClassName("small-img");

            SmallImg[0].onclick = function () {
                ProductImg.src = SmallImg[0].src;
            }
            SmallImg[1].onclick = function () {
                ProductImg.src = SmallImg[1].src;
            }
            SmallImg[2].onclick = function () {
                ProductImg.src = SmallImg[2].src;
            }
            SmallImg[3].onclick = function () {
                ProductImg.src = SmallImg[3].src;
            }

        </script>

    </body>

</html>
