<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HAN SPORTS</title>
    <link rel="shortcut icon" type="image/png" href="/admin/images/logos/favicon.png"/>
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
                            <a href="/" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                <img src="/admin/images/logos/logo.svg" alt="">
                            </a>
                            <p class="text-center">Your Social Campaigns</p>
                            <form method="post" action="/login">
                                <c:if test="${param.error != null}">
                                    <div class="my-2" style="color: red;">Invalid email or password.
                                    </div>
                                </c:if>

                                <div class="form-floating mb-3">
                                    <input class="form-control" type="email"
                                           placeholder="name@example.com" name="username" />
                                    <label>Email address</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input class="form-control" type="password"
                                           placeholder="Password" name="password" />
                                    <label>Password</label>
                                </div>
                                <div>
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}" />

                                </div>

                                <div class="mt-4 mb-0">
                                    <div class="d-grid">
                                        <button class="btn btn-primary btn-block">
                                            Login
                                        </button>
                                    </div>
                                </div>
                            </form>
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