<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>EduCamp - LMS Template for Courses &amp; Education</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/core-img/favicon.ico">

    <!-- ===================== All CSS Files ===================== -->

    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="../recources/style.css">


    <!-- Responsive css -->
    <link rel="stylesheet" href="../css/responsive.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="../recources/responsive.css">

</head>

<body>
<!-- preloader start -->
<div id="preloader"></div>
<!-- /.end preloader -->

<!-- Header Area Start -->
<header class="header_area">
    <!-- Top Header Area Start -->
    <div class="top_header_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md">
                    <!--  Top Quote Area Start -->
                    <div class="top_quote">
                        <p>Welcome to EduCamp LMS Platform</p>
                    </div>
                </div>
                <div class="col-md">
                    <div class="login_language_area d-flex align-items-center float-right">
                        <!-- Login Register Area Start -->
                        <div class="login_register">
                            <a href="/register"><i class="fa fa-lock" aria-hidden="true"></i> Login/Register</a>
                        </div>
                        <!-- Language Area Start -->
                        <div class="language_area">
                            <div class="dropdown">
                                <button aria-expanded="false" aria-haspopup="true" data-toggle="dropdown" id="lag"
                                        type="button" class="btn btn-default dropdown-toggle"><i class="fa fa-globe"
                                                                                                 aria-hidden="true"></i>
                                    Language
                                </button>
                                <ul aria-labelledby="lag" class="dropdown-menu">
                                    <li><a href="/">English</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Header Area Start -->
    <div class="main_header_area animated">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-3">
                    <!-- Logo Area -->
                    <div class="logo_area">
                        <a href="/"><img src="img/core-img/logo.png" alt=""></a>
                    </div>
                </div>

                <div class="col-12 col-md-9">
                    <!-- Menu Area -->
                    <div class="main_menu_area">
                        <div class="mainmenu">
                            <nav>
                                <ul id="nav">
                                    <c:if test="${current!=null && current.type=='MANAGER'}">
                                        <h2>hello ${current.name},${current.type}</h2>
                                        <li><a href="/">home</a></li>
                                        <li><a href="/register">add student</a></li>
                                        <li><a href="/lesson">add lesson</a></li>
                                        <li><a href="/lessonView">view lesson</a></li>
                                        <li><a href="/studentsView">view student</a></li>
                                        <li><a href="/logout">log out</a></li>
                                    </c:if>
                                    <c:if test="${current!=null && current.type=='USER'}">
                                        <h2>hello ${current.name},${current.type}</h2>
                                        <li><a href="/">home</a></li>
                                        <li><a href="/lessonView">view lesson</a></li>
                                        <li><a href="/studentsView">view student</a></li>
                                        <li><a href="/logout">log out</a></li>
                                    </c:if>
                                    <c:if test="${current==null}">
                                    <li><a href="/loginPage">login</a></c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!--  ===================== Header Area End ===================== -->

<!-- Breadcumb area start -->
<section class="breadcumb_area" style="background-image: url(img/bg-pattern/breadcumb.jpg);">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="breadcumb_section">
                    <!-- Breadcumb page title start -->
                    <div class="page_title">
                        <h3>Register</h3>
                    </div>
                    <!-- Breadcumb page pagination start -->
                    <div class="page_pagination">
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                            <li>Register</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcumb area end -->

<!-- Login area start -->
<div class="login_area section_padding_100">
    <div class="container">
        <div class="row">
            <!-- Login thumb -->
            <div class="col-12 col-lg-5 col-xl-6">
                <div class="login_thumb" style="background-image: url(img/bg-pattern/courses-bg.jpg);">
                    <!-- Login thumb caption -->
                    <div class="login_thumb_caption">
                        <h3>Register is so Easy!</h3>
                        <p>Register &amp; start learning.</p>
                    </div>
                </div>
            </div>
            <!-- Register form area start  -->
            <!-- Register form area start  -->
            <div class="col-12 col-lg-7 col-xl-6">
                <div class="register_form">
                    <table>
                        <tr>
                            <td> ${message}</td>
                        </tr>
                        <tr>
                            <td> Lesson name-${oneLesson.name}</td>
                        </tr>
                        <tr>
                            <td> Lesson price-${oneLesson.price}</td>
                        </tr>
                        <tr>
                            <td> Lecturer Name-${oneLesson.lecturer}</td>
                        </tr>
                        <tr>
                            <td> users Names-
                                <c:forEach items="${oneLesson.users}" var="user">

                                    ${user.name}
                                    </c:forEach></td>
                        </tr>

                    </table>
                    <spring:form action="/add" method="post" modelAttribute="add" enctype="multipart/form-data">
                        <!-- Single Register input area start -->
                        <div class="form-group">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            STUDENT NAME: ${current.name}
                            <%--<spring:hidden path="name" name="name" id="user_name"--%>
                                           <%--value="${current.name}"></spring:hidden>--%>
                        <%--</div>--%>
                        <%--<!-- Single Register input area start -->--%>
                        <%--<div class="form-group">--%>
                            <%--<i class="fa fa-envelope-o" aria-hidden="true"></i>--%>
                            <%--SURNAME:${current.surname}--%>
                            <%--<spring:hidden path="surname" name="surname" id="user_surname"--%>
                                           <%--value="${current.surname}"></spring:hidden>--%>
                        <%--</div>--%>
                        <%--<!-- Single Register input area start -->--%>
                        <%--<div class="form-group">--%>
                            <%--<i class="fa fa-lock" aria-hidden="true"></i>--%>
                            <%--EMAIL:${current.email}--%>
                            <%--<spring:hidden path="email" name="email" id="email"--%>
                                           <%--value="${current.email}"></spring:hidden>--%>
                        <%--</div>--%>
                        <%--<!-- Single Register input area start -->--%>
                        <%--<div class="form-group">--%>
                            <%--<i class="fa fa-lock" aria-hidden="true"></i>--%>
                            <%--INPUT NEW PASSWORD--%>
                            <%--<spring:input path="password" type="password" name="password" id="pass_b"--%>
                                          <%--placeholder="Confirm Password"></spring:input>--%>
                            <input type="hidden"  name="lessonId" value="${oneLesson.id}" ><br>
                            <input type="hidden"  name="userId" value="${currentUser.id}" ><br>

                        <%--</div>--%>
                        <%--<!-- Single Register input area start -->--%>
                        <div class="form-group">

                            <%--<spring:hidden path="picUrl"  value="${current.picUrl}" id="image" name="image"/><br>--%>
                            <button type="submit" class="btn btn-default" id="login_submit">join</button>
                        </div>
                    </spring:form>
                    <div class="already_have_account">
                        <a href="/loginPage"><i class="fa fa-user-plus" aria-hidden="true"></i> Already have a
                            account?Login</a>
                    </div>
                </div>
            </div>
            <!-- Register form area end  -->
        </div>
    </div>
</div>
<!-- Login area end -->

<!-- ===================== Footer Area Start ===================== -->
<footer class="footer_area">
    <div class="container">
        <div class="section_padding_100_70">
            <div class="row">
                <!-- Footer About Area Start -->
                <div class="col-12 col-md-6 col-lg">
                    <div class="footer_about_us footer-single-part">
                        <div class="title">
                            <h4>About EduCamp</h4>
                            <!-- Useful Links Title -->
                            <div class="underline"></div>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam nostrum, illum quod facilis
                            minima natus adipisci, fugit provident! Totam ipsam, ullam aut. Autem, corporis,
                            tenetur.</p>
                        <div class="footer_social_links">
                            <a href="/register"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="/register"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="/register"><i class="fa fa-skype" aria-hidden="true"></i></a>
                            <a href="/register"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="/register"><i class="fa fa-youtube" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
                <!-- Footer About Area End -->

                <!-- Contact info Area Start -->
                <div class="col-12 col-md-6 col-lg">
                    <div class="footer_contact_info footer-single-part">
                        <div class="title">
                            <h4>get in touch</h4>
                            <!-- Useful Links Title -->
                            <div class="underline"></div>
                        </div>
                        <!-- single contact info start -->
                        <div class="footer_single_contact_info">
                            <i class="fa fa-thumb-tack" aria-hidden="true"></i>
                            <p>House - 87, Mirpur DOHS, Dhaka, Bangladesh</p>
                        </div>
                        <!-- single contact info start -->
                        <div class="footer_single_contact_info">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <a href="tel:+8801791166123">+88 698 257 14520</a>
                            <a href="tel:+8801791166123">+88 698 257 14521</a>
                        </div>
                        <!-- single contact info start -->
                        <div class="footer_single_contact_info">
                            <i class="fa fa-envelope-o" aria-hidden="true"></i>
                            <a href="mailto:info@educamp.com">info@educamp.com</a>
                            <a href="mailto:care@educamp.com">care@educamp.com</a>
                        </div>
                    </div>
                </div>
                <!-- Contact info Area End -->

                <!-- Useful Links Area Start -->
                <div class="col-12 col-md-6 col-lg">
                    <div class="important_links footer-single-part">
                        <div class="title">
                            <h4>useful links</h4>
                            <div class="underline"></div>
                        </div>
                        <!-- Links Start -->
                        <div class="links">
                            <a href="/lessonView"><i class="fa fa-angle-right" aria-hidden="true"></i> All Our
                                Courses</a>
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Event Calendar</a>
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Customer
                                Support</a>
                            <a href="/studentsView"><i class="fa fa-angle-right" aria-hidden="true"></i> Career at
                                EduCamp</a>
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Terms &amp;
                                Conditions</a>
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Community
                                Forums</a>
                        </div>
                    </div>
                </div>

                <!-- Useful Links Area Start -->
                <div class="col-12 col-md-6 col-lg">
                    <div class="important_links footer-single-part">
                        <div class="title">
                            <h4>Subscribe Newsletter</h4>
                            <div class="underline"></div>
                        </div>
                        <div class="newsletter_from">
                            <form action="/lessonView">
                                <div class="form-group">
                                    <input type="email" class="form-control" id="newsletter-email"
                                           placeholder="Enter Your E-mail" required>
                                </div>
                                <button type="submit" class="btn blog-btn w-100">Submit <i
                                        class="fa fa-paper-plane"></i></button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bottom Footer Area Start -->
    <div class="footer_bottom_area">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="footer_bottom">
                        <p>Made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="/studentsView">Designing
                            World</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- ===================== Footer Area End ===================== -->

<!-- ===================== All jQuery Plugins ===================== -->

<!-- jQuery (necessary for all JavaScript plugins) -->
<script src="js/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="js/plugins.js"></script>
<!-- Active js -->
<script src="js/custom.js"></script>

</body>

</html>
