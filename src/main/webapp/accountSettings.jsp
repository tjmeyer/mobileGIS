<%-- 
    Document   : accountSettings
    Created on : Mar 30, 2015, 10:55:22 AM
    Author     : M
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Account Settings</title>
    </head>
    <body>
        <div class="container">
            <h1>${user.firstName}'s Account Settings</h1>
            <hr/>
            <div class="row">
                <div class="col-sm-5 module">
                    <h2>Users On Account</h2>
                    <hr/>
                    <c:forEach var="accountUser" items="${account.users}">
                        <div class="row">
                            <div class="col-sm-6" style="text-align: center;">
                                <h3>${accountUser.firstName} ${accountUser.lastName}</h3>
                            </div>
                            <div style="text-align: center;" class="col-sm-6">
                                <h3><a href="DeleteUser?user=${accountUser.username}" class="btn btn-md btn-danger" onclick="return confirm('Are you sure you want to delete ${accountUser.firstName}?\nAll of this user\'s phones will also be deleted.');"><span class="glyphicon glyphicon-remove"></span> Remove</a></h3>
                            </div>
                        </div>
                        <br/>
                    </c:forEach>
                </div>
                <div class="col-sm-1"><!--Spacer--></div>
                <div class="col-sm-6 module">
                    test
                </div>
            </div>
            
            <!-- Bottom nav bar -->
            <div class="row sticky">
                <div class="btn-group btn-group-justified" role="group">
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="accountHome.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Account Summary</a>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="Logout">Logout <span class="glyphicon glyphicon-log-out"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
