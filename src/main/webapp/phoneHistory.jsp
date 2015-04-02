<%-- 
    Document   : phoneHistory
    Created on : Mar 28, 2015, 12:04:43 AM
    Author     : M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <title>History</title>
    </head>
    <body>
        <div class="container">
            <h1>${phone.name}'s History</h1>
            <hr/>
            <div class="row">
                <div class="col-sm-5 module">
                    <div class="row">
                        <div class="col-sm-12">
                            <label>Start Time:</label>
                            <input class="form-control" type="datetime" name="startTime"/>
                            <label>End Time:</label>
                            <input class="form-control" type="datetime" name="endTime"/>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-6">
                    ${map}
                </div>
            </div>
            
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
