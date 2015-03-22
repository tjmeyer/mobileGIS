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
        <title>JSP Page</title>
    </head>
    <body>
        ${sessionScope['account']}
        <h1>Account: ${account.id}</h1>
        <hr/>
        <h2></h2>
        <c:forEach var="user" items="${account.users}">
            <p>${user.firstName}</p>
            <ul>
                <c:forEach var="phone" items="${user.phones}">
                    <li>${phone.name}</li>
                </c:forEach>
            </ul>
        </c:forEach>
        
    </body>
</html>
