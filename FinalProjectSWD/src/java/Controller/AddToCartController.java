/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Item;
import Model.Product;
import Services.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/addToCart"})
public class AddToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String productId = request.getParameter("productId");
        String quantityRaw = request.getParameter("quantity");
        List<Item> listI;
        if (session.getAttribute("cart") != null) {
            listI = (List<Item>) session.getAttribute("cart");
        } else {
            listI = new ArrayList<>();
        }
        ProductService serviceP = new ProductService();
        Product p = serviceP.getProductById(productId);
        try {
            int quantity = Integer.parseInt(quantityRaw);
            listI.add(new Item(p, quantity, p.getUnitPrice()));
            session.removeAttribute("cart");
            session.setAttribute("cart", listI);
        } catch (Exception e) {
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        String productIdRaw = request.getParameter("productId");
        String quantityRaw = request.getParameter("quantity");

        List<Item> listI = (List<Item>) session.getAttribute("cart");
        //
        try {
            int productId = Integer.parseInt(productIdRaw);
            int quantity = Integer.parseInt(quantityRaw);
            for(Item i : listI){
                if(i.getProduct().getProductId() == productId && i.getQuantity() == quantity){
                    listI.remove(i);
                }
            }
            session.removeAttribute("cart");
            session.setAttribute("cart", listI);
        } catch (Exception e) {
        }

        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
