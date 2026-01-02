<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HAN SPORTS</title>
    <link rel="shortcut icon" type="image/png" href="/admin/images/logos/logo.jsp"/>
    <link rel="stylesheet" href="/admin/css/styles.min.css"/>
</head>

<body>
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <div
            class="position-relative overflow-hidden text-bg-light min-vh-100 d-flex align-items-center justify-content-center">
        <div class="d-flex align-items-center justify-content-center w-100">
            <div class="row justify-content-center w-100">
                <div class="col-md-8 col-lg-6 col-xxl-3">
                    <div class="card mb-0">
                        <div class="card-body">
                            <div class="text-center">
                                <a href="/" class="text-nowrap logo-img"
                                   style="font-size:32px; font-weight:900; color:#000080; letter-spacing:1px;">
                                    HAN SPORTS
                                </a>
                            </div>
                            <p class="text-center">Chào Mừng Quý Khách</p>
                            <form:form method="post" action="/register" modelAttribute="registerDTO">
                                <c:set var="errorPassword">
                                    <form:errors path="confirmPassword"
                                                 cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorEmail">
                                    <form:errors path="email" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorFirstName">
                                    <form:errors path="firstName" cssClass="invalid-feedback" />
                                </c:set>


                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <form:input class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        id="inputFirstName"
                                                   type="text" path="firstName"/>
                                            <label for="inputFirstName">First name</label>
                                            ${errorFirstName}
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <form:input class="form-control" id="inputLastName"
                                                   type="text" path="lastName"/>
                                            <label for="inputLastName">Last name</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-floating mb-3">
                                    <form:input
                                            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                            type="email" placeholder="name@example.com" path="email" />
                                    <label>Email address</label>
                                        ${errorEmail}
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <form:input
                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                    type="password" placeholder="Create a password"
                                                    path="password" />
                                            <label>Password</label>
                                                ${errorPassword}
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <form:input class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                        type="password"
                                                        placeholder="Confirm password"
                                                        path="confirmPassword" />
                                            <label>Confirm Password</label>
                                            ${errorPassword}
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-0">
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Create Account
                                        </button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/admin/libs/jquery/dist/jquery.min.js"></script>
<script src="/admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- solar icons -->
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>