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

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap4" />

    <!-- Bootstrap CSS -->
    <link href="client/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="client/css/tiny-slider.css" rel="stylesheet">
    <link href="client/css/style.css" rel="stylesheet">
    <title>HAN SPORTS</title>
</head>

<body>

<jsp:include page="../layout/header.jsp" />
<div class="untree_co-section product-section before-footer-section">
    <div class="container">
        <div class="row">

            <c:forEach var="product" items="${products}">
            <!-- Start Column 1 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="/product/${product.id}">
                    <img src="admin/images/products/${product.image}" class="img-fluid product-thumbnail">
                    <h3 class="product-title">${product.name}</h3>
                    <strong class="product-price">
                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                    </strong>

                    <span class="icon-cross">
								<img src="images/cross.svg" class="img-fluid">
							</span>
                </a>
            </div>
            <!-- End Column 1 -->
            </c:forEach>


        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />


<script src="client/js/bootstrap.bundle.min.js"></script>
<script src="client/js/tiny-slider.js"></script>
<script src="client/js/custom.js"></script>
</body>

</html>