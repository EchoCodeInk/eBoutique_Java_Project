/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controleur;

import manager.ServiceManager;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author isi
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    private ServiceManager serviceManager;

    @Override
    public void init() throws ServletException {
        this.serviceManager = new ServiceManager();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //1 param
        String userNameParam = request.getParameter("username");
        String passwordParam = request.getParameter("password");
        String emailParam = request.getParameter("email");

        try {

            if (userNameParam != null && passwordParam != null && emailParam != null) {
                int retourSQL = this.serviceManager.insertSQL("INSERT INTO customers(username, password, email) VALUES(?,?,?)", userNameParam, passwordParam, emailParam);
                if (retourSQL > 0) {
                    request.setAttribute("message", "Account successfully created.");
                } else {
                    request.setAttribute("message", "inscription failed.");
                }
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
