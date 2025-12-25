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
                $("#avatarPreview").css({ "display": "block" });
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
            <h1 class="mt-4">Manage Products</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                <li class="breadcrumb-item active">
                    <a href="/admin/product">Products</a>
                </li>
            </ol>
            <div class="mt-5">
                <div class="row">
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-12 mx-auto">

                                <h3>Product Id ${id} information </h3>
                                <hr/>
                                <div class="card" style="width: 30%">
                                    <div class="card-header">
                                        User information
                                    </div>
                                    <img class="card-img-top" src="/admin/images/products/${product.image}"
                                         alt="Card image cap">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">ID: ${product.id}</li>
                                        <li class="list-group-item">Name: ${product.name}</li>
                                        <li class="list-group-item">Price:
                                            <fmt:formatNumber type="number" value="${product.price}" /> đ
                                        </li>
                                        <li class="list-group-item">Brand: ${product.brand}</li>
                                        <li class="list-group-item">Quantity: ${product.quantity}</li>
                                    </ul>
                                </div>
                                <a href="/admin/product" class="btn btn-success mt-3">Back</a>




                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="../libs/jquery/dist/jquery.min.js"></script>
<script src="../libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/sidebarmenu.js"></script>
<script src="../js/app.min.js"></script>
<script src="../libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="../libs/simplebar/dist/simplebar.js"></script>
<script src="../js/dashboard.js"></script>
<!-- solar icons -->
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>