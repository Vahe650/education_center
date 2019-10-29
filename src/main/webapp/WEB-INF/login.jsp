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
    <link rel="shortcut icon" href="../img/core-img/favicon.ico">

    <!-- ===================== All CSS Files ===================== -->
    <!-- Style css -->
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

            <div class="col-12 col-lg-7 col-xl-6 item">
                <!-- login form start -->
                <div class="login_form">
                    <!-- sign in facebok -->
                    <div class="sign_in_facebook">
                        <a class="btn btn-default" href="login.jsp#" role="button"><i class="fa fa-facebook"></i>Sign in with Facebook</a>
                    </div>
                    <!-- sign in twitter -->
                    <div class="sign_in_twitter">
                        <a class="btn btn-default" href="login.jsp#" role="button"><i class="fa fa-twitter"></i>Sign in with Twitter</a>
                    </div>
                    <!-- sign in manual form -->
                    <div class="login_manual_form">
                        <p>or</p>
                        <form action="<c:url value="/loginPage"/> " method="post" name="loginForm">
                            <div class="form-group">
                                <i class="fa fa-user"></i>

                                <input type="email" name="j_email" id="user" placeholder="email">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-lock" aria-hidden="true"></i>


                                <input type="password" name="j_password" id="pass" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-default" id="login_submit">Sign in</button>
                        </form>
                        <!-- forget password -->
                        <div class="forget_pass">
                            <a href="/register"><i class="fa fa-user-plus" aria-hidden="true"></i>Didn't have a account? Register</a>
                        </div>
                    </div>
                </div>
                <!-- login form end -->
            </div>
        </div>
    </div>
</section>
<!-- ===================== login area end ===================== -->


</body>

</html>
