
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:10:19 GMT -->
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/icon.jpg" type="image/x-icon"/>
        <title>RiaShop- Your dream your world</title>
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
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <!-- header start -->
        
            <%@include file="header.jsp" %>
        
        

        <!-- header end -->
        <!-- Content -->
        <div class="">
            <!-- inner page banner -->
            <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                <div class="container">
                    <div class="page-banner-entry">
                        <h1 class="text-white">Paypal Receipt </h1>
                    </div>
                </div>
            </div>
            
            <!-- Breadcrumb row -->
            <div style="margin: 100px" >
                <%@include file="right-page.jsp" %>
                <h1 style="text-align: center; margin-top: 30px; ">Payment Done. Thank you for purchasing our products</h1>
                <br/>
                <h2 style="text-align: center"> Receipt Details:</h2>
                <table class="center">
                    <tr style="border-bottom: 3px gray solid">
                        <td><b>Merchant:</b></td>
                        <td>My Pham Shop</td>
                    </tr>
                    <tr>
                        <td><b>Payer:</b></td>
                        <td>${payer.firstName} ${payer.lastName}</td>		
                    </tr>
                    <tr>
                        <td><b>Description:</b></td>
                        <td>${transaction.description}</td>
                    </tr>	
                    <tr>
                        <td><b>Subtotal:</b></td>
                        <td>${transaction.amount.details.subtotal} USD</td>
                    </tr>

                    
                    <tr style="border-top: 3px gray solid">
                        <td><b>Total:</b></td>
                        <td>${transaction.amount.total} USD</td>
                    </tr>						
                </table>
            </div>
            <!-- Breadcrumb row END -->
            <!-- inner page banner END -->

            <!-- contact area END -->
        </div>
        <!-- Content END-->
        <div class="ttr-overlay"></div>

        <div class="ttr-overlay"></div>

        <!-- External JavaScripts -->
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

    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:11:35 GMT -->
</html>
