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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Account: ${account.id}</h1>
        <hr/>
        <h2></h2>
        <c:forEach var="user" items="${account.users}">
            <p>${user.firstName}</p>
            <ul>
                <c:forEach var="phone" items="${user.phones}">
                    <li><a href="PhoneDetails?phone=${phone.id}">${phone.name}</a>
                        <ul>
                        <c:forEach var="location" items="${phone.locations}">
                            <li>Latitude: ${location.lat}</li>
                            <li>Longitude: ${location.lon}</li>
                            <li>Altitude: ${location.alt}</li>
                            <li><strong>Last Update: ${location.time}</strong></li>
                        </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </c:forEach>
        <hr/>
        <c:if test="${user.isMaster()}">
            <a href="addUser.jsp">Add User to Account</a><br/>
        </c:if>
        <a class="btn" href="Logout">Logout</a>
        <hr/>
        <c:if test="${!empty user.class.declaredFields}">
            <h2>Object Attributes <em>&dollar;{user.name}</em></h2>
            <ul>
                <c:forEach var="attr" items="${user.class.declaredFields}">
                    <c:catch><li><span>${attr.name}: </span>${user[attr.name]}</li></c:catch>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${!empty user.class.declaredMethods}">
            <h2>Object Methods<em>&lt;% user.getName() %&gt;</em></h2>
            <ul>
                <c:forEach var="attr" items="${user.class.declaredMethods}">
                    <c:catch><li>${attr.name}</li></c:catch>
                </c:forEach>
            </ul>
        </c:if>
    </body>
</html>
