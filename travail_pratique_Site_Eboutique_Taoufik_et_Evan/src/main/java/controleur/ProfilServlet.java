/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controleur;

import entities.Customer;
import manager.ServiceManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet(name = "ProfilServlet", urlPatterns = {"/profil"})
public class ProfilServlet extends HttpServlet {

    private ServiceManager serviceManager;

    @Override
    public void init() throws ServletException {
        this.serviceManager = new ServiceManager();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //1 param
        String passwordParam = request.getParameter("password");
        String emailParam = request.getParameter("email");
        String firstNameParam = request.getParameter("firstname");
        String lastNameParam = request.getParameter("lastname");
        String phoneParam = request.getParameter("phone");
        String addressParam = request.getParameter("address");
        String cityParam = request.getParameter("city");
        String stateParam = request.getParameter("state");
        String zipCodeParam = request.getParameter("zipcode");
        String customerIdParamString = request.getParameter("id");
        int customerIdParam = Integer.parseInt(customerIdParamString);

        try {

            int retourUpdateSQL = this.serviceManager.updateSQL("UPDATE customers SET password = ?, email = ?, first_name = ?, last_name = ?, phone = ?, address = ?, city = ?, state = ?, zip_code = ? WHERE customer_id = ?", passwordParam, emailParam, firstNameParam, lastNameParam, phoneParam, addressParam, cityParam, stateParam, zipCodeParam, customerIdParam);

            if (retourUpdateSQL > 0) {
                request.setAttribute("message", "Your profile has been modified.");
                ResultSet retourSQL = this.serviceManager.demandeSQL("SELECT * FROM customers WHERE customer_id = ?", customerIdParamString);

                while (retourSQL.next()) {
                    Customer customerFromResult = new Customer();
                    customerFromResult.setId(retourSQL.getInt("customer_id"));
                    customerFromResult.setUserName(retourSQL.getString("username"));
                    customerFromResult.setPassword(retourSQL.getString("password"));
                    customerFromResult.setEmail(retourSQL.getString("email"));
                    customerFromResult.setFirstName(retourSQL.getString("first_name"));
                    customerFromResult.setLastName(retourSQL.getString("last_name"));
                    customerFromResult.setPhone(retourSQL.getString("phone"));
                    customerFromResult.setAddress(retourSQL.getString("address"));
                    customerFromResult.setCity(retourSQL.getString("city"));
                    customerFromResult.setState(retourSQL.getString("state"));
                    customerFromResult.setZipCode(retourSQL.getString("zip_code"));
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.setAttribute("customer", customerFromResult);
                    }
                }

            } else {
                request.setAttribute("message", "Failed to modify your profile.");
            }
            request.getRequestDispatcher("profil.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


}
