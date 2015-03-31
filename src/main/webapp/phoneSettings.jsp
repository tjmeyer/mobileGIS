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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <c:set var="phone" scope="page" value="${user.getPhone(phoneId)}"/>
        <title>${phone.name}'s  Settings</title>
    </head>
    <body>
        <div class="container"> 
            <h1>${phone.name}
                <c:if test="${phone.connection}">
                    <span class="glyphicon glyphicon-ok" style="color:green;"></span>
                </c:if>
                <c:if test="${!phone.connection}">
                    <span class="glyphicon glyphicon-remove" style="color:red;"></span>
                </c:if>
            </h1>
            <hr/>
            <form action="UpdatePhone" method="POST">
                <div class="row">
                    <div class="col-sm-5 module">
                        <label>Phone Owner</label>
                        <select class="form-control">
                            <c:forEach var="phoneUser" items="${account.users}">
                                <option value="${phoneUser.username}" <c:if test="${phoneUser.id == user.id}">selected</c:if>>${phoneUser.firstName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-1"><!--SPACER--></div>
                    <div class="col-sm-6 module">
                        <label>Phone Name</label>
                        <input type="text" class="form-control" name="phoneName" value="${phone.name}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12" style="text-align: center;">
                        <input type="submit" value="Save Changes" class="btn btn-lg btn-primary"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-12" style="text-align: center;">
                        <a href="DeletePhone?id=${phone.id}" onclick="return confirm('Are you sure you want to delete this phone?')" class="btn btn-lg btn-danger">Delete Phone</a>
                    </div>
                </div>
            </form>
            
            
            
            
            <div class="row sticky">
                <div class="btn-group btn-group-justified" role="group"> <!-- Bottom Nav-->
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="accountHome.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Return to Summary</a>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="Logout">Logout <span class="glyphicon glyphicon-log-out"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
