<%--
  Created by IntelliJ IDEA.
  User: Nguyen Van Quan
  Date: 1/5/2022
  Time: 4:09 PM
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

<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <div class="col-lg-3">
                    <div class="categories__item set-bg"
                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-van-on-ke-ca-khi-ban-khong-co-uoc-mo.png">
                        <h5><a href="#">Kỹ năng sống</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg"
                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/toi-thay-hoa-vang-tren-co-xanh-1.jpg">
                        <h5><a href="#">Truyện, hồi kí</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg"
                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-ky-nang-ban-hang-tuyet-dinh.png">
                        <h5><a href="#">Kinh doanh</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg"
                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-khu-vuon-bi-mat.png">
                        <h5><a href="#">Văn học</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg"
                         data-setbg="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-he-thong-giao-dich-ichimoku.png">
                        <h5><a href="#">Khoa học</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12" id="sachBanChay">
                <div class="section-title">
                    <h2>Sách bán chạy</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <li data-filter=".oranges">Văn học</li>
                        <li data-filter=".fresh-meat">Khoa học</li>
                        <li data-filter=".vegetables">Truyện</li>
                        <li data-filter=".fastfood">Kỹ năng sống</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <c:forEach var="book" items="${bookItemListBestSeller}">
            <c:if test="${book.getCategory().getName().equals('Văn học')}">
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                </c:if>
                <c:if test="${book.getCategory().getName().equals('Khoa học')}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat">
                    </c:if>
                    <c:if test="${book.getCategory().getName().equals('Truyện, hồi kí')}">
                    <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables">
                        </c:if>
                        <c:if test="${book.getCategory().getName().equals('Kỹ năng sống')}">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood">
                            </c:if>
<%--                                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood">--%>
                                    <div class="featured__item">
                                        <div class="featured__item__pic set-bg"
                                             data-setbg="${book.getImageList().get(0).getPath()}">
                                            <ul class="featured__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a
                                                        href="${pageContext.request.contextPath}/book/detail?bookItemID=${book.getId()}"><i
                                                        class="fa fa-search"></i></a></li>
                                                <li><a
                                                        href="${pageContext.request.contextPath}/cart/add?bookItemID=${book.getId()}"><i
                                                        class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="featured__item__text">
                                            <h6>
                                                <a href="#">${book.getTitle()}</a>
                                            </h6>
                                            <h5>
                                                <fmt:formatNumber type="number" maxFractionDigits="3"
                                                                  value="${book.getSalePrice()}"/>
                                                đ
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img
                            src="<c:url value = "https://lh3.googleusercontent.com/pw/AM-JKLXqL1WLaYHvei3G2FqxvzI27trgaOWeKb09ilMVfQGS326AfMwNUkmC7JnsIr6f2CozBG8Lvp2eYpYZhw-kjU1PQaG0vphbg0nE1xPiHqJaYsiwNaBoL1R9QqYnKu6EjkIGsxj5j6VjIAoJkMzaRUw=w1728-h713-no?authuser=4"/>"
                            alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img
                            src="<c:url value = "https://lh3.googleusercontent.com/pw/AM-JKLVQDIDBEnI5xGTBpAcykP2S7OA8hXuj2P3d3hyVaBe0_JGRaD1FWotsBfTiYtRHB7UjagO3jgNV98sRxQ4zzJQzNaGNvW8xkqJ2irArEKWsZ1ZFQVC08Ho1fKMl0ZYUbQlF4m3Yosfr6iCgk3uLIzA=w1728-h714-no?authuser=4"/>"
                            alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Sách mới về</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img
                                            src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-nhung-dieu-cam-ky-khi-giao-tiep-voi-khach-hang.png"
                                            alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Những cấm kị khi giao tiếp với khách hàng</h6>
                                    <span>$30.00</span>
                                </div>
                            </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-thau-hieu-nguoi-mua-giai-ma-tang-truong.png"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>Thấu hiểu người mua, giả mã tăng trưởng</h6>
                                <span>$30.00</span>
                            </div>
                        </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-lam-chu-nghe-thuat-ban-hang.png"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>Làm chủ nghệ thuật bán hàng</h6>
                                <span>$30.00</span>
                            </div>
                        </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img
                                            src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-loi-the-ban-hang.png"
                                            alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Lợi thế bán hàng</h6>
                                    <span>$30.00</span>
                                </div>
                            </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-100-y-tuong-ban-hang-hay-nhat-moi-thoi-dai.png"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>100 ý tưởng bán hàng hay nhất mọi thời đại</h6>
                                <span>$30.00</span>
                            </div>
                        </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/0403202160410b686246c.JPEG"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>Fibonacci trading</h6>
                                <span>$30.00</span>
                            </div>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Top đánh giá</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/toi-thay-hoa-vang-tren-co-xanh-1.jpg"
                                         alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Tôi thấy hoa vàng trên cỏ xanh</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-van-on-ke-ca-khi-ban-khong-co-uoc-mo.png"
                                         alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Vẫn ổn thôi, kể cả khi bạn không có ước mơ</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-cho-toi-xin-mot-ve-di-tuoi-tho.png"
                                         alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cho tôi xin một vé đi tuổi thơ</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-cafe-cung-tony.png"
                                         alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Cà phê cùng Tony</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-luoc-su-thoi-gian.png"
                                         alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Lược sử thời gian</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-dac-nhan-tam.png"
                                         alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Đắc nhân tâm</h6>
                                    <span>$30.00</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Giảm giá sâu</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img
                                            src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-7-thoi-quen-hieu-qua.png"
                                            alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>7 thói quen hiệu quả</h6>
                                    <span>$30.00</span>
                                </div>
                            </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-hom-nay-ta-giau-co.png"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>Hôm nay ta giàu có</h6>
                                <span>$30.00</span>
                            </div>
                        </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-chia-khoa-thanh-cong.png"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>Chìa khóa thành công</h6>
                                <span>$30.00</span>
                            </div>
                        </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img
                                            src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-nha-gia-kim.png"
                                            alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>Nhà giả kim</h6>
                                    <span>$30.00</span>
                                </div>
                            </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-100-y-tuong-ban-hang-hay-nhat-moi-thoi-dai.png"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>100 ý tưởng bán hàng hay nhất mọi thời đại</h6>
                                <span>$30.00</span>
                            </div>
                        </a> <a href="#" class="latest-product__item">
                            <div class="latest-product__item__pic">
                                <img
                                        src="https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-quang-ganh-lo-di-va-vui-song.png"
                                        alt="">
                            </div>
                            <div class="latest-product__item__text">
                                <h6>Quẳng gánh lo đi và vui sống</h6>
                                <span>$30.00</span>
                            </div>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title from-blog__title">
                    <h2>Cafe sách</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img
                                src="https://revisach.com/wp-content/uploads/2021/07/van-nan-sach-gia.png"
                                alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5>
                            <a href="#">Vấn nạn sách giả và 5 tips phân biệt sách thật
                                với sách giả</a>
                        </h5>
                        <p>Theo thông tin được công bố gần đây bởi ông Nguyễn Văn
                            Phước – Giám đốc Công ty sách First News (Top đầu thương hiệu
                            xuất bản được ...</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img
                                src="https://revisach.com/wp-content/uploads/2021/07/ly-do-nen-mua-sach-cu.png"
                                alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5>
                            <a href="#">8 lý do bạn nên mua sách cũ thay vì sách mới</a>
                        </h5>
                        <p>Hiện nay, mặc dù có rất nhiều phương thức đọc sách tiện
                            lợi như đọc qua ứng dụng điện thoại, máy đọc sách, nghe sách
                            nói,…</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img
                                src="https://revisach.com/wp-content/uploads/2021/07/sai-lam-khi-doc-sach-self-help.png"
                                alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5>
                            <a href="#">5 sai lầm phổ biến khi đọc sách Self-help có thể
                                bạn cũng mắc phải</a>
                        </h5>
                        <p>Marketdata Enterprises, Inc. – Một tập đoàn nghiên cứu thị
                            trường hàng đầu đã có báo cáo chỉ ra rằng: Ngành công nghiệp
                            sách self-help đang ...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<jsp:include page="footer.jsp"></jsp:include>

<jsp:include page="/assets/page/customer-lib-js.jsp"></jsp:include>
</body>

</html>
