<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 15.03.2018
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>study</title>
</head>
<body>
 <spring:form action="/changeStudent" method="post" modelAttribute="changeStudent" enctype="multipart/form-data">
     <spring:hidden path="id" value="${one.id}"></spring:hidden><br>
     <span>name</span>
        <spring:input path="name" type="text" name="name" value="${one.name}" id="user_name" placeholder="Name"></spring:input><br>
     <span>surname:</span>
        <spring:input path="surname" type="text" value="${one.surname}" name="surname" id="user_surname" placeholder="surname"></spring:input><br>
     <span>old email:</span>
        <spring:input path="email" type="email" value="${one.email}" name="email" id="email" placeholder="Email"></spring:input><br>
     <span>change picture</span>
        <input type="file" id="image" name="image"/><br>
    <button type="submit" class="btn btn-default" id="login_submit">Sign Up</button>
</spring:form>
</body>
</html>
