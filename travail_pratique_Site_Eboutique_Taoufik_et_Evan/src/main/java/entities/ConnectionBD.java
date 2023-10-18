/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author isi
 */
public class ConnectionBD {

    Connection connection;

    public ConnectionBD() {
        try {
            //connexion a la bd

            Class.forName("org.mariadb.jdbc.Driver");  //charger le diver MariaDB
            String urlServeur = "jdbc:mariadb://localhost:3308/eboutique";
            String identifiant = "root";
            String motDePasse = "abc123...";
            Connection connection = DriverManager.getConnection(urlServeur, identifiant, motDePasse);
             // Vérification de la connexion
        if (connection != null) {
            System.out.println("Connexion à la base de données établie avec succès.");
        } else {
            System.out.println("La connexion à la base de données a échoué.");
        }
            
            this.connection = connection;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnectionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet demandeSQL(String query) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet result = preparedStatement.executeQuery();
        this.connection.close();

        return result;
    }

    public ResultSet demandeSQL(String query, String param) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, param);
        ResultSet result = preparedStatement.executeQuery();
        this.connection.close();

        return result;
    }

    public int insertSQL(String query) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);

        int result = preparedStatement.executeUpdate();
        this.connection.close();

        return result;
    }

    public int insertSQL(String query, String username, String password, String email) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        preparedStatement.setString(3, email);

        int result = preparedStatement.executeUpdate();
        this.connection.close();

        return result;
    }

    public int updateSQL(String query, String password, String email, String firstName, String lastName, String phone, String address, String city, String state, String zipCode, int id) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, password);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, firstName);
        preparedStatement.setString(4, lastName);
        preparedStatement.setString(5, phone);
        preparedStatement.setString(6, address);
        preparedStatement.setString(7, city);
        preparedStatement.setString(8, state);
        preparedStatement.setString(9, zipCode);
        preparedStatement.setInt(10, id);
        int result = preparedStatement.executeUpdate();
        this.connection.close();
        return result;
    }
    
    public int updateSQL(String query) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        int result = preparedStatement.executeUpdate();
        this.connection.close();
        return result;
    }

}
