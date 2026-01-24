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
    <link href="../client/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="../client/css/tiny-slider.css" rel="stylesheet">
    <link href="../client/css/style.css" rel="stylesheet">
    <title>HAN SPORTS</title>
</head>

<body>

<jsp:include page="../layout/header.jsp"/>

<div class="container mt-5 pt-5">
    <div class="row">

        <!-- IMAGE -->
        <div class="col-lg-6">
            <img src="../admin/images/products/${product.image}"
                 class="img-fluid rounded">
        </div>

        <!-- INFO -->
        <div class="col-lg-6">
            <h4 class="fw-bold">${product.name}</h4>
            <p>${product.brand}</p>

            <h5 class="fw-bold text-danger">
                <fmt:formatNumber type="number" value="${product.price}"/> đ
            </h5>

            <p>${product.shortDesc}</p>

            <!-- QUANTITY -->
            <div class="input-group align-items-center quantity"
                 style="max-width: 200px;">

                <button type="button"
                        class="btn btn-outline-dark btn-minus">
                    <i class="fa fa-minus"></i>
                </button>

                <input type="text"
                       class="form-control text-center"
                       value="1"
                       data-cart-detail-id="${product.id}"
                       data-cart-detail-price="${product.price}"
                       data-cart-detail-index="0">

                <button type="button"
                        class="btn btn-outline-dark btn-plus">
                    <i class="fa fa-plus"></i>
                </button>
            </div>

            <!-- FORM ADD TO CART -->
            <form action="/add-product-from-view-detail" method="post" class="mt-4">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input type="hidden" name="id" value="${product.id}">
                <input type="hidden" name="quantity" id="cartDetails0.quantity">

                <button class="btn btn-dark rounded-pill px-4">
                    <i class="fa fa-shopping-bag me-2"></i>
                    Add to cart
                </button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.x.x.min.js"></script>
<script src="../client/js/bootstrap.bundle.min.js"></script>
<script src="../client/js/tiny-slider.js"></script>
<script src="../client/js/custom.js"></script>
</body>

</html>