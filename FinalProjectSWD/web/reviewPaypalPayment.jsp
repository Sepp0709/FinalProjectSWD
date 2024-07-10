<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="img/icon.jpg" type="image/x-icon" />
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
                    <%@include file="right-page.jsp" %>>
                    <h1 class="text-white">Review Paypal Payment</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="" style="margin: 100px;">
            <h1 style="text-align: center;">Please Review Before Paying</h1>
            <form action="ExecutePaypal" method="post">
                <div style="margin: 200px;">
                    <table class="center">
                        <tr style="border-bottom: 3px gray solid">
                            <td><b>Transaction Details:</b></td>
                            <td>
                                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                                <input type="hidden" name="PayerID" value="${param.PayerID}" />
                            </td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td>${transaction.description}</td>
                        </tr>
                        <tr>
                            <td>Subtotal:</td>
                            <td>${transaction.amount.details.subtotal} USD</td>
                        </tr>
                        <tr>
                            <td>Total:</td>
                            <td>${transaction.amount.total} USD</td>
                        </tr>
                        <tr>
                            <td><br /></td>
                        </tr>
                        <tr style="border-bottom: 3px gray solid">
                            <td><b>Payer Information:</b></td>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td>${payer.firstName}</td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td>${payer.lastName}</td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>${payer.email}</td>
                        </tr>
                        <tr>
                            <td><br /></td>
                        </tr>
                    </table>

                </div>
                <div style="display: flex; justify-content: center;">
                    <!-- Cancel Button -->
                    <a href="cancel-payment" class="btn btn-danger" style="margin-right: 10px;margin-left: 300px; height: 50px; line-height: 50px; padding: 0 20px; text-decoration: none; color: white; border-radius: 10px; text-align: center; background-color: black">Cancel</a>

                    <!-- Pay Now Button -->
                    <input style="background: black; color: white; border-radius: 10px; height: 50px; width: 125px; margin: 0px auto; cursor: pointer;" type="submit" value="Pay Now" />
                </div>
            </form>

        </div>
        <!-- Breadcrumb row END -->
        <!-- inner page banner END -->
        <!-- contact area END -->
    </div>
    <!-- Content END -->
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

</html>
