<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
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

    <!-- Style css -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Responsive css -->
    <link rel="stylesheet" href="css/responsive.css">

</head>

<body>

<!-- Register form area start  -->
<div class="col-12 col-lg-7 col-xl-6">
    <div class="register_form">
        <spring:form action="/addLesson" method="post" modelAttribute="lesson" >
            <!-- Single Register input area start  -->
            <div class="form-group">
                <i class="fa fa-user" aria-hidden="true"></i>
                <spring:input path="name" type="text" name="name" id="user_name" placeholder="Name"></spring:input>
            </div>
            <!-- Single Register input area start  -->
            <div class="form-group">
                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                <spring:input path="price" type="text" name="surname" id="user_surname" placeholder="price"></spring:input>
            </div>
            <!-- Single Register input area start  -->
            <div class="form-group">
                <i class="fa fa-lock" aria-hidden="true"></i>
                <spring:input path="lecturer" type="text" name="email" id="email" placeholder="lucturer Name"></spring:input>
            </div>
            <!-- Single Register input area start  -->

            <button type="submit" class="btn btn-default" id="login_submit">Sign Up</button>
        </spring:form>
        <div class="already_have_account">
            <a href="/loginPage"><i class="fa fa-user-plus" aria-hidden="true"></i> Already have a account? Login</a>
        </div>
    </div>
</div>
<!-- Register form area end  -->
</div>
</div>
</div>
<!-- Login area end -->

<!-- ===================== Footer Area Start ===================== -->

</body>

</html>