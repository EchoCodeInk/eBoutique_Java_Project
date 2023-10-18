/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import entities.ConnectionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author isi
 */
public class ServiceManager {

    public ServiceManager() {
    }

    public ResultSet demandeSQL(String query) throws SQLException {
        ConnectionBD connection = new ConnectionBD();
        ResultSet result = connection.demandeSQL(query);
        return result;

    }

    public ResultSet demandeSQL(String query, String param) throws SQLException {
        ConnectionBD connection = new ConnectionBD();
        ResultSet result = connection.demandeSQL(query, param);
        return result;
    }

    public int insertSQL(String query, String username, String password, String email) throws SQLException {
        ConnectionBD connection = new ConnectionBD();
        int result = connection.insertSQL(query, username, password, email);
        return result;
    }

    public int insertSQL(String query) throws SQLException {
        ConnectionBD connection = new ConnectionBD();
        int result = connection.insertSQL(query);
        return result;
    }

    public int updateSQL(String query, String password, String email, String firstName, String lastName, String phone, String address, String city, String state, String zipCode, int id) throws SQLException {
        ConnectionBD connection = new ConnectionBD();
        int result = connection.updateSQL(query, password, email, firstName, lastName, phone, address, city, state, zipCode, id);
        return result;
    }

    public int updateSQL(String query) throws SQLException {
        ConnectionBD connection = new ConnectionBD();
        int result = connection.updateSQL(query);
        return result;
    }
}
