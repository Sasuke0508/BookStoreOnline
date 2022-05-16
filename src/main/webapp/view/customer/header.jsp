<%--
  Created by IntelliJ IDEA.
  User: Nguyen Van Quan
  Date: 1/5/2022
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#"><img
                src="<c:url value = "https://lh3.googleusercontent.com/pw/AM-JKLXL4tTHqDR1st8reCgjf8AOapE76sCbIuT2jeCWuLvLbYDiK8QTXHW2NxhT4VnMczkkt_DVQPMEUHrzyFOSY5VrxXvp3_mDRCTevOBDil2eUD7nCDyedqpwm17TmyU8CjkXzL_i_0YRsJjSpJmtOf8=w1920-h715-no?authuser=4"/>"
                alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href=<c:url value = "/cart/"/>><i
                    class="fa fa-shopping-bag"></i> <span>${quantity}</span></a></li>
        </ul>
        <div class="header__cart__price">
            Giỏ: <span><fmt:formatNumber type="number"
                                         maxFractionDigits="3" value="${totalPrice}" />
								đ</span>
        </div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="<c:url value = "/assets/img/language.img"/>" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">VietNam</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
        <c:if test="${user == null}">
            <div class="header__top__right__auth">
                <div class="loginOrRegister"><i class="fa fa-user mr-1"></i>
                    <div href="#" data-toggle="modal" data-target="#loginModal">Login</div> |
                    <div href="#" data-toggle="modal" data-target="#registerModal">Register</div>
                </div>
            </div>
        </c:if>
        <c:if test="${user != null}">
            <div class="header__top__right__language mr-4">
                <div href="#">
                    <i class="fa fa-user mr-1"></i> ${user.account.userName}
                    <ul>
                        <li><a href="#">Profile</a></li>
                        <li><a href="${pageContext.request.contextPath}/order">Orders</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href=<c:url value = "/"/>>Home</a></li>
            <li><a href=<c:url value = "/book/"/>>Shop</a></li>
            <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href=<c:url value = "book/detail"/>>Shop Details</a></li>
                    <li><a href=<c:url value = "/cart/"/>>Shoping Cart</a></li>
                    <li><a href=<c:url value = "/checkout"/>>Check Out</a></li>
                    <li><a href=<c:url value = "/blog-detail/"/>>Blog Details</a></li>
                </ul></li>
            <li><a href=<c:url value = "/blog/"/>>Blog</a></li>
            <li><a href=<c:url value = "/contact.jsp"/>>Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
            class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i>gacxepbook@gmail.com</li>
            <li>Free Shipping for all Order of $99</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i>gacxepbook@gmail.com</li>
                            <li>Free Shipping for all Order of $99</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                                class="fa fa-twitter"></i></a> <a href="#"><i
                                class="fa fa-linkedin"></i></a> <a href="#"><i
                                class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <img src="<c:url value = "/views/img/language.png"/>" alt="">
                            <div>Tiếng Việt</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Tiếng Việt</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div>
                        <c:if test="${user == null}">
                            <div class="header__top__right__language mr-4">
                                <div class="loginOrRegister"><i class="fa fa-user mr-1"></i>
                                    <div href="#" data-toggle="modal" data-target="#loginModal">Login</div> |
                                    <div href="#" data-toggle="modal" data-target="#registerModal">Register</div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${user != null}">
                            <div class="header__top__right__language mr-4">
                                <div href="#">
                                    <i class="fa fa-user mr-1"></i> ${user.account.userName}
                                    <ul>
                                        <li><a href="#">Profile</a></li>
                                        <li><a href="${pageContext.request.contextPath}/order">Orders</a></li>
                                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href=<c:url value = "/"/>><img style="width: 50%"
                                                      src="<c:url value = "https://lh3.googleusercontent.com/pw/AM-JKLXL4tTHqDR1st8reCgjf8AOapE76sCbIuT2jeCWuLvLbYDiK8QTXHW2NxhT4VnMczkkt_DVQPMEUHrzyFOSY5VrxXvp3_mDRCTevOBDil2eUD7nCDyedqpwm17TmyU8CjkXzL_i_0YRsJjSpJmtOf8=w1920-h715-no?authuser=4"/>"
                                                      alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href=<c:url value = "/"/>>Home</a></li>
                        <li><a href=<c:url value = "/book/"/>>Shop</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="header__menu__dropdown">
                                <li><a href=<c:url value = "book/detail"/>>Shop Details</a></li>
                                <li><a href=<c:url value = "/cart/"/>>Shoping Cart</a></li>
                                <li><a href=<c:url value = "/checkout"/>>Check Out</a></li>
                                <li><a href=<c:url value = "/blog-detail"/>>Blog Details</a></li>
                            </ul></li>
                        <li><a href=<c:url value = "/blog"/>>Blog</a></li>
                        <li><a href=<c:url value = "/contact.jsp"/>>Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href=<c:url value = "/cart/"/>><i
                                class="fa fa-shopping-bag"></i> <span>${quantity}</span></a></li>
                    </ul>
                    <div class="header__cart__price">
                        Giỏ: <span><fmt:formatNumber type="number"
                                                     maxFractionDigits="3" value="${totalPrice}" />
								đ</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<c:if test="${pageContext.request.servletPath!='/view/customer/index.jsp'}">
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i> <span>Danh mục sách</span> <i
                                class="fa fa-angle-down ml-4"></i>
                        </div>
                        <ul style="text-transform: capitalize;">
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
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="search" method="GET">
                                <div class="hero__search__key">
                                    <select name="typeSearch" >
                                        <option value="Name">Name</option>
                                        <option value="Author">Author</option>
                                        <option value="Publisher">Publisher</option>
                                    </select>
                                </div>
                                <input type="text" name = "keySearch" placeholder="What do you need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>Hỗ trợ 24/7</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>

<c:if test="${pageContext.request.servletPath == '/view/customer/index.jsp'}">
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i> <span>Danh mục sách</span> <i
                                class="fa fa-angle-down ml-4"></i>
                        </div>
                        <ul style="text-transform: capitalize;">
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
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="book/search" method="GET">
                                <div class="hero__search__key">
                                    <select name="typeSearch" id="">
                                        <option value="Name">Name</option>
                                        <option value="Author">Author</option>
                                        <option value="Publisher">Publisher</option>
                                    </select>
                                </div>
                                <input type="text" name = "keySearch" placeholder="What do you need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>Hỗ trợ 24/7</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg"
                         data-setbg="<c:url value = "https://lh3.googleusercontent.com/pw/AM-JKLUEhSSY0iYj6jsb7fh3IMlLmLuV55jcwsdOZnI-gXKRFWaLSgqvYkDWLUmItAKvbvYkbtJy0KzenUEoqc6uuu32AEwweW7FZ6o_hAk2199eurZJ7AO76SgD4px9R3KX7t4oNHP4F6Kjo5AhEZwkQZg=w1414-h943-no?authuser=4"/>">
                        <div class="hero__text">
                            <span>BIG SALE</span>
                            <h2>
                                Autumn <br />Book Festival
                            </h2>
                            <p>Let's fill up your bookshelf</p>
                            <a href="#sachBanChay" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>

<!-- Modal Login -->
<div class="modal fade modalLogin" id="loginModal" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-title text-center">
                    <img class="login__logo"
                         src="<c:url value = "https://lh3.googleusercontent.com/pw/AM-JKLUybqoe23yvSun3EQDkrZ4-j5rP8Ndu9NKgJ7mX_nHN_uOL1oiyJDGCpDH5rV4kuravpXpRIYSEvfHuoD8cEg9qvVzFx0d2-8JI8xhcFliFGGw7-bty6F8Me1TljUoG4O1NWshjJMwkIb1oidddLeae=w583-h385-no?authuser=4"/>" />
                    <h4>Login</h4>
                </div>
                <div class="d-flex flex-column text-center">
                    <form method="POST" action="login">
                        <div class="form-group">
                            <input required type="text" class="form-control" name="username"
                                   placeholder="Tên đăng nhập">
                        </div>
                        <div class="form-group">
                            <input required type="password" class="form-control"
                                   name="password" placeholder="Mật khẩu">
                        </div>
                        <div id="generalErrorMessage" class="error-lbl" style="display:none;"></div>
                        <button id = "btnLogin" type="submit" class="btn btn-primary btn-block"
                                style="background-color: #e98156;">Login</button>
                    </form>

                    <div class="text-center text-muted delimiter">hoặc đăng nhập
                        bằng</div>
                    <div class="d-flex justify-content-center social-buttons">
                        <button type="button" class="btn btn-secondary"
                                data-toggle="tooltip" data-placement="top" title="Twitter">
                            <i class="fa fa-twitter"></i>
                        </button>
                        <button type="button" class="btn btn-secondary"
                                data-toggle="tooltip" data-placement="top" title="Facebook">
                            <i class="fa fa-facebook"></i>
                        </button>
                        <button type="button" class="btn btn-secondary"
                                data-toggle="tooltip" data-placement="top" title="Gmail">
                            <i class="fa fa-google"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <div class="signup-section close" data-dismiss="modal">
                    Chưa có tài khoản? <a aria-hidden="true" href="#"
                                          data-toggle="modal" data-target="#registerModal"
                                          style="color: #e98156"> Sign Up</a>.
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Register -->
<div class="modal fade modalLogin w-60" id="registerModal"
     tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-0">
                <div class="form-title text-center">
                    <img class="login__logo"
                         src="https://lh3.googleusercontent.com/pw/AM-JKLUybqoe23yvSun3EQDkrZ4-j5rP8Ndu9NKgJ7mX_nHN_uOL1oiyJDGCpDH5rV4kuravpXpRIYSEvfHuoD8cEg9qvVzFx0d2-8JI8xhcFliFGGw7-bty6F8Me1TljUoG4O1NWshjJMwkIb1oidddLeae=w583-h385-no?authuser=4" />
                    <h4>Register</h4>
                </div>
                <div class="d-flex flex-column text-center">
                    <form method="POST" action="register">
                        <div class="container">
                            <div class="form-group row">
                                <div class="col-6 pl-0 pr-1">
                                    <input required type="text" class="form-control" name="firstName"
                                           placeholder="Firstname">
                                </div>
                                <div class="col-6 pr-0 pl-1">
                                    <input required type="text" class="form-control" name="lastName"
                                           placeholder="Lastname">
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="form-group row">
                                <div class="col-6 pl-0 pr-1">
                                    <input required type="text" class="form-control" name="username"
                                           placeholder="Tên đăng nhập">
                                </div>
                                <div class="col-6 pr-0 pl-1">
                                    <select style="outline: none;
                                        box-shadow: none;
                                        padding-top: 2px;" name="gender" class="form-control">
                                        <option value="Male">Nam</option>
                                        <option value="Female">Nữ</option>
                                        <option value="Other">Khác</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="form-group row">
                                <div class="col-6 pl-0 pr-1">
                                    <input required type="password" class="form-control" name="password"
                                           placeholder="Mật khẩu">
                                </div>
                                <div class="col-6 pr-0 pl-1">
                                    <input required type="password" class="form-control" name="confirmPassword"
                                           placeholder="Xác nhận mật khẩu">
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="form-group row">
                                <div class="col-6 pl-0 pr-1">
                                    <input required type="email" class="form-control" name="email"
                                           placeholder="Email">
                                </div>
                                <div class="col-6 pr-0 pl-1">
                                    <input required type="text" class="form-control" name="phoneNumber"
                                           placeholder="Số điện thoại">
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="form-group row">
                                <div class="col-4 px-0 pr-1">
                                    <input required type="text" class="form-control" name="province"
                                           placeholder="Tỉnh/Thành phố">
                                </div>
                                <div class="col-4 px-1">
                                    <input required type="text" class="form-control" name="district"
                                           placeholder="Quận/Huyện">
                                </div>
                                <div class="col-4 px-0 pl-1">
                                    <input required type="text" class="form-control" name="ward"
                                           placeholder="Phường/Xã">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input required type="text" class="form-control" name="address"
                                   placeholder="Địa chỉ nhà">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block"
                                style="background-color: #e98156;">Sign up</button>
                    </form>

                    <div class="text-center text-muted delimiter">hoặc đăng ký bằng</div>
                    <div class="d-flex justify-content-center social-buttons">
                        <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="top"
                                title="Twitter">
                            <i class="fa fa-twitter"></i>
                        </button>
                        <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="top"
                                title="Facebook">
                            <i class="fa fa-facebook"></i>
                        </button>
                        <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="top"
                                title="Gmail">
                            <i class="fa fa-google"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>