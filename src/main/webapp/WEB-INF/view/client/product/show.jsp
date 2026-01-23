<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Untree.co">
    <link rel="shortcut icon" href="favicon.png">

    <meta name="description" content=""/>
    <meta name="keywords" content="bootstrap, bootstrap4"/>

    <!-- Bootstrap CSS -->
    <link href="client/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="client/css/tiny-slider.css" rel="stylesheet">
    <link href="client/css/style.css" rel="stylesheet">
    <title>HAN SPORTS</title>
</head>

<body>

<jsp:include page="../layout/header.jsp"/>


<div class="untree_co-section product-section before-footer-section">
    <div class="container">
        <div class="row g-4 fruite">
            <div class="col-12 col-md-4">
                <div class="row g-4">
                    <div class="col-12" id="factoryFilter">
                        <div class="mb-2"><b>Hãng sản xuất</b></div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="factory-1"
                                   value="YONEX">
                            <label class="form-check-label" for="factory-1">Yonex</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="factory-2"
                                   value="LINNING">
                            <label class="form-check-label" for="factory-2">Linning</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="factory-3"
                                   value="VICTOR">
                            <label class="form-check-label" for="factory-3">Victor</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="factory-4"
                                   value="VS">
                            <label class="form-check-label" for="factory-4">VS</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="factory-5"
                                   value="PROACE">
                            <label class="form-check-label" for="factory-5">Proace</label>
                        </div>

                    </div>
                    <div class="col-12" id="targetFilter">
                        <div class="mb-2"><b>Lối chơi</b></div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="target-1"
                                   value="TAN-CONG">
                            <label class="form-check-label" for="target-1">Tấn Công</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="target-2"
                                   value="PHONG-THU">
                            <label class="form-check-label" for="target-2">Phòng Thủ</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="target-3"
                                   value="TOAN-DIEN">
                            <label class="form-check-label" for="target-3">Công Thủ Toàn Diện</label>
                        </div>


                    </div>
                    <div class="col-12" id="priceFilter">
                        <div class="mb-2"><b>Mức giá</b></div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="price-2"
                                   value="duoi-1-trieu">
                            <label class="form-check-label" for="price-2">Dưới 1 triệu</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="price-3"
                                   value="1-2-trieu">
                            <label class="form-check-label" for="price-3">Từ 1 - 2
                                triệu</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="price-4"
                                   value="2-3-trieu">
                            <label class="form-check-label" for="price-4">Từ 2 - 3
                                triệu</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="price-5"
                                   value="tren-3-triệu">
                            <label class="form-check-label" for="price-5">Trên 3 triệu</label>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mb-2"><b>Sắp xếp</b></div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="sort-1"
                                   value="gia-tang-dan" name="radio-sort">
                            <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="sort-2"
                                   value="gia-giam-dan" name="radio-sort">
                            <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="sort-3"
                                   value="gia-nothing" name="radio-sort">
                            <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                        </div>

                    </div>
                    <div class="col-12">
                        <button
                                class="btn border-secondary rounded-pill px-4 py-3 text-light text-uppercase mb-4"
                                id="btnFilter">
                            Lọc Sản Phẩm
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-8 text-center">
                <div class="row g-4">
                    <c:if test="${totalPages ==  0}">
                        <div>Không tìm thấy sản phẩm</div>
                    </c:if>
                    <c:forEach var="product" items="${products}">
                        <!-- Start Column 1 -->
                        <div class="col-12 col-md-4 col-lg-3 mb-5">
                            <a class="product-item" href="/product/${product.id}">
                                <img src="admin/images/products/${product.image}" class="img-fluid product-thumbnail">
                                <h3 class="product-title">${product.name}</h3>
                                <strong class="product-price">
                                    <fmt:formatNumber type="number" value="${product.price}"/> đ
                                </strong>

                                <form action="/add-product-to-cart/${product.id}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                    <button class="icon-cross">
                                        <img src="client/images/cross.svg" class="img-fluid">
                                    </button>
                                </form>
                            </a>
                        </div>
                        <!-- End Column 1 -->
                    </c:forEach>


                    <c:if test="${totalPages > 0}">
                        <div class="pagination d-flex justify-content-center mt-5">
                            <li class="page-item">
                                <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                   href="/products?page=${currentPage - 1}${queryString}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                <li class="page-item">
                                    <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                       href="/products?page=${loop.index + 1}${queryString}">
                                            ${loop.index + 1}
                                    </a>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                   href="/products?page=${currentPage + 1}${queryString}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>

                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../layout/footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="client/js/bootstrap.bundle.min.js"></script>
    <script src="client/js/tiny-slider.js"></script>
    <script src="client/js/custom.js"></script>
</body>

</html>