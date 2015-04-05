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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <!--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>-->
        <!--<script src="js/maps.js"></script>-->
        <title>History</title>
            <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <script>
function initialize() {
  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
  var mapOptions = {
    zoom: 4,
    center: myLatlng
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Hello World!'
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    </head>
    <body>
        <div class="container">
            <h1>${phone.name}'s History</h1>
            <hr/>
            <div class="row">
                <div class="col-xs-12 col-md-5 module">
                    <div class="row">
                        <div class="col-xs-6">
                            <h3>Start Time</h3>
                            <hr/>
                            <div class="col-md-6">
                                <label>Day</label>
                                <input id="entry-day-time" name="entry-day-time" type="datetime">
                            </div>
                            <div class="col-md-6">
                                <label>Month</label>
                                <input class="form-control" maxlength="2" type="text"/>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <h3>End Time</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-xs-12 col-md-6">
                    <div id="map-canvas"></div>
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
