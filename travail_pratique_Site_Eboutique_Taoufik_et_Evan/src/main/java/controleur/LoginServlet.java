/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controleur;

import entities.Customer;
import manager.ServiceManager;
import java.io.IOException;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private ServiceManager serviceManager;

    @Override
    public void init() throws ServletException {

        this.serviceManager = new ServiceManager();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //1 param
        String accountParam = request.getParameter("account");
        //2 redirection
        if (accountParam != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (accountParam.equalsIgnoreCase("disconnect")) {
                    session.removeAttribute("customer");
                }
            }
            //redirection
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //1 param
        String userNameParam = request.getParameter("username");
        String passwordParam = request.getParameter("password");

        String emailParam = request.getParameter("email");
        String passwordRestored = null;
        try {
            ResultSet retourSQL = null;
            if (userNameParam != null && passwordParam != null) {
                retourSQL = this.serviceManager.demandeSQL("SELECT * FROM customers WHERE password = ? AND username = '" + userNameParam + "';", passwordParam);
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

                    HttpSession session = request.getSession(true);
                    if (session != null) {
                        session.setAttribute("customer", customerFromResult);

                    }

                    request.getRequestDispatcher("servlet").forward(request, response);
                    return;
                }
                // forgot password
            } else if (emailParam != null) {
                retourSQL = this.serviceManager.demandeSQL("SELECT password FROM customers WHERE email like ?", emailParam);
                while (retourSQL.next()) {
                    passwordRestored = retourSQL.getString("password");
                }
                if (passwordRestored != null) {
                    request.setAttribute("message", passwordRestored);

                } else {
                    request.setAttribute("message", "Email exist pas!");
                }
                request.getRequestDispatcher("forget_password.jsp").forward(request, response);
                return;

            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("message", "Invalid username or password.");
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }


}
