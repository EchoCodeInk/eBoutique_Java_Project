/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author isi
 */
public class OrderDetails {

    int id;
    int orderID;
    String serviceID;
    int quantity;

    public OrderDetails() {
    }

    public OrderDetails(OrderDetails orderDetails) {
        this.id = orderDetails.id;
        this.orderID = orderDetails.orderID;
        this.serviceID = orderDetails.serviceID;
        this.quantity = orderDetails.quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
