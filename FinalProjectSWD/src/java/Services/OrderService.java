/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import Model.Item;
import Model.Order;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class OrderService extends DBContext {

    public void createItem(int orderId, Item i) {
        String query = "INSERT INTO [dbo].[Item]\n"
                + "           ([orderId]\n"
                + "           ,[productId]\n"
                + "           ,[quantity]\n"
                + "           ,[unitPrice])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            System.out.println("Start create Item!");
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.setInt(2, i.getProduct().getProductId());
            ps.setInt(3, i.getQuantity());
            ps.setDouble(4, i.getUnitPrice());
            
            ps.executeUpdate();
            System.out.println("create Item Success!");
        } catch (Exception e) {
        }
    }

    public Order getOrderById(String orderId) {
        Order order = new Order();

        String query = "select * from [Order] as o\n"
                + "where o.orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order(rs.getInt("userId"),
                        rs.getInt("orderId"),
                        rs.getString("creationDate"),
                        rs.getDouble("totalAmount"));

            }
        } catch (Exception e) {
        }

        return order;
    }

    public Order createOrder(int userId, String totalAmount) {

        String query = "INSERT INTO [dbo].[Order]\n"
                + "           ([userId]\n"
                + "           ,[creationDate]\n"
                + "           ,[totalAmount])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,GETDATE()\n"
                + "           ,?)";
        Order order = new Order();

        try {

            System.out.println("Start create!");

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, totalAmount);
            ps.executeUpdate();

            System.out.println("create Success");
        } catch (Exception e) {
        }

        query = "select top(1) * from [Order] as o\n"
                + "order by o.orderId desc";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order(rs.getInt("userId"),
                        rs.getInt("orderId"),
                        rs.getString("creationDate"),
                        rs.getDouble("totalAmount"));

            }
        } catch (Exception e) {
        }

        return order;
    }

    public static void main(String[] args) {
        OrderService serviceO = new OrderService();
        Order o = serviceO.createOrder(3, "200");
        System.out.println(o.getOrderId());
//        Order newOrder = serviceO.getOrderById("4");
//        System.out.println(newOrder.getTotalAmount() + "|" + newOrder.getCreationDate());
//        Product p = new Product();
//        p.setProductId(3);
//        serviceO.createItem(8, new Item(p,2,650));
    }
}
