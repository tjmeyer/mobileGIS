<%-- 
    Document   : accountHome
    Created on : Mar 21, 2015, 4:43:41 PM
    Author     : M
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Account Home</title>
    </head>
    <body>
        <div class="container">            
                <h1>Welcome back ${user.firstName}!</h1>
            <hr/>
            <!-- Start test-->
            <!-- for each user -->
            <c:forEach var="user" items="${account.users}">
                <div class="row">
                    <h2>${user.firstName}'s Devices</h2>
                </div>
                <!--for each phone-->
                <c:forEach var="phone" items="${user.phones}">
                    <div class="row module">
                    <div class="col-sm-4">
                        <h2 style="text-align: center;">${phone.name}</h2>
                            <div class="row" id="phoneMenu" style="text-align: center;"> <!--Phone menu bar start-->
                                <c:if test="${phone.connection}">
                                    <span class="glyphicon glyphicon-ok icon" style="color: green;" title="Device Connected"> </span> 
                                </c:if>
                                <c:if test="${!phone.connection}">
                                    <span class="glyphicon glyphicon-remove icon" style="color: red;" title="Device Disconnected"> </span> 
                                </c:if>
                                    <a href="PhoneSettings?phone=${phone.id}" class="glyphicon glyphicon-cog icon" style="text-decoration: none;" title="Device Settings"> </a>
                                    <a href="PhoneHistory?phone=${phone.id}" class="glyphicon glyphicon-calendar icon" style="text-decoration: none;" title="Device History"></a>
                            </div>
                        <hr/>
                        <p>UUID: ${phone.mac}</p>
                        <c:if test="${phone.recentLocation.time != null}">
                            <p>Latitude: ${phone.recentLocation.lat}</p>
                            <p>Longitude: ${phone.recentLocation.lon}</p>
                            <c:if test="${phone.recentLocation.alt != 0}">
                                <p>Altitude: ${phone.recentLocation.alt}</p>
                            </c:if>
                        </c:if>
                    </div>
                    <div class="col-sm-8">
                        <c:if test="${phone.recentLocation.time != null}">
                            <h3 style="text-align: center;"><fmt:formatDate value="${phone.recentLocation.time}" timeZone="MDT" type="both" timeStyle="long"/></h3>
                            <iframe width="100%" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=${phone.recentLocation.lat},${phone.recentLocation.lon}&key=AIzaSyB-NY8Tr6mZJB9Wr_c2qlBptlAYF3vzx8o"></iframe>
                        </c:if>
                        <c:if test="${phone.recentLocation.time == null}">
                            <h3 style="text-align: center;">Location Unavailable</h3>
                        </c:if>
                    </div>
                </div> 
                </c:forEach>
                
            </c:forEach>
            
            <!-- end test-->
            <hr/>
            <br/>
            <!-- Bottom nav bar -->
            <div class="row sticky">
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
        </div>
    </body>
</html>
