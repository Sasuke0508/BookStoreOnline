<%--
  Created by IntelliJ IDEA.
  User: Nguyen Van Quan
  Date: 1/6/2022
  Time: 1:09 AM
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
                    <h2>Check out</h2>
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

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                </h6>
            </div>
        </div>
        <div class="checkout__form">
            <h4>Thông tin thanh toán</h4>
            <form action="${pageContext.request.contextPath}/checkout" method="post" class = "orderInfo">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Họ đệm<span>*</span></p>
                                    <input type="text" value="${user.fullName.firstName}">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Tên<span>*</span></p>
                                    <input value="${user.fullName.lastName}" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Địa chỉ<span>*</span></p>
                            <input name="address" value="${user.address.country}" type="text" placeholder="Số nhà, ngõ, ..." class="checkout__input__add">
                        </div>
                        <div class="checkout__input">
                            <p>Tỉnh/Thành phố<span>*</span></p>
                            <input name="province" value="${user.address.province}" type="text">
                        </div>
                        <div class="checkout__input">
                            <p>Quận/Huyện<span>*</span></p>
                            <input name="district" value="${user.address.district}" type="text">
                        </div>
                        <div class="checkout__input">
                            <p>Phường/Xã<span>*</span></p>
                            <input name="street" value="${user.address.street}" type="text">
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="checkout__input">
                                    <p>Số điện thoại<span>*</span></p>
                                    <input name="phoneNumber" value="${user.phoneNumber}" type="text">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input value="${user.email}" type="text">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="checkout__input">
                                    <p>Phương thức vận chuyển<span>*</span></p>
                                    <select name="shipmentType" style="width: 100%;
                                        height: 46px;
                                        border: 1px solid #ebebeb;
                                        padding-left: 4px;
                                        font-size: 16px;
                                        color: #b2b2b2;
                                        border-radius: 4px;">
                                        <option value="SHIP01">Giao hàng tiết kiệm   (+10.000đ)</option>
                                        <option value="SHIP02">Giao hàng nhanh   (+20.000đ)</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="checkout__input">
                            <p>Ghi chú<span>*</span></p>
                            <input name="note" type="text"
                                   placeholder="Để lại lưu ý cho nhân viên, ví dụ thời gian có thể nhận sách, địa chỉ nhận hàng, ...">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Đơn của bạn</h4>
                            <div class="checkout__order__products">Sách <span>Thành tiền</span></div>
                            <div class="container-fluid">
                                <c:forEach var="cartItem" items="${cart.getCartDetailList()}">
                                    <div class="row">
                                        <div class="col-8 pl-0">${cartItem.getBookItem().getTitle()} <span>x</span> ${cartItem.getQuantity()}</div>
                                        <div style="color: #6f6f6f;"
                                             class="col-4 pr-0 font-weight-bold">
                                            <fmt:formatNumber type="number" maxFractionDigits="3"
                                                              value="${cartItem.getBookItem().getSalePrice()*cartItem.getQuantity()}" />
                                            đ
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="checkout__order__subtotal">
                                Tạm tính <span><fmt:formatNumber type="number"
                                                                 maxFractionDigits="3" value="${totalPrice}" /> đ</span>
                            </div>
                            <div class="checkout__order__total">
                                Phí vận chuyển <span style="color: black"><fmt:formatNumber
                                    type="number" maxFractionDigits="3" value="10000" /> đ</span>
                            </div>
                            <div class="checkout__order__total">
                                Thành tiền <span><fmt:formatNumber type="number"
                                                                   maxFractionDigits="3" value="${totalPrice + 10000}" /> đ</span>
                            </div>
                            <div class="checkout__input">
                                <input id="paymentType" type="hidden" name="paymentType" value="COD" type="text">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc-or">
                                    Thanh toán khi nhận hàng
                                    <input checked type="checkbox" id="acc-or" class="radio">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>(Khuyến khích thanh toán trả trước và hạn chế tiếp xúc gần để đề phòng dịch COVID-19)
                            </p>
                            <div class="checkout__input__checkbox">
                                <label for="payment">
                                    Thẻ ATM nội địa/Internet Banking (Hỗ trợ Internet Banking)
                                    <input type="checkbox" id="payment" class="radio">
                                    <span class=" checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="paypal">
                                    Thanh toán bằng ví MoMo
                                    <input type="checkbox" id="paypal" class="radio">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <button type="submit" class="site-btn">MUA SÁCH</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<jsp:include page="footer.jsp"></jsp:include>

<jsp:include page="/assets/page/customer-lib-js.jsp"></jsp:include>

<script>
    $("input:checkbox").on('click', function () {
        // in the handler, 'this' refers to the box clicked on
        var $box = $(this);
        if ($box.is(":checked")) {
            // the name of the box is retrieved using the .attr() method
            // as it is assumed and expected to be immutable
            var group = "input:checkbox.radio";
            // the checked state of the group/box on the other hand will change
            // and the current value is retrieved using .prop() method
            $(group).prop("checked", false);
            $box.prop("checked", true);
            var paymentType = $box.attr("id");
            switch (paymentType){
                case "acc-or":{
                    $("#paymentType").attr("value", "COD")
                    break;
                }
                case "payment":{
                    $("#paymentType").attr("value", "Credit")
                    break;
                }
                case "paypal":{
                    $("#paymentType").attr("value", "ElectricWallet")
                    break;
                }
            }
        } else {
            $box.prop("checked", false);
        }
    });
</script>


</body>

</html>
