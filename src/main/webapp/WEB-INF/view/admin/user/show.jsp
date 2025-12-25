<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HAN SPORTS</title>
    <link rel="shortcut icon" type="image/png" href="./images/logos/logo.jsp"/>
    <link rel="stylesheet" href="./css/styles.min.css"/>
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
                <li class="breadcrumb-item active">Users</li>
            </ol>
            <div class="mt-5">
                <div class="row">
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="d-flex justify-content-between">
                                    <h3>Table users</h3>
                                    <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                                </div>

                                <hr/>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Full Name</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <th>${user.id}</th>
                                            <td>${user.email}</td>
                                            <td>${user.fullName}</td>
                                            <td>
                                                <a href="/admin/user/${user.id}" class="btn btn-success">
                                                    View</a>
                                                <a href="/admin/user/update/${user.id}" class="btn btn-warning  mx-2">Update</a>
                                                <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="./libs/jquery/dist/jquery.min.js"></script>
<script src="./libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./js/sidebarmenu.js"></script>
<script src="./js/app.min.js"></script>
<script src="./libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="./libs/simplebar/dist/simplebar.js"></script>
<script src="./js/dashboard.js"></script>
<!-- solar icons -->
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>