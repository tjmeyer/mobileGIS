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
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6 module">
                    <div class="logo">
                        <img src="https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/512/define_location.png" alt="..." width="50%" class="logo"/>
                    </div>
                    <div class="errorMessage">
                        <h3 class="blink">${message}</h3>
                    </div>
                </div>
                <div class="col-sm-3"></div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                </div>
                <div class="col-sm-6 module">
                    <form action="CreateSession" method="POST">
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon" id="basic-addon1">Username</span>
                            <input type="text" class="form-control" name="username" placeholder="Username" aria-describedby="basic-addon1"/>
                        </div>
                        <br/>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon" id="basica-addon2">Password</span>
                            <input type="password" class="form-control" name="password" placeholder="password" aria-describedby="basic-addon2"/>
                        </div>
                        <hr class=""/>
                        <p style="text-align: center;"><input class="btn btn-lg btn-primary" type="submit" value="Login"/></p>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3"></div>
                    <div class="col-sm-6 module" style="text-align: center;">
                        <a class="btn btn-lg btn-primary" href="newAccount.jsp">Create a New Account</a>
                    </div>
                <div class="col-sm-3"></div>
            </div>
        </div>
    </body>
</html>
