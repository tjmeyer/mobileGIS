<%-- 
    Document   : phoneDetails
    Created on : Mar 26, 2015, 4:13:09 AM
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
        <c:set var="phone" scope="page" value="${user.getPhone(phoneId)}"/> 
        <h1>${phone.name}</h1>
        <hr/>
        <a href="accountHome.jsp">Back to Home<a/>
    </body>
</html>
