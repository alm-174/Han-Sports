<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HAN SPORTS</title>
    <link rel="shortcut icon" type="image/png" href="/admin/images/logos/logo.jpg" />
    <link rel="stylesheet" href="/admin/css/styles.min.css" />
</head>

<body>
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">

    <!-- Sidebar Start -->
    <jsp:include page="../layout/sidebar.jsp" />
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
        <!--  Header Start -->
        <jsp:include page="../layout/header.jsp" />
        <!--  Header End -->
        <div class="body-wrapper-inner">
            <div class="container-fluid">
                <!--  Row 1 -->
                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">Số lượng User (${countUsers})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/user">View
                                    Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body">Số lượng Product (${countProducts})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/product">View
                                    Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">Số lượng Order (${countOrders})</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/admin/order">View
                                    Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="/admin/libs/jquery/dist/jquery.min.js"></script>
<script src="/admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/admin/js/sidebarmenu.js"></script>
<script src="/admin/js/app.min.js"></script>
<script src="/admin/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="/admin/libs/simplebar/dist/simplebar.js"></script>
<script src="/admin/js/dashboard.js"></script>
<!-- solar icons -->
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>