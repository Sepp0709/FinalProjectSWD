<%-- 
    Document   : product
    Created on : 27-May-2023, 21:46:12
    Author     : Hoang Long
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>>
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                </div>
                <div class="col-lg-9">
                    <%@include file="right-page.jsp" %>
                    <!-- Shop Detail Start -->

                    <div class="container-fluid py-5">
                        <div class="row px-xl-5">
                            <div class="col-lg-5 pb-5">
                                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner border">
                                        <div class="carousel-item active">
                                            <img class="w-100 h-100" src="${p.image}" alt="Image">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-7 pb-5">
                                <h3 class="font-weight-semi-bold">${p.productName}</h3>
                                <div class="d-flex mb-3">

                                </div>
                                <h3 class="font-weight-semi-bold mb-4" id="price">
                                    ${p.unitPrice}$   <del style="color: grey">${p.unitPrice*1.2}$</del>
                                </h3>
                                <p class="mb-4">${p.productDescription}</p>

                                


                                <div class="d-flex mb-3" id="quantity">
                                    Quantity: <p id="valQ">${p.quantity}</p>
                                </div>
                                <div class="d-flex mb-4">

                                </div>
                                <div class="d-flex align-items-center mb-4 pt-2">
                                    <div class="input-group quantity mr-3" style="width: 130px;">
                                        <div class="input-group-btn">
                                            <button id="minus" class="btn btn-primary btn-minus" disabled>
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input id="quantity_input" type="text" readonly class="form-control bg-secondary text-center" value="1" maxlength="3">
                                        <div class="input-group-btn">
                                            <button id="plus" class="btn btn-primary btn-plus" >
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <button id="addToCart" class="btn btn-primary px-3" onclick=""><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- Shop Detail End -->
                </div>
            </div>
        </div>
        
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

        <script>
                                      $('#addToCart').on('click', function () {
                                            var quantity = $('#quantity_input').val();

                                            var pId = ${p.productId};
                                            
                                            $.ajax({
                                                url: "/finalproject/addToCart",
                                                type: "post",
                                                data: {
                                                    productId: pId,
                                                    quantity: quantity
                                                },
                                                success: function (data) {
                                                    alert("Add To Cart Success!");
                                                    location.reload();
                                                },
                                                error: function (xhr) {
                                                    //handle error
                                                }
                                            });

                                        });   
            



                                       
                                        $('#plus').on('click', function () {
                                            var quantityMax = $('#valQ').text();
                                            var quantity = parseFloat($('#quantity_input').val());
                                            if (quantity == quantityMax - 1) {
                                                $('#quantity_input').val(quantityMax)
                                                $('#plus').prop('disabled', true);
                                            } else {
                                                $('#quantity_input').val(quantity + 1)
                                                $('#minus').removeAttr("disabled");

                                            }

                                        });
                                        $('#minus').on('click', function () {
                                            var quantity = parseFloat($('#quantity_input').val());
                                            if (quantity == 1) {
                                                $('#quantity_input').val(0)
                                                $('#minus').prop('disabled', true);
                                            } else {
                                                $('#quantity_input').val(quantity - 1)
                                                $('#plus').removeAttr("disabled");
                                            }

                                        });

                                        
                                        
                                        
                                        

        </script>
        <script src="js/main.js"></script>
    </body>
</html>
