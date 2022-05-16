<%--
  Created by IntelliJ IDEA.
  User: Nguyen Van Quan
  Date: 1/5/2022
  Time: 11:20 PM
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
                    <h2>Shopping Cart</h2>
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

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form method="post" action="${pageContext.request.contextPath}/cart/update" class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cartItem" items="${cart.getCartDetailList()}">
                            <tr>
                                <td class="shoping__cart__item"><img
                                        style="width: 100px;"
                                        src="${cartItem.getBookItem().getImageList().get(0).getPath()}"
                                        alt="">
                                    <h5>${cartItem.getBookItem().getTitle()}</h5></td>
                                <td class="shoping__cart__price"><fmt:formatNumber
                                        type="number" maxFractionDigits="3"
                                        value="${cartItem.getBookItem().getSalePrice()}" /> đ</td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input name="${cartItem.getID()}" type="text" value="${cartItem.getQuantity()}">
                                        </div>
                                    </div>
                                </td>
                                <td class="shoping__cart__total"><fmt:formatNumber
                                        type="number" maxFractionDigits="3"
                                        value="${cartItem.getBookItem().getSalePrice()*cartItem.getQuantity()}" />
                                    đ</td>
                                <td class="shoping__cart__item__close"><a href="${pageContext.request.contextPath}/cart/remove?cartDetailID=${cartItem.getID()}"
                                        ><i class="fa fa-times pr-2"></i></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-lg-12 px-0">
                        <div class="shoping__cart__btns mt-5">
                            <a href="${pageContext.request.contextPath}/book/" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                            <button style="border: none" type="submit" class="primary-btn cart-btn cart-btn-right">Upadate Cart</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5>Discount Codes</h5>
                        <form action="#">
                            <input type="text" placeholder="Enter your coupon code">
                            <button type="submit" class="site-btn">APPLY COUPON</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li>Subtotal <span><fmt:formatNumber type="number"
                                                             maxFractionDigits="3" value="${totalPrice}" /> đ
                            </td></span></li>
                        <li>Total <span><fmt:formatNumber type="number"
                                                          maxFractionDigits="3" value="${totalPrice}" /> đ</span></li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/checkout" class="primary-btn">PROCEED TO CHECKOUT</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

<jsp:include page="footer.jsp"></jsp:include>

<jsp:include page="/assets/page/customer-lib-js.jsp"></jsp:include>
</body>

</html>