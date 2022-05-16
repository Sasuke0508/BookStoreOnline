<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Nguyen Van Quan
  Date: 1/6/2022
  Time: 9:53 AM
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
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="https://images2.alphacoders.com/261/thumb-1920-26102.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>My Account</h2>
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

<!-- Order List Begin -->
<div id="page" class="site container">
    <div id="content" class="site-content">
        <div id="primary" class="content-area  no-sidebar ">
            <main id="main" class="site-main">
                <article id="post-15" class="post-15 page type-page status-publish hentry">
                    <!-- .entry-header -->
                    <div class="entry-content">
                        <div class="woocommerce d-flex profile-body">
                            <nav class="woocommerce-MyAccount-navigation">
                                <ul>
                                    <li
                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard">
                                        <a href="https://cartsy.redq.io/my-account/">
                                            <span class="dashicons dashicons-dashboard"></span> Dashboard </a>
                                    </li>
                                    <li
                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders is-active">
                                        <a href="https://cartsy.redq.io/my-account/orders/">
                                            <span class="dashicons dashicons-cart"></span> Orders </a>
                                    </li>
                                    <li
                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--downloads">
                                        <a href="https://cartsy.redq.io/my-account/downloads/">
                                            <span class="dashicons dashicons-media-archive"></span> Downloads </a>
                                    </li>
                                    <li
                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--edit-address">
                                        <a href="https://cartsy.redq.io/my-account/edit-address/">
                                            <span class="dashicons dashicons-admin-users"></span> Addresses </a>
                                    </li>
                                    <li
                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--edit-account">
                                        <a href="https://cartsy.redq.io/my-account/edit-account/">
                                            <span class="dashicons dashicons-chart-bar"></span> Account details </a>
                                    </li>
                                    <li
                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout">
                                        <a
                                                href="https://cartsy.redq.io/my-account/customer-logout/?_wpnonce=6ea241a8a8">
                                                <span class="dashicons dashicons-upload"
                                                      style="transform: rotate(90deg);"></span> Logout </a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="woocommerce-MyAccount-content">
                                <div class="woocommerce-notices-wrapper"></div>
                                <table
                                        class="woocommerce-orders-table woocommerce-MyAccount-orders shop_table shop_table_responsive my_account_orders account-orders-table">
                                    <thead>
                                    <tr>
                                        <th
                                                class="woocommerce-orders-table__header woocommerce-orders-table__header-order-number">
                                            <span class="nobr">Order</span>
                                        </th>
                                        <th
                                                class="woocommerce-orders-table__header woocommerce-orders-table__header-order-date">
                                            <span class="nobr">Date</span>
                                        </th>
                                        <th
                                                class="woocommerce-orders-table__header woocommerce-orders-table__header-order-status">
                                            <span class="nobr">Status</span>
                                        </th>
                                        <th
                                                class="woocommerce-orders-table__header woocommerce-orders-table__header-order-total">
                                            <span class="nobr">Total</span>
                                        </th>
                                        <th
                                                class="woocommerce-orders-table__header woocommerce-orders-table__header-order-actions">
                                            <span class="nobr">Actions</span>
                                        </th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="order" items="${orderList}">
                                        <tr
                                                class="woocommerce-orders-table__row woocommerce-orders-table__row--status-processing order">
                                            <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-number"
                                                data-title="Order">
                                                <a href="${pageContext.request.contextPath}/order?orderID=${order.id}">
                                                    #<%=new Date().getTime()%> </a>

                                            </td>
                                            <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-date"
                                                data-title="Date">
                                                <time datetime="2021-12-26T17:17:21+00:00">${order.createTime}</time>

                                            </td>
                                            <c:if test="${order.orderStatus.toString().equals('Pending')}">
                                                <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-status"
                                                    data-title="Status">
                                                    <i class="fa fa-circle text-warning pr-1" style="font-size: 0.8rem;"></i>Pending
                                                </td>
                                            </c:if>
                                            <c:if test="${order.orderStatus.toString().equals('Shipped')}">
                                                <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-status"
                                                    data-title="Status">
                                                    <i class="fa fa-circle text-secondary pr-1" style="font-size: 0.8rem;"></i>Shipped
                                                </td>
                                            </c:if>
                                            <c:if test="${order.orderStatus.toString().equals('Delivered')}">
                                                <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-status"
                                                    data-title="Status">
                                                    <i class="fa fa-circle text-success pr-1" style="font-size: 0.8rem;"></i>Delivered
                                                </td>
                                            </c:if>
                                            <c:if test="${order.orderStatus.toString().equals('Cancelled')}">
                                                <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-status"
                                                    data-title="Status">
                                                    <i class="fa fa-circle text-danger pr-1" style="font-size: 0.8rem;"></i>Cancelled
                                                </td>
                                            </c:if>
                                            <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-total"
                                                data-title="Total">
                                                    <span class="woocommerce-Price-amount amount"><span
                                                            class="woocommerce-Price-currencySymbol"></span><fmt:formatNumber
                                                            type="number" maxFractionDigits="3"
                                                            value="${order.payment.amount}" /> đ</span>
                                                for ${order.cart.cartDetailList.size()} items
                                            </td>
                                            <td class="woocommerce-orders-table__cell woocommerce-orders-table__cell-order-actions"
                                                data-title="Actions">
                                                <a href="${pageContext.request.contextPath}/order?orderID=${order.id}"
                                                   class="btn">View</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>




                            </div>
                        </div>
                    </div>
                    <!-- .entry-content -->

                </article>
                <!-- #post-15 -->
            </main>
            <!-- #main -->


        </div>
        <!-- #primary -->


    </div>
    <!-- #content -->

</div>
<!-- #page -->
<!-- Order List End -->

<!-- Order Details End -->

<jsp:include page="footer.jsp"></jsp:include>

<jsp:include page="/assets/page/customer-lib-js.jsp"></jsp:include>
</body>

</html>