/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controleur;

import entities.Customer;
import entities.Service;
import java.io.IOException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manager.MailManager;

/**
 *
 * @author jlidou
 */
@WebServlet("/mail")
public class MailControler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get param
        HttpSession session = request.getSession(false);
        Customer customer = (Customer) session.getAttribute("customer");
        HashMap<String, Service> panier = (HashMap<String, Service>) session.getAttribute("listServiceCart");

        try {
            if (!panier.isEmpty()) {

                //2 traitement
                String mesasge = "<html>\n";
                mesasge += "<body>\n";
                mesasge += "<h1>Hello " + customer.getFirstName() + " " + customer.getLastName() + "</h1>\n";
                mesasge += "<p>Votre commande a bien été valider. </p>\n";

                for (Service valueProduit : panier.values()) {

                    mesasge += "<div> Nom du service : " + valueProduit.getName() + "</div>\n";
                    mesasge += "<div> Prix           : $" + valueProduit.getPrice() + "</div>\n";
                    mesasge += "<div> Quantity       : " + valueProduit.getQuantity() + "</div>\n";

                }

                mesasge += "</body>\n"
                        + "</html>";

                MailManager.sendEmail(mesasge, customer.getEmail(), "Votre commande a bien été valider.");
            }
            
            

        } catch (MessagingException ex) {
            Logger.getLogger(MailControler.class.getName()).log(Level.SEVERE, null, ex);
        }

        //redirection
        request.getRequestDispatcher("thanks").forward(request, response);

    }

}
