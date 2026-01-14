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

<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="col-lg-8 col-xl-9">
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="border rounded">
                        <a href="#">
                            <img src="../admin/images/products/${product.image}"
                                 class="img-fluid rounded" alt="Image">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <h4 class="fw-bold mb-3"> ${product.name}</h4>
                    <p class="mb-3">${product.brand}</p>
                    <h5 class="fw-bold mb-3">
                        <fmt:formatNumber type="number" value="${product.price}"/> đ

                    </h5>
                    <div class="d-flex mb-4">
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <p class="mb-4">
                        ${product.shortDesc}
                    </p>

                    <div class="input-group mb-3 d-flex align-items-center quantity-container">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-black decrease" type="button">&minus;</button>
                        </div>
                        <input type="text" class="form-control text-center quantity-amount" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                        <div class="input-group-append">
                            <button class="btn btn-outline-black increase" type="button">&plus;</button>
                        </div>
                    </div>
                    <form action="/add-product-from-view-detail" method="post"
                          modelAttribute="product">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                        <input class="form-control d-none" type="text" value="${product.id}"
                               name="id"/>

                        <input class="form-control d-none" type="text" name="quantity"
                               id="cartDetails0.quantity"/>
                        <button
                                class="btn rounded-pill px-4 py-2 mb-4"
                                style="color:#fff; background-color:#0b3c5d; border-color:#0b3c5d;">
                            <i class="fa fa-shopping-bag me-2"></i>
                            Add to cart
                        </button>
                    </form>

                </div>
                <div class="col-lg-12">
                    <nav>
                        <div class="nav nav-tabs mb-3">
                            <button class="nav-link active border-white border-bottom-0"
                                    type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                    data-bs-target="#nav-about" aria-controls="nav-about"
                                    aria-selected="true">Description
                            </button>
                        </div>
                    </nav>
                    <div class="tab-content mb-5">
                        <div class="tab-pane active" id="nav-about" role="tabpanel"
                             aria-labelledby="nav-about-tab">
                            <p>
                                ${product.detailDesc}
                            </p>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>


<script src="../client/js/bootstrap.bundle.min.js"></script>
<script src="../client/js/tiny-slider.js"></script>
<script src="../client/js/custom.js"></script>
</body>

</html>