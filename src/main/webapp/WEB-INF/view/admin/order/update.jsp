<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HAN SPORTS</title>
    <link rel="shortcut icon" type="image/png" href="./images/logos/logo.jsp"/>
    <link rel="stylesheet" href="../../css/styles.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                <li class="breadcrumb-item active">Orders</li>
            </ol>
            <div class="mt-5">
                <div class="row">
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="d-flex justify-content-between">
                                    <h3>Table orders</h3>
                                </div>

                                <hr/>
                                <form:form method="post" action="/admin/order/update" class="row"
                                           modelAttribute="newOrder">


                                    <div class="mb-3" style="display: none;">
                                        <label class="form-label">Id:</label>
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>
                                    <div class="mb-3">
                                        <label>Order id = ${newOrder.id} </label>
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                        <label class="form-label">Price:
                                            <fmt:formatNumber type="number"
                                                              value="${newOrder.totalPrice}" /> đ
                                        </label>
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">User:</label>
                                        <form:input type="text" class="form-control" disabled="true"
                                                    path="user.fullName" />
                                    </div>

                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Status:</label>
                                        <form:select class="form-select" path="status">
                                            <form:option value="PENDING">PENDING</form:option>
                                            <form:option value="SHIPPING">SHIPPING</form:option>
                                            <form:option value="COMPLETE">COMPLETE</form:option>
                                            <form:option value="CANCEL">CANCEL</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-12 mb-5">
                                        <button type="submit" class="btn btn-warning">Update</button>
                                    </div>
                                </form:form>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="../../libs/jquery/dist/jquery.min.js"></script>
<script src="../../libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../../js/sidebarmenu.js"></script>
<script src="../../js/app.min.js"></script>
<%--<script src="../../libs/apexcharts/dist/apexcharts.min.js"></script>--%>
<script src="../../libs/simplebar/dist/simplebar.js"></script>
<script src="../../js/dashboard.js"></script>
<!-- solar icons -->
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>