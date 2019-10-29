<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 15.03.2018
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>change</title>
</head>
<body>

<spring:form action="/changeLesson" modelAttribute="change" method="post">
    <spring:hidden path="id" value="${one.id}"></spring:hidden><br>
    <span>old name:${one.name}</span>
    <spring:input path="name" value="${one.name}"></spring:input><br>
    <span>old price:${one.price}</span>
    <spring:input path="price" value="${one.price}"></spring:input><br>
    <span>old lecturer:${one.lecturer}</span>
    <spring:input path="lecturer" value="${one.lecturer}"></spring:input><br>
    <input type="submit" value="Save"/>


</spring:form>


</body>
</html>
