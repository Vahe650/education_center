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
                            <a href="login.html"><i class="fa fa-lock" aria-hidden="true"></i> Login/Register</a>
                        </div>
                        <!-- Language Area Start -->
                        <div class="language_area">
                            <div class="dropdown">
                                <button aria-expanded="false" aria-haspopup="true" data-toggle="dropdown" id="lag" type="button" class="btn btn-default dropdown-toggle"><i class="fa fa-globe" aria-hidden="true"></i> Language</button>
                                <ul aria-labelledby="lag" class="dropdown-menu">
                                    <li><a href="teachers-details.html#">English</a></li>
                                    <li><a href="teachers-details.html#">हिन्दी</a></li>
                                    <li><a href="teachers-details.html#">বাংলা</a></li>
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
                                        <c:if test="${currentUser!=null && currentUser.type=='MANAGER'}">
                                            <h2>hello ${currentUser.name},${currentUser.type}</h2>
                                            <li><a href="/">home</a></li>
                                            <li><a href="/register">add student</a></li>
                                            <li><a href="/lesson">add lesson</a></li>
                                            <li><a href="/lessonView">view lesson</a></li>
                                            <li><a href="/studentsView">view student</a></li>
                                            <li><a href="/logout">log out</a></li>
                                        </c:if>
                                        <c:if test="${currentUser!=null && currentUser.type=='USER'}">
                                            <h2>hello ${currentUser.name},${currentUser.type}</h2>
                                            <li><a href="/">home</a></li>
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

<!-- ===================== Breadcumb area start ===================== -->
<section class="breadcumb_area" style="background-image: url(img/bg-pattern/breadcumb.jpg);">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="breadcumb_section">
                    <!-- Breadcumb page title start -->
                    <div class="page_title">
                        <h3>Teacher</h3>
                    </div>
                    <!-- Breadcumb page pagination start -->
                    <div class="page_pagination">
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                            <li>Teacher Details</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ===================== Breadcumb area end ===================== -->

<!-- ================= All Our Teacher Area Start =============== -->

<section class="all_our_teacher_area section_padding_100">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-12">
                <!-- Teacher Full Image Start -->
                <div class="teacher_full_image">
                    <img src="/student/image?fileName=${one.picUrl}" alt="">
                </div>
            </div>
            <div class="col-md-6 col-12">
                <!-- Teacher Details Info Area Start -->
                <div class="teacher_details_info">

                    <!-- Teacher Name Designation Start -->
                    <div class="name_designation">
                        <h2>${one.name} &nbsp;${one.surname}</h2>
                        <h5>junior</h5>
                        <c:forEach items="${one.lessons}" var="only">
                            <h5>active lesson &nbsp;${only.name}</h5>
                        </c:forEach>
                        <c:if test="${one.id==currentUser.id}">
                            <span></span>
                            <a href="/studentParam?id=${currentUser.id}"><button>CHANGE YOUR PROFILE</button></a>
                        </c:if>
                    </div>
                    <!-- About Teacher Start -->
                    <div class="about_teacher">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur eos, vero ad velit nobis rerum saepe, doloremque illo maiores aliquid perferendis necessitatibus quidem est veritatis nihil ratione eius nam sapiente.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur eos, vero ad velit nobis rerum saepe, doloremque illo maiores aliquid perferendis necessitatibus quidem est veritatis nihil ratione eius nam sapiente.</p>
                    </div>
                    <!-- Teacher Contact Info Start -->
                    <div class="teacher_contact_info">
                        <!-- Single Contact Info Start -->
                        <div class="tea_single_contact_info">
                            <div class="contact_icon">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                            </div>
                            <div class="contact_data">
                                <p>Road No - 9, Dhaka, BD</p>
                            </div>
                        </div>
                        <!-- Single Contact Info Start -->
                        <div class="tea_single_contact_info">
                            <div class="contact_icon">
                                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                            </div>
                            <div class="contact_data">
                                <p>${one.email}</p>
                            </div>
                        </div>
                        <!-- Single Contact Info Start -->
                        <div class="tea_single_contact_info">
                            <div class="contact_icon">
                                <i class="fa fa-mobile" aria-hidden="true"></i>
                            </div>
                            <div class="contact_data">
                                <p>+880 179 11 66 123</p>
                            </div>
                        </div>
                        <!-- Single Contact Info Start -->
                        <div class="tea_single_contact_info">
                            <div class="contact_icon">
                                <i class="fa fa-globe" aria-hidden="true"></i>
                            </div>
                            <div class="contact_data">
                                <p>www.designing-world.com</p>
                            </div>
                        </div>
                        <!-- Single Contact Info Start -->
                        <div class="tea_single_contact_info">
                            <div class="contact_icon">
                                <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                            </div>
                            <div class="contact_data">
                                <p>B. Sc in Science (2009)</p>
                            </div>
                        </div>
                        <!-- Single Contact Info Start -->
                        <div class="tea_single_contact_info">
                            <div class="contact_icon social">
                                <a href="teachers-details.html#"><i class="fa fa-facebook-official" aria-hidden="true"></i></a>
                            </div>
                            <div class="contact_icon social">
                                <a href="teachers-details.html#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            </div>
                            <div class="contact_icon social">
                                <a href="teachers-details.html#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                            </div>
                            <div class="contact_icon social">
                                <a href="teachers-details.html#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            </div>
                            <div class="contact_icon social">
                                <a href="teachers-details.html#"><i class="fa fa-youtube" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- Teacher Contact Info End -->
                </div>
                <!-- Teacher Details Info Area End -->
            </div>
        </div>
    </div>
</section>
<!-- ===================== All Our Teacher Area End ==================== -->

<!-- ===================== Cool Facts Area Start ===================== -->
<section class="about_cool_facts cool_facts_area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-3">
                <!-- Single Cool Facts area Start -->
                <div class="cool_fact_text">
                    <i class="fa fa-book" aria-hidden="true"></i>
                    <h3><span class="counter">763</span></h3>
                    <h4>Free Courses</h4>
                </div>
            </div>

            <div class="col-12 col-md-3">
                <!-- Single Cool Facts area Start -->
                <div class="cool_fact_text">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <h3><span class="counter">10</span>k+</h3>
                    <h4>Students Enrolled</h4>
                </div>
            </div>

            <div class="col-12 col-md-3">
                <!-- Single Cool Facts area Start -->
                <div class="cool_fact_text">
                    <i class="fa fa-check-square-o" aria-hidden="true"></i>
                    <h3><span class="counter">251</span></h3>
                    <h4>Certified Teachers</h4>
                </div>
            </div>

            <div class="col-12 col-md-3">
                <!-- Single Cool Facts area Start -->
                <div class="cool_fact_text">
                    <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                    <h3><span class="counter">7412</span></h3>
                    <h4>Complate Graduates</h4>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- ===================== Why Chooses Area End ===================== -->

<!-- ===================== Our Teacher Area Start ===================== -->
<section class="our_teachers_area section_padding_100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Section Heading Area Start -->
                <c:forEach items="${all}" var="users">
                <div class="section_heading">
                    <h2>Our Other Students</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis amet mollitia voluptatibus dolor officiis ad.</p>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-12 col-md-3">
                <div class="single_teacher_profile">
                    <div class="teacher_thumb">
                        <img src="/student/image?fileName=${users.picUrl}" alt="">
                    </div>
                    <div class="single_teacher_details_info">
                        <h5>${users.name}</h5>
                        <p>${users.type}</p>
                        <div class="teacher_social_info">
                            <div class="social_icon">
                                <a href="teachers-details.html#"><i class="fa fa-facebook"></i></a>
                                <a href="teachers-details.html#"><i class="fa fa-twitter"></i></a>
                                <a href="teachers-details.html#"><i class="fa fa-skype"></i></a>
                                <a href="teachers-details.html#"><i class="fa fa-dribbble"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div></c:forEach>
        </div>
    </div>
</section>
<!-- ===================== Our Teacher Area End ===================== -->

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
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam nostrum, illum quod facilis minima natus adipisci, fugit provident! Totam ipsam, ullam aut. Autem, corporis, tenetur.</p>
                        <div class="footer_social_links">
                            <a href="teachers-details.html#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="teachers-details.html#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="teachers-details.html#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                            <a href="teachers-details.html#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="teachers-details.html#"><i class="fa fa-youtube" aria-hidden="true"></i></a>
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
                            <a href="teachers-details.html#"><i class="fa fa-angle-right" aria-hidden="true"></i> All Our Courses</a>
                            <a href="teachers-details.html#"><i class="fa fa-angle-right" aria-hidden="true"></i> Event Calendar</a>
                            <a href="teachers-details.html#"><i class="fa fa-angle-right" aria-hidden="true"></i> Customer Support</a>
                            <a href="teachers-details.html#"><i class="fa fa-angle-right" aria-hidden="true"></i> Career at EduCamp</a>
                            <a href="teachers-details.html#"><i class="fa fa-angle-right" aria-hidden="true"></i> Terms &amp; Conditions</a>
                            <a href="teachers-details.html#"><i class="fa fa-angle-right" aria-hidden="true"></i> Community Forums</a>
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
                            <form action="teachers-details.html#">
                                <div class="form-group">
                                    <input type="email" class="form-control" id="email" placeholder="Enter Your E-mail" required>
                                </div>
                                <button type="submit" class="btn blog-btn w-100">Submit <i class="fa fa-paper-plane"></i></button>
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
                        <p>Made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="teachers-details.html#">Designing World</a></p>
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