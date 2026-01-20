<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Start Header/Navigation -->
<nav class="navbar navbar-expand-md navbar-dark" aria-label="Furni navigation bar" style="background-color: navy;">

    <div class="container">
        <a class="navbar-brand fs-2 fw-bold" href="/">Han Sports<span>.</span></a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
                aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsFurni">
            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li><a class="nav-link" href="/product">Shop</a></li>
            </ul>
            <c:if test="${not empty pageContext.request.userPrincipal}">
                <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                    <li>
                        <div class="dropdown my-auto">
                            <a href="#" class="nav-link dropdown" role="button" id="dropdownMenuLink"
                               data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="/client/images/user.svg">
                            </a>

                            <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                <li class="d-flex align-items-center flex-column" style="min-width: 200px;">
                                    <img style="width: 100px; height: 100px; border-radius: 50%; overflow: hidden;"
                                         src="/admin/images/avatars/${sessionScope.avatar}"/>
                                    <div class="text-center my-3">
                                        <c:out value="${sessionScope.fullName}" />
                                    </div>
                                </li>

                                <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>

                                <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <form method="post" action="/logout">
                                        <input type="hidden" name="${_csrf.parameterName}"
                                               value="${_csrf.token}" />
                                        <button class="dropdown-item">Đăng xuất</button>
                                    </form>
                                </li>
                            </ul>
                        </div>


                    </li>
                    <li class="nav-item">
                        <a class="nav-link position-relative" href="/cart">
                            <img src="/client/images/cart.svg" alt="Cart">

                            <span
                                    class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"

                                    style="top: -5px; right: -10px; height: 20px; min-width: 20px;">
                                    ${sessionScope.sum}
                            </span>
                        </a>
                    </li>

                </ul>
            </c:if>
            <c:if test="${empty pageContext.request.userPrincipal}">
                <a href="/login" class="btn btn-warning">
                    Đăng nhập
                </a>
            </c:if>
        </div>
    </div>

</nav>
<!-- End Header/Navigation -->