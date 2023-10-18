/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controleur;

import entities.Customer;
import entities.Order;
import entities.Service;
import manager.ServiceManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author isi
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cartservlet"})
public class CartServlet extends HttpServlet {

    private ServiceManager serviceManager;
    private HashMap panier;
    private ArrayList cookies;

    @Override
    public void init() throws ServletException {

        this.serviceManager = new ServiceManager();
        this.panier = new HashMap();
        this.cookies = new ArrayList<>();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //get param
        String quantityParam = request.getParameter("quantity");

        String idParam = request.getParameter("serviceId");

        String actioncartParam = request.getParameter("actioncart");

        String serviceToModifierParam = request.getParameter("serviceToModifier");

        String removeParam = request.getParameter("remove");

        //mettre la main sur la session;    
        HttpSession session = request.getSession(false);

        Customer customer = (Customer) session.getAttribute("customer");

        String redirection = "";

        try {
            ResultSet retourSQL = null;
            if (idParam != null && session.getAttribute("customer") != null) {
                retourSQL = this.serviceManager.demandeSQL("select * from services where service_id like ?", idParam);

                // traitement
                Service servicesFromResult = new Service();
                while (retourSQL.next()) {
                    servicesFromResult.setId(retourSQL.getString("service_id"));
                    servicesFromResult.setName(retourSQL.getString("service_name"));
                    servicesFromResult.setCategory(retourSQL.getString("service_category"));
                    servicesFromResult.setDescripton(retourSQL.getString("service_description"));
                    servicesFromResult.setPrice(retourSQL.getDouble("service_price"));
                    servicesFromResult.setImage(retourSQL.getString("service_image"));
                    if (quantityParam != null) {
                        double quantityParamConversion = Double.parseDouble(quantityParam);
                        servicesFromResult.setQuantity(quantityParamConversion);
                    }

                    //étape 1 instanciation du cookie
                    Cookie userIdCookie = new Cookie(servicesFromResult.getId(), session.getId());
                    //étape 2 definition de la durée de vie en seconde
                    userIdCookie.setMaxAge(60 * 60 * 24 * 365); //donc ici pour un an
                    //ajout du cookie à la réponse
                    response.addCookie(userIdCookie);

                    //ajout du service au panier(hashMap)
                    this.panier.put(servicesFromResult.getId(), servicesFromResult);

                    //recupere les cookies 
                    this.cookies.add(servicesFromResult);

                    //ajout du panier(hashMap) a la session
                    session.setAttribute("listServiceCart", this.panier);
                    session.setAttribute("listServiceCookies", this.cookies);

                    redirection = "sendRedirect";

                }
                String idParamm = String.valueOf(customer.getId());
                retourSQL = this.serviceManager.demandeSQL("select * from orders where customer_id like ?", idParamm);
                ArrayList<Order> historique = new ArrayList<>();
                // traitement

                while (retourSQL.next()) {
                    Order servicesFromResultHistorique = new Order();
                    servicesFromResultHistorique.setId(retourSQL.getString("order_id"));
                    servicesFromResultHistorique.setCustomerId(retourSQL.getString("customer_id"));
                    servicesFromResultHistorique.setDate(retourSQL.getDate("order_date"));
                    servicesFromResultHistorique.setTotalPrice(retourSQL.getDouble("total_price"));

                    historique.add(servicesFromResultHistorique);
                    session.setAttribute("historique", historique);
                }
              
                session.setAttribute("historique", historique);
            }

            if (removeParam != null) {

                this.panier.remove(removeParam);

            }

            if (actioncartParam != null) {
                if ("+".equals(actioncartParam)) {
                    Service serviceValue = (Service) this.panier.get(serviceToModifierParam);
                    double quantityToIncrement = serviceValue.getQuantity();
                    serviceValue.setQuantity(++quantityToIncrement);
                } else {
                    Service makey = (Service) this.panier.get(serviceToModifierParam);
                    double quantityToIncrement = makey.getQuantity();
                    makey.setQuantity(--quantityToIncrement);
                    if (makey.getQuantity() <= 0) {
                        this.panier.remove(serviceToModifierParam);
                    }

                }

                redirection = "sendRedirect";
            }

            //redirection
            if (customer == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (redirection.equals("sendRedirect")) {
                response.sendRedirect("cartservlet");
            } else {
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
