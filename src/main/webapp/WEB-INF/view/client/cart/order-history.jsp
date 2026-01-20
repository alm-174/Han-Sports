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
                    <h1>Thank you for ordering.</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="mb-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                </ol>
            </nav>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Giá cả</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col">Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${ empty orders}">
                    <tr>
                        <td colspan="6">
                            Không có đơn hàng nào được tạo
                        </td>
                    </tr>
                </c:if>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td colspan="2">Order Id = ${order.id}</td>
                        <td colspan="1">
                            <fmt:formatNumber type="number" value=" ${order.totalPrice}" />
                            đ
                        </td>
                        <td colspan="2"></td>
                        <td colspan="1">
                                ${order.status}
                        </td>
                    </tr>
                    <c:forEach var="orderDetail" items="${order.orderDetails}">
                        <tr>
                            <th scope="row">
                                <div class="d-flex align-items-center">
                                    <img src="/admin/images/products/${orderDetail.product.image}"
                                         class="img-fluid me-5 rounded-circle"
                                         style="width: 80px; height: 80px;" alt="">
                                </div>
                            </th>
                            <td>
                                <p class="mb-0 mt-4">
                                    <a href="/product/${orderDetail.product.id}" target="_blank">
                                            ${orderDetail.product.name}
                                    </a>
                                </p>
                            </td>
                            <td>
                                <p class="mb-0 mt-4">
                                    <fmt:formatNumber type="number" value="${orderDetail.price}" />
                                    đ
                                </p>
                            </td>
                            <td>
                                <div class="input-group quantity mt-4" style="width: 100px;">
                                    <input type="text"
                                           class="form-control form-control-sm text-center border-0"
                                           value="${orderDetail.quantity}">
                                </div>
                            </td>
                            <td>
                                <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                    <fmt:formatNumber type="number"
                                                      value="${orderDetail.price * orderDetail.quantity}" /> đ
                                </p>
                            </td>
                            <td></td>

                        </tr>
                    </c:forEach>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>


<jsp:include page="../layout/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="client/js/bootstrap.bundle.min.js"></script>
<script src="client/js/tiny-slider.js"></script>
<script src="client/js/custom.js"></script>

</body>

</html>