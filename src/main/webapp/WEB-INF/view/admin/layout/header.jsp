<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="app-header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler " id="headerCollapse" href="javascript:void(0)">
                    <i class="ti ti-menu-2"></i>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link " href="javascript:void(0)" id="drop1" data-bs-toggle="dropdown"
                   aria-expanded="false">
                    <i class="ti ti-bell"></i>
                    <div class="notification bg-primary rounded-circle"></div>
                </a>
                <div class="dropdown-menu dropdown-menu-animate-up" aria-labelledby="drop1">
                    <div class="message-body">
                        <a href="javascript:void(0)" class="dropdown-item">
                            Item 1
                        </a>
                        <a href="javascript:void(0)" class="dropdown-item">
                            Item 2
                        </a>
                    </div>
                </div>
            </li>
        </ul>
        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">

                <li class="nav-item dropdown">
                    <a class="nav-link " href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <img src="/admin/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                        <div class="message-body">
                            <a class="dropdown-item" href="#!">Settings</a>
                            <a>
                                <form method="post" action="/logout">
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}" />
                                    <button class="dropdown-item">Logout</button>
                                </form></a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <style>
        .app-topstrip {
            display: none;
        }

        .page-wrapper {
            margin-top: 0 !important;
            padding-top: 0 !important;
        }

        .body-wrapper {
            padding-top: 0 !important;
        }

        header.app-header {
            top: 0 !important;
        }
    </style>

</header>