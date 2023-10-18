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
import static java.lang.System.out;
import java.sql.ResultSet;

import java.util.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author isi
 */
@WebServlet(name = "ThankYouServlet", urlPatterns = {"/thanks"})
public class ThankYouServlet extends HttpServlet {

    private ServiceManager serviceManager;
//    private Order order;
    Date date = new Date();

    @Override
    public void init() throws ServletException {
//        order = new Order();
        this.serviceManager = new ServiceManager();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Customer customer = (Customer) session.getAttribute("customer");
        Timestamp timestamp = new Timestamp(date.getTime());

        HashMap<String, Service> panier = (HashMap<String, Service>) session.getAttribute("listServiceCart");

        try {

            int retourSQL = this.serviceManager.insertSQL("INSERT INTO orders(customer_id, order_date, total_price) VALUES('" + customer.getId() + "','" + timestamp + "','" + session.getAttribute("total") + "')");
            if (retourSQL > 0) {
                ResultSet retourIdSql = this.serviceManager.demandeSQL("SELECT order_id FROM orders WHERE customer_id = '" + customer.getId() + "' AND total_price = '" + session.getAttribute("total") + "'");
                int idOrder = -1;
                while (retourIdSql.next()) {
                    
                    idOrder = retourIdSql.getInt("order_id");
                }
                for (Service valueProduit : panier.values()) {

                    this.serviceManager.insertSQL("INSERT INTO order_details(order_id, service_id, quantity) VALUES('" + idOrder + "','" + valueProduit.getId() + "','" + valueProduit.getQuantity() + "')");
                }
                panier.clear();
                response.sendRedirect("thank_you.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ThankYouServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
