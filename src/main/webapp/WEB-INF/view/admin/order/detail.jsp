<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HAN SPORTS</title>
    <link rel="shortcut icon" type="image/png" href="/images/logos/logo.jsp"/>
    <link rel="stylesheet" href="../css/styles.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block"});
            });
        });
    </script>

</head>

<body>
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">

    <!-- Sidebar Start -->
    <jsp:include page="../layout/sidebar.jsp"/>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
        <!--  Header Start -->
        <jsp:include page="../layout/header.jsp"/>
        <!--  Header End -->
        <div class="container-fluid px-3">
            <h1 class="mt-4">Manage Users</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                <li class="breadcrumb-item active">
                    <a href="/admin/order">Orders</a>
                </li>
            </ol>
            <div class="mt-5">
                <div class="row">
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <h3>Order Id ${id} information </h3>
                                <hr/>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá cả</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${ empty orderDetails}">
                                            <tr>
                                                <td colspan="6">
                                                    Không có sản phẩm trong giỏ hàng
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="orderDetail" items="${orderDetails}">

                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/admin/images/products/${orderDetail.product.image}"
                                                             class="img-fluid me-5 rounded-circle"
                                                             style="width: 80px; height: 80px;"
                                                             alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${orderDetail.product.id}"
                                                           target="_blank">
                                                                ${orderDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number"
                                                                          value="${orderDetail.price}"/> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4"
                                                         style="width: 100px;">
                                                        <input type="text"
                                                               class="form-control form-control-sm text-center border-0"
                                                               value="${orderDetail.quantity}">
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4"
                                                       data-cart-detail-id="${orderDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                                          value="${orderDetail.price * orderDetail.quantity}"/>
                                                        đ
                                                    </p>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <a href="/admin/order" class="btn btn-success mt-3">Back</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>

</div>
</div>
<script src="/admin/libs/jquery/dist/jquery.min.js"></script>
<script src="../libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/sidebarmenu.js"></script>
<script src="../js/app.min.js"></script>
<%--<script src="/admin/libs/apexcharts/dist/apexcharts.min.js"></script>--%>
<script src="../libs/simplebar/dist/simplebar.js"></script>
<script src="../js/dashboard.js"></script>
<!-- solar icons -->
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>