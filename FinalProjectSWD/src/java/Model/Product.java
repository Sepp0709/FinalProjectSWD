/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Product {
    private int productId;
    private int userId;
    private int categoryId;
    private double unitPrice;
    private String productDescription;
    private String productName;
    private String image;
    private int quantity;

    public Product() {
    }

    public Product(int productId, int userId, int categoryId, double unitPrice, String productDescription, String image, int quantity) {
        this.productId = productId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.unitPrice = unitPrice;
        this.productDescription = productDescription;
        this.image = image;
        this.quantity = quantity;
    }

    public Product(int productId, int userId, int categoryId, double unitPrice, String productDescription, String productName, String image, int quantity) {
        this.productId = productId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.unitPrice = unitPrice;
        this.productDescription = productDescription;
        this.productName = productName;
        this.image = image;
        this.quantity = quantity;
    }
    
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    
    
}
