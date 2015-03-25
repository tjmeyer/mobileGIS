<%-- 
    Document   : newAccount
    Created on : Mar 24, 2015, 2:36:12 AM
    Author     : M
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Account</title>
    </head>
    <body>
        <h1>Welcome to GIS</h1>
        <div style="color:red;" id="errorMessages">${message}</div>
        <form action="CreateAccount" method="POST">
            First Name: <input type="text" name="firstName" value="${firstName}"/><br/>
            Last Name:  <input type="text" name="lastName" value="${lastName}"/><br/>
            Email: <input type="text" name="email" value="${email}"/><br/>
            Password: <input type="password" name="password"/><br/>
            Confirm Password: <input type="password" name="cPassword"/><br/>
            <input type="submit" value="Create Account"/>
        </form>
    </body>
</html>
