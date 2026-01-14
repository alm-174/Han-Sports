<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Untree.co">
    <link rel="shortcut icon" href="favicon.png">

    <meta name="description" content=""/>
    <meta name="keywords" content="bootstrap, bootstrap4"/>

    <!-- Bootstrap CSS -->
    <link href="client/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="client/css/tiny-slider.css" rel="stylesheet">
    <link href="client/css/style.css" rel="stylesheet">
    <title>HAN SPORTS</title>
</head>

<body>

<jsp:include page="../layout/header.jsp"/>

<!-- Start Hero Section -->
<div class="hero" style="background-color: navy;">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                    <h1>HAN <span clsas="d-block">Sports</span></h1>
                    <p class="mb-4">Thế giới đồ thể thao chính hãng.</p>
                    <p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#"
                                                                                class="btn btn-white-outline">Explore</a>
                    </p>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="hero-img-wrap">
                    <%--                    <img src="client/images/logo.png" class="img-fluid">--%>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<!-- Start Product Section -->
<div class="product-section">
    <div class="container">
        <div class="row">

            <!-- Start Column 1 -->
            <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
                <h2 class="mb-4 section-title">Crafted with excellent material.</h2>
                <p class="mb-4">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
                    vulputate velit imperdiet dolor tempor tristique. </p>
                <p><a href="/product" class="btn">Explore</a></p>
            </div>
            <!-- End Column 1 -->
            <c:forEach var="product" items="${products}" begin="0" end="2">
                <!-- Start Column 2 -->
                <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                    <a class="product-item" href="/product/${product.id}">
                        <img src="admin/images/products/${product.image}" class="img-fluid product-thumbnail">
                        <h3 class="product-title">${product.name}</h3>
                        <strong class="product-price">
                            <fmt:formatNumber type="number" value="${product.price}"/> đ
                        </strong>
                        <form action="/add-product-to-cart/${product.id}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <button class="icon-cross">
                                <img src="client/images/cross.svg" class="img-fluid">
                            </button>
                        </form>

                    </a>
                </div>
                <!-- End Column 2 -->

            </c:forEach>

        </div>
    </div>
</div>
<!-- End Product Section -->


<jsp:include page="../layout/footer.jsp"/>


<script src="client/js/bootstrap.bundle.min.js"></script>
<script src="client/js/tiny-slider.js"></script>
<script src="client/js/custom.js"></script>
</body>

</html>