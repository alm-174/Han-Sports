<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

<!-- Start Hero Section -->
<div class="hero" style="background-color: navy;">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                    <h1>Checkout</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<div class="untree_co-section">
    <div class="container">
<%--        <c:if test="${not empty cartDetails}">--%>
            <form:form action="/place-order" method="post" modelAttribute="cart">
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}" />
                <div class="row">
                    <div class="col-md-6 mb-5 mb-md-0">
                        <h2 class="h3 mb-3 text-black">Billing Details</h2>
                        <div class="p-3 p-lg-5 border bg-white">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_lname" class="text-black">Full Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="receiverName"
                                           placeholder="Full Name" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_address" name="receiverAddress"
                                           placeholder="Street address" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_phone" class="text-black">Phone <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_phone" name="receiverPhone"
                                           placeholder="Phone Number" required>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row mb-5">
                            <div class="col-md-12">
                                <h2 class="h3 mb-3 text-black">Your Order</h2>
                                <div class="p-3 p-lg-5 border bg-white">
                                    <table class="table site-block-order-table mb-5">
                                        <thead>
                                        <th>Product</th>
                                        <th>Total</th>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="cartDetail" items="${cartDetails}">
                                            <tr>
                                                <td>${cartDetail.product.name} <strong class="mx-2">x</strong> ${cartDetail.quantity}</td>
                                                <td>
                                                    <fmt:formatNumber type="number" value="${cartDetail.quantity * cartDetail.price}"/> đ</td>
                                            </tr>
                                        </c:forEach>


                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                                            <td class="text-black">0đ</td>
                                        </tr>
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                            <td class="text-black font-weight-bold"><strong>
                                                <fmt:formatNumber type="number" value="${totalPrice}"/> đ
                                            </strong></td>
                                        </tr>
                                        </tbody>
                                    </table>


                                    <div class="form-group">
                                        <button class="btn btn-black btn-lg py-3 btn-block"
                                                type="submit">Place Order
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </form:form>
<%--        </c:if>--%>


        <!-- </form> -->
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="client/js/bootstrap.bundle.min.js"></script>
<script src="client/js/tiny-slider.js"></script>
<script src="client/js/custom.js"></script>

</body>

</html>