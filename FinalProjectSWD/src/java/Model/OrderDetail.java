
package Model;

public class OrderDetail {

    private String productName;
    private float subtotal;
    private float tax;
    private float total;

    public OrderDetail(String productName, String subtotal,
             String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.total = Float.parseFloat(total);
    }

    public String getProductName() {
        return productName;
    }

    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }

    public String getTax() {
        return String.format("%.2f", tax);
    }

    public String getTotal() {
        return String.format("%.2f", total);
    }
}
