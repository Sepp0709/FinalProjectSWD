<%-- 
    Document   : navbar.jsp
    Created on : 25-May-2023, 10:40:16
    Author     : Hoang Long
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
    <a href="home" class="text-decoration-none d-block d-lg-none">
        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Ria</span>Shop</h1>
    </a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
        <div class="navbar-nav mr-auto py-0">
            <a href="home" class="nav-item nav-link active">Home</a>

        </div>

        <c:if test="${sessionScope.user == null}">
            <div class="navbar-nav ml-auto py-0">
                <a href="login" class="nav-item nav-link">Login</a>
                <a href="register" class="nav-item nav-link">Register</a>
            </div>
        </c:if>
        <c:if test="${sessionScope.user != null}">
            <div class="navbar-nav ml-auto py-0">
                
                
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">${sessionScope.user.fullname}</a>
                    <div class="dropdown-menu dropdown-menu-right rounded-0 m-0">
                        <a href="logout" class="dropdown-item">Logout</a>
                    </div>
                </div>
            </div>
        </c:if>

    </div>
</nav>
