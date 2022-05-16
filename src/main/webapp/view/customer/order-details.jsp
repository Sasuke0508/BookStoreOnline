<%--
  Created by IntelliJ IDEA.
  User: Nguyen Van Quan
  Date: 1/6/2022
  Time: 2:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page buffer="8192kb" autoFlush="true" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Gác Xép Bookstore">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gác Xép Bookstore</title>
    <jsp:include page="/assets/page/customer-lib-css.jsp"></jsp:include>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="https://images2.alphacoders.com/261/thumb-1920-26102.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>My Order</h2>
                    <div class="breadcrumb__option">
                        <!-- <a href="./index.html">Home</a>
                    <a href="./index.html">Shop</a> -->
                        <span>Open a book, open the world!</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Order Details Begin -->
<div class="order-details">
    <div class="container">
        <div class="container mt-5 mb-5">
            <div class="row">
                <div class="w-100">
                    <div class="card">
                        <div class="invoice px-5">
                            <h5><i class="fa fa-check text-success pr-2"></i>Your order Confirmed!</h5> <span class="font-weight-bold d-block mt-4 customer-order">Hello, ${user.account.userName}</span> <span>You order has been confirmed and will be shipped in next two days!</span>
                            <div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
                                <table class="table table-borderless">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Order Date</span> <span>${order.getCreateTime()}</span> </div>
                                        </td>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Order No</span> <span>MT12332345</span> </div>
                                        </td>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Payment</span> <span><img src="https://img.icons8.com/color/48/000000/mastercard.png" width="20" /> ${order.getPayment().paymentType}</span> </div>
                                        </td>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Shiping Address</span> <span>${order.shipment.address}</span> </div>
                                        </td>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Status</span><span><i class="fa fa-circle text-warning pr-1" style="font-size: 0.8rem;"></i>${order.orderStatus}</span> </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="product border-bottom table-responsive">
                                <table class="table table-borderless">
                                    <tbody>
                                    <c:forEach var="cartItem" items="${order.cart.getCartDetailList()}">
                                        <tr>
                                            <td width="20%"> <img src="${cartItem.getBookItem().getImageList().get(0).getPath()}" width="90"> </td>
                                            <td width="60%"> <span class="font-weight-bold product-name">${cartItem.getBookItem().getTitle()}</span>
                                                <div class="product-qty"> <span class="d-block">Quantity: ${cartItem.getQuantity()}</span> <span>Price: <fmt:formatNumber
                                                        type="number" maxFractionDigits="3"
                                                        value="${cartItem.getBookItem().getSalePrice()}" /> đ</span> </div>
                                            </td>
                                            <td width="20%">
                                                <div class="text-right"> <span class="font-weight-bold"><fmt:formatNumber
                                                        type="number" maxFractionDigits="3"
                                                        value="${cartItem.getBookItem().getSalePrice()*cartItem.getQuantity()}" /> đ</span> </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row d-flex justify-content-end">
                                <div class="col-md-5">
                                    <table class="table table-borderless">
                                        <tbody class="totals">
                                        <tr>
                                            <td>
                                                <div class="text-left"> <span class="text-muted">Subtotal</span> </div>
                                            </td>
                                            <td>
                                                <div class="text-right"> <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                                 value="${order.getCart().getTotal()}" />
                                        đ</span> </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="text-left"> <span class="text-muted">Shipping Fee</span> </div>
                                            </td>
                                            <td>
                                                <div class="text-right"> <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                                 value="${order.getShipment().getShipmentType().getFeeShip()}" />
                                        đ</span> </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="text-left"> <span class="text-muted">Tax Fee</span> </div>
                                            </td>
                                            <td>
                                                <div class="text-right"> <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                                 value="${0}" />
                                        đ</span> </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="text-left"> <span class="text-muted">Discount</span> </div>
                                            </td>
                                            <td>
                                                <div class="text-right"> <span class="text-success">0đ</span> </div>
                                            </td>
                                        </tr>
                                        <tr class="border-top border-bottom">
                                            <td>
                                                <div class="text-left"> <span class="font-weight-bold">Subtotal</span> </div>
                                            </td>
                                            <td>
                                                <div class="text-right"> <span class="font-weight-bold"><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                                                          value="${order.payment.amount}" />
                                        đ</span> </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <p>We will be sending shipping confirmation email when the item shipped successfully!</p>
                            <p class="font-weight-bold mb-0">Thanks for shopping with us!</p> <span style="font-style: italic;">Gac Xep Team</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Order Details End -->

<jsp:include page="footer.jsp"></jsp:include>

<jsp:include page="/assets/page/customer-lib-js.jsp"></jsp:include>
</body>

</html>