/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.Payment;

import Model.Order;

/**
 *
 * @author ADMIN
 */
public class PaymentOrder {
    private Order orderId;
    private PaymentGateway paymentId;
    
    private String paymentStatus;
    private String paymentDate;
    private double totalAmount;

    public PaymentOrder() {
    }

    public PaymentOrder(Order orderId, PaymentGateway paymentId, String paymentStatus, String paymentDate, double totalAmount) {
        this.orderId = orderId;
        this.paymentId = paymentId;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
        this.totalAmount = totalAmount;
    }

    public Order getOrderId() {
        return orderId;
    }

    public void setOrderId(Order orderId) {
        this.orderId = orderId;
    }

    public PaymentGateway getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(PaymentGateway paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    
}
