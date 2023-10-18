/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controleur;

import entities.Service;
import manager.ServiceManager;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "ControleurServlet", urlPatterns = {"/servlet"})
public class ControleurServlet extends HttpServlet {

    private ServiceManager serviceManager;

    @Override
    public void init() throws ServletException {

        this.serviceManager = new ServiceManager();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //getparameter
//        String homeParam = request.getParameter("home");
        String productsParam = request.getParameter("products");
        String cartParam = request.getParameter("cart");
        String categorieParam = request.getParameter("categorie");
        String idParam = request.getParameter("id");
        String sortByPrice = request.getParameter("price");

        ArrayList<Service> services = new ArrayList<>();

//        if (request.getParameterMap().isEmpty() || "home".equals(homeParam) || "products".equals(productsParam) || "account".equals(accountParam) || categorieParam != null || idParam != null || cartParam != null || sortByPrice != null) {
        try {
            ResultSet retourSQL = null;
            if (categorieParam != null) {
                if (sortByPrice != null) {
                    retourSQL = this.serviceManager.demandeSQL("select * from services where service_category like ? ORDER BY service_price " + sortByPrice + ";", categorieParam);
                } else {
                    retourSQL = this.serviceManager.demandeSQL("select * from services where service_category like ?", categorieParam);
                }
            } else if (idParam != null) {
                retourSQL = this.serviceManager.demandeSQL("select * from services where service_id like ?", idParam);
            } else {
                if (sortByPrice != null) {
                    retourSQL = this.serviceManager.demandeSQL("select * from services ORDER BY service_price " + sortByPrice + ";");
                } else {
                    retourSQL = this.serviceManager.demandeSQL("select * from services");
                }
            }
            // traitement
            while (retourSQL.next()) {
                Service servicesFromResult = new Service();
                servicesFromResult.setId(retourSQL.getString("service_id"));
                servicesFromResult.setName(retourSQL.getString("service_name"));
                servicesFromResult.setCategory(retourSQL.getString("service_category"));
                servicesFromResult.setDescripton(retourSQL.getString("service_description"));
                servicesFromResult.setPrice(retourSQL.getDouble("service_price"));
                servicesFromResult.setImage(retourSQL.getString("service_image"));

                services.add(new Service(servicesFromResult));
            }
            //setAttribut
            request.setAttribute("listeServices", services);

            if ("products".equals(productsParam) || categorieParam != null || sortByPrice != null) {
                //redirection
                request.getRequestDispatcher("services.jsp").forward(request, response);
            } else if (idParam != null) {
                //redirection
                request.getRequestDispatcher("service_detail.jsp").forward(request, response);
            } else if (cartParam != null) {
                //redirection
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else {
                //redirection
                request.getRequestDispatcher("accueil.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControleurServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

//        }
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
