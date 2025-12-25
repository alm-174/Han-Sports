<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="left-sidebar position-fixed top-0 vh-100 overflow-auto" style="width:260px;">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="admin" class="text-nowrap logo-img"
               style="font-size:32px; font-weight:900; color:#000080; letter-spacing:1px;">
                HAN SPORTS
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-6"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">
                <li class="nav-small-cap">
                    <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
                    <span class="hide-menu">Home</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin" aria-expanded="false">
                        <i class="ti ti-atom"></i>
                        <span class="hide-menu">Dashboard</span>
                    </a>
                </li>
                <!-- ---------------------------------- -->
                <!-- Dashboard -->
                <!-- ---------------------------------- -->
                <li class="sidebar-item">
                    <a class="sidebar-link justify-content-between" href="/admin/user" aria-expanded="false">
                        <div class="d-flex align-items-center gap-3">
                    <span class="d-flex">
                      <i class="ti ti-user-circle"></i>
                    </span>
                            <span class="hide-menu">User</span>
                        </div>

                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link justify-content-between" href="/admin/product" aria-expanded="false">
                        <div class="d-flex align-items-center gap-3">
                    <span class="d-flex">
                      <i class="ti ti-aperture"></i>
                    </span>
                            <span class="hide-menu">Product</span>
                        </div>

                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link justify-content-between" href="#" aria-expanded="false">
                        <div class="d-flex align-items-center gap-3">
                    <span class="d-flex">
                      <i class="ti ti-shopping-cart"></i>
                    </span>
                            <span class="hide-menu">Orders</span>
                        </div>

                    </a>
                </li>


            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>