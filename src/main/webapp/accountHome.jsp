<%-- 
    Document   : accountHome
    Created on : Mar 21, 2015, 4:43:41 PM
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
        <title>Account Home</title>
    </head>
    <body>
        <div class="container">
            <div class="row module">
                <h1>Welcome back ${user.firstName}!</h1>
            </div>
            <hr/>
            <div class="row">
                <div class="col-sm-5">
                    <h2 style="text-align: center; color: white;">Users</h2>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-6">
                    <h2 style="text-align: center; color: white;">Phones</h2>
                </div>
            </div>
            <c:forEach var="user" items="${account.users}">
                <div class="row">
                    <div class="col-sm-5 module">
                        <h2 style="text-align:center;"><a <c:if test="${user.isMaster()}">href="userDetails.jsp?id=${user.id}"</c:if>>${user.firstName} (${user.username})</a></h2>
                    </div>
                    <div class="col-sm-1"></div> <!--spacer-->
                    <div class="col-sm-6">
                        <c:forEach var="phone" items="${user.phones}">
                            <div class="module">
                                <h3 style="text-align:center;"><a href="PhoneDetails?phone=${phone.id}">${phone.name}</a></h3>
                                <hr/>
                                <c:if test="${phone.recentLocation.time != null}">
                                    <p style="text-align:center;">Latitude: ${phone.recentLocation.lat}</p>
                                    <p style="text-align:center;">Longitude: ${phone.recentLocation.lon}</p>
                                    <p style="text-align:center;">Time: ${phone.recentLocation.time}</p>
                                </c:if>
                                <c:if test="${phone.recentLocation.time == null}">
                                    <p style="text-align:center;">Location not Available</p>
                                </c:if>  
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
            <hr/>
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <a class="btn btn-primary btn-lg" href="Logout">Logout <span class="glyphicon glyphicon-log-out"></span></a>
                </div>
                <c:if test="${user.isMaster()}">
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="accountSettings.jsp">Settings <span class="glyphicon glyphicon-cog"></span></a>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="addUser.jsp">Add User</a>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>
