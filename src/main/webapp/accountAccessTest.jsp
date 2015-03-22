<%-- 
    Document   : accountAccessTest
    Created on : Mar 21, 2015, 3:57:22 PM
    Author     : M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Enter Account number you wish to see.</h1>
        <br/>
        <form action="CreateSession" method="POST">
            <input type="text" name="account_id"/>
            <br/>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
