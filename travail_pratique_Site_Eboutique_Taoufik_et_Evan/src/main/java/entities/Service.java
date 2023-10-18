/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author isi
 */
public class Service {

    String id;
    String name;
    String category;
    String descripton;
    String image;
    double price;
    double quantity;

    public Service() {
    }

    public Service(Service service) {
        this.id = service.id;
        this.name = service.name;
        this.category = service.category;
        this.descripton = service.descripton;
        this.price = service.price;
        this.image = service.image;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public Service(String id, String name, String category, String descripton, double price, String image, double quantity) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.descripton = descripton;
        this.price = price;
        this.image = image;
        this.quantity = quantity;

    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setDescripton(String descripton) {
        this.descripton = descripton;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getDescripton() {
        return descripton;
    }

    public double getPrice() {
        return price;
    }

}
