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
                            <a href="/loginPage"><i class="fa fa-lock" aria-hidden="true"></i> Login</a>
                        </div>
                        <!-- Language Area Start -->

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
                                    <c:if test="${currentUser!=null && currentUser.type=='MANAGER'}">
                                        <h2>hello ${currentUser.name},${currentUser.type}</h2>
                                        <li><a href="/register">add student</a></li>
                                        <li><a href="/lesson">add lesson</a></li>
                                        <li><a href="/lessonView">view lesson</a></li>
                                        <li><a href="/studentsView">view student</a></li>
                                        <li><a href="/logout">log out</a></li>
                                    </c:if>
                                    <c:if test="${currentUser!=null && currentUser.type=='USER'}">
                                        <h2>hello ${currentUser.name},${currentUser.type}</h2>
                                        <li><a href="/lessonView">view lesson</a></li>
                                        <li><a href="/studentsView">view student</a></li>
                                        <li><a href="/logout">log out</a></li>
                                    </c:if>
                                    <c:if test="${currentUser==null}">
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


<!-- ===================== Search Courses Area Start ===================== -->
<br>
<br>
<br>
<br>
<br>
<br>
<div class="search_courses_area section_padding_100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="search_text">
                    <h2>Find your desire courses or events</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati soluta quaerat, sequi ut eius
                        enim.</p>
                </div>
                <div class="search_form">
                    <form action="/searchResult" method="get">
                        <div class="form-row">
                            <div class="form-group col-12 col-md-7">
                                <input type="text" name="search" class="form-control keyword"
                                       placeholder="Type your keywords">
                            </div>

                            <div class="form-group col-12 col-md-2">
                                <button type="submit" class="btn submit-btn btn-primary w-100">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ===================== Search Courses Area End ===================== -->
<!-- ===================== All Collection Area Start ===================== -->
<section class="all_collection_area section_padding_100_70">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Section Heading Area Start -->
                <div class="section_heading">
                    <h2>All Course Collection</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis amet mollitia voluptatibus
                        dolor officiis ad.</p>
                </div>
            </div>
        </div>
    </div>
    <c:forEach items="${lessons}" var="lesson">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="single_course_collection" style="background-image: url(img/bg-pattern/all-c-1.jpg);">
                        <a><h4>${lesson.name}</h4>
                            <p>${lesson.users.size()}&nbsp; students</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</section>
<!-- ===================== All Collection Area End ===================== -->

<!-- ===================== Blog Area Start ===================== -->
<section class="blog_area section_padding_100_70">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Section Heading Area Start -->
                <div class="section_heading">
                    <h2>Our Students</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis amet mollitia voluptatibus
                        dolor officiis ad.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${users}" var="user">
            <c:if test="${user.type!='MANAGER'}">
            <!-- single latest news area start -->
            <div class="col-lg-4 col-12 col-md-6">
                <div class="single_latest_news_area">
                    <!-- single latest news thumb -->
                    <div class="single_latest_news_img_area">
                        <img src="/student/image?fileName=${user.picUrl}" width="200" alt="">
                        <!-- single latest news published date -->
                        <div class="published_date">
                            <p class="date">${user.name}</p>
                            <p class="month">${user.surname}</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
    </c:forEach>
</section>
<!-- ===================== Blog Area End ===================== -->


<!-- ===================== Download App Area End ===================== -->

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
                            <a href="/"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="/"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="/"><i class="fa fa-skype" aria-hidden="true"></i></a>
                            <a href="/"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="/"><i class="fa fa-youtube" aria-hidden="true"></i></a>
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
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Event
                                Calendar</a>
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Customer Support</a>
                            <a href="/studentsView"><i class="fa fa-angle-right" aria-hidden="true"></i> Career at
                                EduCamp</a>
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Terms &amp;
                                Conditions</a>
                            <a href="/"><i class="fa fa-angle-right" aria-hidden="true"></i> Community Forums</a>
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
                            <form action="/searchResult" method="get">
                                <div >
                                    <input type="text" name="lessonSearch" class="form-control" id="email"
                                           placeholder="search lesson" required>
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
                        <p>Made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="/">Designing
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