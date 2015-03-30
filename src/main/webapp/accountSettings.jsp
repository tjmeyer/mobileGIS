<%-- 
    Document   : accountSettings
    Created on : Mar 30, 2015, 10:55:22 AM
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
        <title>Account Settings</title>
    </head>
    <body>
        <div class="container">
            <h1>${user.firstName}'s Account Settings</h1>
            <hr/>
            
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
