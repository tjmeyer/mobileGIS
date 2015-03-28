<%-- 
    Document   : phoneSettings
    Created on : Mar 26, 2015, 4:13:09 AM
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
        <title>${phone.name}'s  Settings</title>
    </head>
    <body>
        <c:set var="phone" scope="page" value="${user.getPhone(phoneId)}"/>
        <h1>${phone.name}</h1>
        <hr/>
        <div class="btn-group btn-group-justified" role="group"> <!-- Bottom Nav-->
            <div class="btn-group" role="group">
                <a class="btn btn-primary btn-lg" href="accountHome.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Return to Summary</a>
            </div>
            <div class="btn-group" role="group">
                <a class="btn btn-primary btn-lg" href="Logout">Logout <span class="glyphicon glyphicon-log-out"></span></a>
            </div>
        </div>
    </body>
</html>
