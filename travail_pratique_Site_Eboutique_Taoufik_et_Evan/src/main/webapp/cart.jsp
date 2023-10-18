<%-- 
    Document   : cart
    Created on : 7 avr. 2023, 09 h 37 min 01 s
    Author     : isi
--%>

<%@page import="entities.Order"%>
<%@page import="entities.Customer"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="entities.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HashMap<String, Service> panier = (HashMap<String, Service>) session.getAttribute("listServiceCart");
    ArrayList<Order> historique = (ArrayList<Order>) session.getAttribute("historique");
    double subTotal = 0;
    double tax = 0;
    double total = 0;
    session = request.getSession(false);
    Customer customer = (Customer) session.getAttribute("customer");
%>

<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/styles.css" type="text/css">
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
        <!-------cart items details-------->
        <div class="small-container cart-page">

            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
                <!---------->

                <% if (panier != null && !panier.isEmpty() && session.getAttribute("customer") != null) {
                        for (Service valueProduit : panier.values()) {
                %>
                <form action="cartservlet">
                    <tr>
                        <td>
                            <div class="cart-info">
                                <img src="./assets/images/<%=valueProduit.getImage()%>" alt="pic">
                                <div>
                                    <p><%=valueProduit.getName()%></p>
                                    <small>Price: $<%=valueProduit.getPrice()%></small>
                                    <br> 
                                    <a href="cartservlet?remove=<%=valueProduit.getId()%>">Remove</a>
                                    <%session.setAttribute(valueProduit.getId(), valueProduit);%>
                                </div>
                            </div>
                        </td>
                        <td>
                            <input type="submit" value="+" name="actioncart" class="btn btn-primary">
                            <label for="actioncart"><%=valueProduit.getQuantity()%></label>
                            <input  type="submit" value="-" name="actioncart" class="btn btn-primary">
                            <input type="hidden" name="serviceToModifier" value="<%=valueProduit.getId()%>">
                        </td>
                        <td>$<%=valueProduit.getPrice()%></td>
                    </tr>
                </form>
                <%  subTotal += valueProduit.getPrice() * valueProduit.getQuantity(); %>
                <% }%>
                <% }%>
            </table>


            <!-------total price------->
            <div class="total-price">
                <table>
                    <tr>
                        <td>Subtotal</td>
                        <%subTotal = Math.round(subTotal * 100.0) / 100.0;%>
                        <td>$<%=subTotal%></td>
                    </tr>
                    <tr>
                        <td>Tax</td>
                        <%tax = Math.round((0.05 * subTotal) + (0.09975 * subTotal) * 100.0) / 100.0;%>
                        <td>$<%=tax%></td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <%total = Math.round((subTotal + tax) * 100.0) / 100.0;
                            session.setAttribute("total", total);%>
                        <td>$<%=total%></td>
                    </tr>
                </table>

            </div>
            <% if (panier != null && !panier.isEmpty() && session.getAttribute("customer") != null) {%>

            <div class="d-grid gap-2 col-6 mx-auto">
                <a href="mail" class="btn btn-primary">Buy now</a>
            </div>



            <table border="1">
                <h2>Historique</h2>
                <tr>
                    <th>Order ID</th>
                    <th>Customer ID</th>
                    <th>Date</th>
                    <th>Total Price</th>
                </tr>
                <%if (historique != null) {

                        for (Order order : historique) {%>

                <tr>
                    <td><%=order.getId()%></td>
                    <td><%=order.getCustomerId()%></td>
                    <td><%=order.getDate()%></td>
                    <td><%=order.getTotalPrice()%></td>

                </tr>
                <% }%>
                <% }%>


            </table>
            <% }%>


            <!---------- historique-------->


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
