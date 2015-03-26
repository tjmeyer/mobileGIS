<%-- 
    Document   : userDetails
    Created on : Mar 26, 2015, 3:13:50 PM
    Author     : M
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <c:set var="userSettings" value="${account.getUser(pageUser)}"/>
        <title>${userSettings.firstName}'s Settings Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6 module">
                    <h1>${userSettings.firstName}'s Settings</h1>
                </div>
                <div class="col-sm-3"></div>
            </div>
            <hr/>
            <div class="row module">
                <form action="" method="POST">
                    <div class="col-sm-5">
                        <label>First Name</label>
                        <input class="form-control input-group-lg" type="text" value="${userSettings.firstName}"/>
                        <label>Email</label>
                        <input class="form-control input-group-lg" tpye="text" value="${userSettings.email}"/>
                    </div>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-5">
                        <label>Last Name</label>
                        <input class="form-control input-group-lg" type="text" value="${userSettings.lastName}"/>
                        <label>Username</label>
                        <input class="form-control input-group-lg" type="text" value="${userSettings.username}"/>
                    </div>
                    <div class="row" style="text-align: center;">
                        <input class="btn btn-primary btn-lg" type="submit" value="Save"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
