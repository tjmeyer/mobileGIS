<%-- 
    Document   : accountHome
    Created on : Mar 21, 2015, 4:43:41 PM
    Author     : M
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
            <c:forEach var="pageUser" items="${account.users}">
                <div class="row">
                    <h2>${pageUser.firstName}'s Devices</h2>
                </div>
                <!--for each phone-->
                <c:if test="${fn:length(pageUser.phones) == 0}">
                    <div class="row">
                        <div class="col-xs-12">
                            <h2>Download the App (Android only)</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-5" style="color:white;">
                            <h4>Don't want viruses eh?! Get if from the Google Play Store</h4>
                            <ul>
                                <li>Join the <a href="https://plus.google.com/u/0/communities/118189619378640743992" target="_blank">Google+ Community</a>.
                                    <ul>
                                        <li>You do have to "request" to join, but I will be approving anyone right from my phone when you sign up.</li>
                                    </ul></li>
                                <li>Opt into testing the alpha version of GIS</li>
                                <li>Share your experience on the community page for the devs to see! We <u>really</u> want your feedback!</li>
                            </ul>
                        </div>
                        <div class="col-xs-12 col-md-1">
                            <h2>OR</h2>
                        </div>
                        <div class="col-xs-12 col-md-6" style="color:white;">
                            <h4>Download the APK package from the development repository</h4>
                            <ul>
                                <li>Go to the <a href="https://drive.google.com/folderview?id=0B8mijubDqJ54fllocm9QZVp0d2ZjQi1yVl94YnVra29fWnRFNkEyU2c3UjNnMmpoMHlyOE0&usp=sharing" target="_blank">repository</a></li>
                                <li>Save the *.apk file to your device</li>
                                <li>Change your phone settings to allow installations from "unknown sources"</li>
                                <li>Don't forget to <a href='https://docs.google.com/forms/d/13eU5rWVpNpGSAzdpjD_Anf4I3CcE7pYC297DazEAVR4/viewform' target='_blank'>share your experience</a> with us! We want to hear from you!</li>
                            </ul>
                        </div>
                    </div>
                    <br/>
                </c:if>
                <c:if test="${fn:length(pageUser.phones) gt 0}">
                <c:forEach var="phone" items="${pageUser.phones}">
                    <div class="row module">
                    <div class="col-sm-4">
                        <h2 style="text-align: center;">${phone.name}</h2>
                            <div class="row" id="phoneMenu" style="text-align: center;"> <!--Phone menu bar start-->
                                <c:if test="${phone.connection}">
                                    <span class="glyphicon glyphicon-ok icon" style="color: green;" title="Device Connected"> </span> 
                                </c:if>
                                <c:if test="${!phone.connection}">
                                    <span class="glyphicon glyphicon-remove icon blink" style="color: red;" title="Device Disconnected"> </span> 
                                </c:if>
                                <c:if test="${user.isMaster() || pageUser.id == user.id}">
                                    <a href="PhoneSettings?phone=${phone.id}&user=${pageUser.username}&userid=${pageUser.id}" class="glyphicon glyphicon-cog icon" style="text-decoration: none;" title="Device Settings"> </a>
                                </c:if>
                                <a href="PhoneHistory?phone=${phone.id}&user=${pageUser.username}" class="glyphicon glyphicon-calendar icon" style="text-decoration: none;" title="Device History"></a>
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
                            <iframe width="100%" height="450" frameborder="1" style="border:2" src="https://www.google.com/maps/embed/v1/place?q=${phone.recentLocation.lat},${phone.recentLocation.lon}&key=AIzaSyB-NY8Tr6mZJB9Wr_c2qlBptlAYF3vzx8o"></iframe>
                        </c:if>
                        <c:if test="${phone.recentLocation.time == null}">
                            <h3 style="text-align: center;">Location Unavailable</h3>
                        </c:if>
                    </div>
                </div> 
                </c:forEach>
                </c:if>
            </c:forEach>
            <hr/>
            <!-- end test-->
            
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
