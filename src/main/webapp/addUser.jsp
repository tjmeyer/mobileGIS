<%-- 
    Document   : addUser
    Created on : Mar 26, 2015, 4:04:45 AM
    Author     : M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Add User</title>
    </head>
    <body>
        <div class="container">
            <h1>Add User</h1>
            <hr/>
            <div style="color:red;" id="errorMessages" class="row">
                <div class="col-sm-12">
                    ${message}
                </div>
            </div>
            <div style="color:green; text-align: center;" id="successMessage" class="row">
                <div class="col-sm-12">
                    ${success}
                </div>
            </div>
            <div class="row module">
                <form action="CreateAccount" method="POST">
                    <div class="col-sm-6">
                        <label>First Name</label>
                        <input type="text" class="form-control" name="firstName" value="${firstName}" tabindex="1"/><br/>
                        <label>Email</label>
                        <input type="text" class="form-control" name="email" value="${email}" tabindex="3"/><br/>
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" value="${password}" tabindex="5"/><br/>
                    </div>
                    <div class="col-sm-6">
                        <label>Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="${lastName}" tabindex="2"/><br/>
                        <label>Username</label>
                        <input type="text" class="form-control" name="username" value="${username}" tabindex="4"/><br/>
                        <label>Confirm Password</label>
                        <input type="password" class="form-control" name="cPassword" value="${pPassword}" tabindex="6"/><br/>
                    </div>
                    <div style="text-align: center;">
                        <input type="submit" class="btn btn-lg btn-primary" value="Create User"/>
                    </div>
                </form>
            </div>
            <!-- Bottom nav bar -->
            <div class="row sticky">
                <div class="btn-group btn-group-justified" role="group">
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="accountHome.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Account Summary</a>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-primary btn-lg" href="Logout">Logout <span class="glyphicon glyphicon-log-out"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
