<%-- 
    Document   : login
    Created on : Mar 21, 2015, 6:25:12 PM
    Author     : M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Welcome to Mr. GIS!</h1>
        <div class="errorMessage">
            <p>${message}</p>
        </div>
        <div class="content module">
            <form action="CreateSession" method="POST">
                <input type="text" name="username" placeholder="Username"/>
                <br/>
                <input type="password" name="password" placeholder="Password"/>
                <p style="text-align: center;"><input type="submit" value="Login"/></p>
            </form>
        </div>
        <div class="content module">
            <a href="newAccount.jsp">Create a New Account</a>
        </div>
    </body>
</html>
