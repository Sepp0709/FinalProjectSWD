<%-- 
    Document   : cart
    Created on : 11-Jun-2023, 20:16:15
    Author     : Hoang Long
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/icon.jpg" type="image/x-icon"/>
        <title>Ulta Beauty</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Topbar Start --> 
        <%@include file="header.jsp" %>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">

                <div class="col-lg-9">
                    <%@include file="right-page.jsp" %>
                </div>
            </div>
        </div>
        <!-- Navbar End -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>No</th>
                                <th>Products</th>
                                <th>Price</th>

                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:set var="i" value="0"/>
                            <c:forEach items="${cart}" var="o" >
                                <tr>
                                    <c:set var="i" value="${i+1}"/>
                                    <td>${i}</td>
                                    <td class="align-middle"><img src="${o.product.image}" alt="" style="width: 50px;"> ${o.product.productName}</td>
                                    <td class="align-middle">${o.unitPrice}$</td>

                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">

                                            <input type="text" readonly="" class="form-control form-control-sm bg-secondary text-center" value="${o.quantity}">

                                        </div>
                                    </td>
                                    <td class="align-middle">${o.unitPrice*o.quantity}</td>
                                    <td class="align-middle">
                                        <button id="removeItem" class="btn btn-primary px-3" onclick="removeItem(${o.product.productId}, ${o.quantity})"><i class="fa fa-times"></i></button>
                                    </td>

                                </tr>
                            </c:forEach>    
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">

                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>
                        <div class="card-body">
                            <c:set var="totalMoney" value="0"/>
                            <c:forEach items="${cart}" var="o" >
                                <c:set var="totalMoney" value="${totalMoney + o.unitPrice*o.quantity}"/>
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <h6 class="font-weight-medium">${o.product.productName}</h6>
                                    <h6 class="font-weight-medium">${o.unitPrice*o.quantity}$</h6>

                                </div>
                            </c:forEach>

                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$ ${totalMoney}</h5>
                            </div>
                            <div class="d-flex mb-3">
                                <p class="text-dark font-weight-medium mb-0 mr-3">Methods: </p>
                                <form action="checkOut" method="post">
                                    <c:forEach items="${listPayment}" var="o">
                                        
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input calculate" value="${o.paymentId}" id="payment-${o.paymentId}" name="paymentMethod">
                                            <label class="custom-control-label" for="payment-${o.paymentId}">${o.paymentMethod}</label>
                                        </div>
                                    </c:forEach>
                            </div>
                            <input type="hidden" name="totalAmount" value="${totalMoney}" >
                            <input type="submit" value="Proceed To Checkout" class="btn btn-block btn-primary my-3 py-3"/>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
                                            function removeItem(productId, quantity) {


                                                $.ajax({
                                                    url: "/finalproject/addToCart",
                                                    type: "get",
                                                    data: {
                                                        productId: productId,
                                                        quantity: quantity
                                                    },
                                                    success: function (data) {
                                                        alert("Remove To Cart Success!");
                                                        location.reload();
                                                    },
                                                    error: function (xhr) {
                                                        //handle error
                                                    }
                                                });

                                            }

        </script>
    </body>
</html>
