/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import Model.Order;
import Model.Payment.PaymentGateway;
import Model.Payment.PaymentOrder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class PaymentGatewayService extends DBContext {

    public PaymentOrder createPaymentOrder(String orderId, String paymentId, String paymentStatus, String totalAmount) {
        

        PaymentOrder paymentOrder = new PaymentOrder();

        String query = "INSERT INTO [dbo].[PaymentOrder]\n"
                + "           ([orderId]\n"
                + "           ,[paymentStatus]\n"
                + "           ,[paymentDate]\n"
                + "           ,[totalAmount]\n"
                + "           ,[paymentId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,GETDATE()\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            System.out.println("Create Payment Start!");
            ps.setString(1, orderId);
            ps.setString(2, paymentStatus);
            ps.setString(3, totalAmount);
            ps.setString(4, paymentId);
            ps.executeUpdate();
            System.out.println("Create PaymentOrder success!");
        } catch (Exception e) {
        }
        
        PaymentGatewayService servicePay = new PaymentGatewayService();
        
        return servicePay.getPaymentOrderById(orderId, paymentId);
    }

    public PaymentOrder getPaymentOrderById(String orderId, String paymentId) {
        String query = "select * from PaymentOrder as po\n"
                + "where po.orderId = ?\n"
                + "and po.paymentId = ?";
        PaymentOrder payment = new PaymentOrder();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, orderId);
            ps.setString(2, paymentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                //
                OrderService serviceO = new OrderService();
                Order order = serviceO.getOrderById(orderId);
                //
                PaymentGatewayService servicePay = new PaymentGatewayService();
                PaymentGateway paymentMethod = servicePay.getPaymentMethodById(paymentId);
                
                payment = new PaymentOrder(order,
                        paymentMethod,
                        rs.getString("paymentStatus"),
                        rs.getString("paymentDate"),
                        rs.getDouble("totalAmount"));
            }
        } catch (Exception e) {
        }
        return payment;
    }

    public List<PaymentGateway> getAllPaymentMethod() {

        List<PaymentGateway> listP = new ArrayList<>();
        String query = "select * from PaymentGateway";
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listP.add(new PaymentGateway(rs.getInt("paymentId"),
                        rs.getString("paymentMethod")));
            }

        } catch (Exception e) {
        }

        return listP;
    }

    public PaymentGateway getPaymentMethodById(String paymentId) {
        PaymentGateway payment = new PaymentGateway();

        String query = "select * from PaymentGateway as p\n"
                + "where p.paymentId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, paymentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                payment = new PaymentGateway(rs.getInt("paymentId"),
                        rs.getString("paymentMethod"));
            }

        } catch (Exception e) {
        }

        return payment;
    }

    public static void main(String[] args) {
        PaymentGatewayService servicePay = new PaymentGatewayService();
//        List<PaymentGateway> listPay = servicePay.getAllPaymentMethod();
//        for (PaymentGateway p : listPay) {
//            System.out.println(p.getPaymentMethod());
//        }

//        PaymentGateway p = servicePay.getPaymentMethodById("1");
//        System.out.println(p.getPaymentMethod());
//        PaymentOrder payment = servicePay.createPaymentOrder("3", "1", "Processing", 200);
//        System.out.println(payment.getPaymentStatus());
    }

}
