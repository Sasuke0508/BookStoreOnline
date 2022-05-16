<%--
  Created by IntelliJ IDEA.
  User: Nguyen Van Quan
  Date: 1/6/2022
  Time: 12:41 AM
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
                    <h2>Book World</h2>
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

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Danh mục</h4>
                        <ul>
                            <li><a href="#">Văn học</a></li>
                            <li><a href="#">Kinh tế</a></li>
                            <li><a href="#">Tâm lý - Kỹ năng sống</a></li>
                            <li><a href="#">Nuôi dạy con</a></li>
                            <li><a href="#">Sách thiếu nhi</a></li>
                            <li><a href="#">Thường thức - đời sống</a></li>
                            <li><a href="#">Khoa học</a></li>
                            <li><a href="#">Sách ngoại ngữ</a></li>
                            <li><a href="#">Truyện, hồi kí</a></li>
                            <li><a href="#">Sách chuyên ngành</a></li>
                            <li><a href="#">Tạp chí, văn phòng phẩm</a></li>
                        </ul>
                    </div>
                    <div class="sidebar__item">
                        <h4>Giá</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                 data-min="10" data-max="540">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar__item sidebar__item__color--option">
                        <h4>Đánh giá</h4>
                        <div style="color: black; cursor: pointer;">
                                <span style="color: #EDBB0E;">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </span>
                            từ 5 sao
                        </div>
                        <div style="color: black; cursor: pointer;">
                                <span style="color: #EDBB0E;">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </span>
                            <span style="color: rgb(173, 171, 171);">
                                    <i class="fa fa-star"></i>
                                </span> từ 4 sao
                        </div>
                        <div style="color: black; cursor: pointer;">
                                <span style="color: #EDBB0E;">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </span>
                            <span style="color: rgb(173, 171, 171);">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </span> từ 3 sao
                        </div>

                    </div>
                    <div class="sidebar__item">
                        <h4>Công ty phát hành</h4>
                        <label class="publisher">
                            <input type="checkbox">
                            <span class="checkmark"></span>
                            Alphabooks
                        </label>

                        <label class="publisher">
                            <input type="checkbox">
                            <span class="checkmark"></span>
                            Minh Long
                        </label>

                        <label class="publisher">
                            <input type="checkbox">
                            <span class="checkmark"></span>
                            First News - Trí Việt
                        </label>

                        <label class="publisher">
                            <input type="checkbox">
                            <span class="checkmark"></span>
                            Nhã Nam
                        </label>

                        <label class="publisher">
                            <input type="checkbox">
                            <span class="checkmark"></span>
                            Fahasa
                        </label>

                        <label class="publisher">
                            <input type="checkbox">
                            <span class="checkmark"></span>
                            Nhiều công ty phát hành
                        </label>
                    </div>
                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Sách mới về</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-nhung-dieu-cam-ky-khi-giao-tiep-voi-khach-hang.png"
                                                 alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Những cấm kị khi giao tiếp với khách hàng</h6>
                                            <span>79.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-thau-hieu-nguoi-mua-giai-ma-tang-truong.png"
                                                 alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Thấu hiểu người mua, giả mã tăng trưởng</h6>
                                            <span>85.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-lam-chu-nghe-thuat-ban-hang.png"
                                                 alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Làm chủ nghệ thuật bán hàng</h6>
                                            <span>79.000 đ</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-loi-the-ban-hang.png"
                                                 alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Lợi thế bán hàng</h6>
                                            <span>175.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-100-y-tuong-ban-hang-hay-nhat-moi-thoi-dai.png"
                                                 alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>100 ý tưởng bán hàng hay nhất mọi thời đại</h6>
                                            <span>65.000 đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/0403202160410b686246c.JPEG"
                                                 alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Fibonacci trading</h6>
                                            <span>179.000 đ</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Sale Off</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-7-thoi-quen-hieu-qua.png">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-search"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Kỹ năng sống</span>
                                        <h5><a href="#">7 thói quen hiệu quả</a></h5>
                                        <div class="product__item__price">80.000đ <span>100.000đ</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-hom-nay-ta-giau-co.png">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-search"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Kỹ năng sống</span>
                                        <h5><a href="#">Hôm nay ta giàu có</a></h5>
                                        <div class="product__item__price">80.000đ <span>100.000đ</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-chia-khoa-thanh-cong.png">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-search"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Kỹ năng sống</span>
                                        <h5><a href="#">Chìa khóa thành công</a></h5>
                                        <div class="product__item__price">80.000đ <span>100.000đ</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-nha-gia-kim.png">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-search"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Self help</span>
                                        <h5><a href="#">Nhà giả kim</a></h5>
                                        <div class="product__item__price">80.000đ <span>100.000đ</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-100-y-tuong-ban-hang-hay-nhat-moi-thoi-dai.png">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-search"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Kinh doanh</span>
                                        <h5><a href="#">100 ý tưởng bán hàng hay nhất mọi thời đại</a></h5>
                                        <div class="product__item__price">80.000đ <span>100.000đ</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-quang-ganh-lo-di-va-vui-song.png">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-search"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Self help</span>
                                        <h5><a href="#">Quẳng gánh lo đi và vui sống</a></h5>
                                        <div class="product__item__price">80.000đ <span>100.000đ</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sort By</span>
                                <select>
                                    <option value="0">Giá tăng dần</option>
                                    <option value="0">Giá giảm dần</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>${bookItemList.size()}</span> Products found</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Render Book  -->
                    <c:forEach var="book" items="${bookItemList}">
                        <div class="col-lg-4 col-md-6 col-sm-6 mix oranges fresh-meat">
                            <div class="product__item">
                                <div class="product__item__pic set-bg"
                                     data-setbg="${book.getImageList().get(0).getPath()}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a
                                                href="${pageContext.request.contextPath}/book/detail?bookItemID=${book.getId()}"><i
                                                class="fa fa-search"></i></a></li>
                                        <li><a
                                                href="${pageContext.request.contextPath}/cart/add?bookItemID=${book.getId()}"><i
                                                class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6>
                                        <a href="#">${book.getTitle()}</a>
                                    </h6>
                                    <h5>
                                        <fmt:formatNumber type="number" maxFractionDigits="3"
                                                          value="${book.getSalePrice()}" />
                                        đ
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="product__pagination">
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<jsp:include page="footer.jsp"></jsp:include>

<jsp:include page="/assets/page/customer-lib-js.jsp"></jsp:include>
</body>

</html>