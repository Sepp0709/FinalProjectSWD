/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProductService extends DBContext {

    public List<Product> getAllProduct() {

        List<Product> listP = new ArrayList<>();
        String query = "select * from Product";
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listP.add(new Product(rs.getInt("productId"),
                        rs.getInt("userId"),
                        rs.getInt("categoryId"),
                        rs.getDouble("unitPrice"),
                        rs.getString("productDescription"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getInt("quantity")));
            }

        } catch (Exception e) {
        }

        return listP;
    }

    public Product getProductById(String productId) {
        Product p = new Product();
        String query = "select * from  Product as p\n"
                + "where p.productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, productId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                p = new Product(rs.getInt("productId"),
                        rs.getInt("userId"),
                        rs.getInt("categoryId"),
                        rs.getDouble("unitPrice"),
                        rs.getString("productDescription"),
                        rs.getString("productName"),
                        rs.getString("image"),
                        rs.getInt("quantity"));
            }
        } catch (Exception e) {
        }
        return p;
    }
    
    public static void main(String[] args) {
        ProductService serviceP = new ProductService();
//        List<Product> listP = serviceP.getAllProduct();
//        for(Product p : listP){
//            System.out.println(p.getProductName());
//        }

//        Product p = serviceP.getProductById(3);
//        System.out.println(p.getProductName());
    }

}
