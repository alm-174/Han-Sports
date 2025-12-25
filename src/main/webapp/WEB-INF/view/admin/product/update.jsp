<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HAN SPORTS</title>
    <link rel="shortcut icon" type="image/png" href="/images/logos/logo.jsp"/>
    <link rel="stylesheet" href="../../css/styles.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            const imageFile = $("#imageFile");
            imageFile.change(function (e) {
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

                                <h3>Update product with id = ${id}</h3>
                                <hr/>
                                <form:form method="post" action="/admin/product/create" modelAttribute="newProduct"
                                           class="row" enctype="multipart/form-data">
                                    <div class="mb-3" style="display: none">
                                        <label class="form-label">Id:</label>
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Name:</label>
                                        <form:input type="text" class="form-control" path="name"/>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Price:</label>
                                        <form:input type="number" class="form-control" path="price"/>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Detail description:</label>
                                        <form:input type="text" class="form-control" path="detailDesc"/>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Short description:</label>
                                        <form:input type="text" class="form-control" path="shortDesc"/>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Quantity:</label>
                                        <form:input type="number" class="form-control" path="quantity"/>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Target:</label>
                                        <form:select class="form-select" aria-label="Default select example"
                                                     path="target">
                                            <form:option value="THIÊN CÔNG">THIÊN CÔNG</form:option>
                                            <form:option value="CÔNG THỦ TOÀN DIỆN">CÔNG THỦ TOÀN DIỆN</form:option>
                                            <form:option value="PHÒNG THỦ PHẢN TẠT">PHÒNG THỦ PHẢN TẠT</form:option>
                                            <form:option value="PHÒNG THỦ">PHÒNG THỦ</form:option>
                                        </form:select>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Brand:</label>
                                        <form:select class="form-select" aria-label="Default select example"
                                                     path="brand">
                                            <form:option value="YONEX">YONEX</form:option>
                                            <form:option value="LINNING">LINNING</form:option>
                                            <form:option value="VICTOR">VICTOR</form:option>
                                            <form:option value="VS">VS</form:option>
                                        </form:select>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label for="imageFile" class="form-label">Image:</label>
                                        <input class="form-control" type="file" id="imageFile"
                                               accept=".png, .jpg, .jpeg"
                                               name="imageFile"
                                        />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img style="max-height: 250px; display: none;" alt="avatar preview"
                                             id="avatarPreview"/>
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
<script src="../../libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="../../libs/simplebar/dist/simplebar.js"></script>
<script src="../../js/dashboard.js"></script>
<!-- solar icons -->
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>