<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/main.css"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <title>New Account</title>
    </head>
    <body>
        <div class="container">
            <h1>Welcome to GIS</h1>
            <div style="color:red;" id="errorMessages" class="row">
                <div class="col-sm-12">
                    ${message}
                </div>
            </div>
            <div class="row module">
                <form action="CreateAccount" method="POST">
                    <div class="col-sm-6">
                        <label>First Name</label>
                        <input type="text" class="form-control" name="firstName" value="${firstName}"/><br/>
                        <label>Email</label>
                        <input type="text" class="form-control" name="email" value="${email}"/><br/>
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" value="${password}"/><br/>
                    </div>
                    <div class="col-sm-6">
                        <label>Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="${lastName}"/><br/>
                        <label>Username</label>
                        <input type="text" class="form-control" name="username" value="${username}"/><br/>
                        <label>Confirm Password</label>
                        <input type="password" class="form-control" name="cPassword" value="${pPassword}"/><br/>
                    </div>
                    <div style="text-align: center;">
                        <input type="submit" class="btn btn-lg btn-primary" value="Create Account"/>
                        <a href="login.jsp" class="btn btn-lg btn-primary">Have an Account?</a>
                    </div>
                </form>
            </div>
            <div class="row module" style="text-align: center;">
                <h4>Current Mobile App Repository</h4> <br/>
                <a href="https://drive.google.com/folderview?id=0B8mijubDqJ54fllocm9QZVp0d2ZjQi1yVl94YnVra29fWnRFNkEyU2c3UjNnMmpoMHlyOE0&usp=sharing" target="_blank">
                    <span class="glyphicon glyphicon-floppy-save icon"></span>
                </a>
            </div>
        </div>
    </body>
</html>
