<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                    <h1>Cart</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->


<div class="untree_co-section before-footer-section">
    <div class="container">
        <div class="row mb-5">

            <div class="site-blocks-table">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="product-thumbnail">Image</th>
                        <th class="product-name">Product</th>
                        <th class="product-price">Price</th>
                        <th class="product-quantity">Quantity</th>
                        <th class="product-total">Total</th>
                        <th class="product-remove">Remove</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${ empty cartDetails}">
                        <tr>
                            <td colspan="6">
                                Không có sản phẩm trong giỏ hàng
                            </td>
                        </tr>
                    </c:if>
                    <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                        <tr>
                            <td class="product-thumbnail">
                                <img src="admin/images/products/${cartDetail.product.image}" alt="Image"
                                     class="img-fluid">
                            </td>
                            <td class="product-name">
                                <h2 class="h5 text-black">${cartDetail.product.name}</h2>
                            </td>
                            <td>
                                <fmt:formatNumber type="number" value="${cartDetail.price}"/> đ
                            </td>
                            <td>
                                <div class="input-group mb-3 d-flex align-items-center quantity "
                                     style="max-width: 120px;">
                                    <div class="input-group-btn">
                                        <button type="button"
                                                class="btn btn-outline-black btn-minus">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text"
                                           class="form-control form-control-sm text-center border-0"
                                           value="${cartDetail.quantity}"
                                           data-cart-detail-id="${cartDetail.id}"
                                           data-cart-detail-price="${cartDetail.price}"
                                           data-cart-detail-index="${status.index}">
                                    <div class="input-group-btn">
                                        <button type="button"
                                                class="btn btn-outline-black btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>

                            </td>
                            <td data-cart-detail-id="${cartDetail.id}">
                                <fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}"/> đ
                            </td>
                            <td>
                                <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button class="btn btn-black btn-sm">
                                        X
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
        <c:if test="${not empty cartDetails}">
            <div class="row">
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <button class="btn btn-black btn-sm btn-block">Update Cart</button>
                        </div>
                        <div class="col-md-6">
                            <a href="/product" class="btn btn-outline-black btn-sm btn-block">Continue Shopping</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="text-black h4" for="coupon">Coupon</label>
                            <p>Enter your coupon code if you have one.</p>
                        </div>
                        <div class="col-md-8 mb-3 mb-md-0">
                            <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-black">Apply Coupon</button>
                        </div>
                    </div>
                </div>


<%--                cart total--%>
                <div class="col-md-6 pl-5">
                    <div class="row justify-content-end">
                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-12 text-right border-bottom mb-5">
                                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <span class="text-black">Subtotal</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black">0</strong>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col-md-6">
                                    <span class="text-black">Total</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black" data-cart-total-price="${totalPrice}">
                                        <fmt:formatNumber type="number" value="${totalPrice}"/> đ
                                    </strong>
                                </div>
                            </div>
                            <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}" />
                                <div style="display: none;">
                                    <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                               varStatus="status">
                                        <div class="mb-3">
                                            <div class="form-group">
                                                <label>Id:</label>
                                                <form:input class="form-control" type="text"
                                                            value="${cartDetail.id}"
                                                            path="cartDetails[${status.index}].id" />
                                            </div>
                                            <div class="form-group">
                                                <label>Quantity:</label>
                                                <form:input class="form-control" type="text"
                                                            value="${cartDetail.quantity}"
                                                            path="cartDetails[${status.index}].quantity" />
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <button class="btn btn-black btn-lg py-3 btn-block"
                                                type="submit">Proceed To Checkout
                                        </button>
                                    </div>
                                </div>
                            </form:form>

                        </div>
                    </div>
                </div>
<%--                end cart total--%>
            </div>
        </c:if>
    </div>
</div>


<jsp:include page="../layout/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="client/js/bootstrap.bundle.min.js"></script>
<script src="client/js/tiny-slider.js"></script>
<script src="client/js/custom.js"></script>

</body>

</html>