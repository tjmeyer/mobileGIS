<%-- 
    Document   : phoneHistory
    Created on : Mar 28, 2015, 12:04:43 AM
    Author     : M
--%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<span style='visibility: hidden;'>/* global google */</span>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <title>Phone History</title>
        <style>
      html, body, #map-canvas {
        height: 80%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCaG8QhUPgjjl3QtFlNYCeqiOccI-Xmudw"></script>
    <script>
    function initialize() {
        var mapOptions = {
          zoom: 3,
          center: new google.maps.LatLng(0, -180),
          mapTypeId: google.maps.MapTypeId.TERRAIN
        };

        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
        var flightPlanCoordinates = [
        <c:forEach var='location' items='${phone.locations}'>
            new google.maps.LatLng(${location.lat}, ${location.lon}),
        </c:forEach>
        ];
        var flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });

        flightPath.setMap(map);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    </head>
    <body>
        <div class="container">
            <h1>${phone.name}'s History</h1>
            <hr/>
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <div id="map-canvas"></div>
                </div>
            </div>
            <br/>
            <div class="row module" style="text-align:center;">
                <div class="col-xs-12 col-md-6">
                    <h3>Start Time</h3>
                    <input id="sDate" type=date step=1 min=2014-09-08 onchange="document.getElementById('eDate').min  = document.getElementById('sDate').value; document.getElementById('eDate').value = document.getElementById('sDate').value;"/>
                    <input id="sTime" type=time step=900/>
                </div>
                <div class="col-xs-12 col-md-6">
                    <h3>End Time</h3>
                    <input id="eDate" type=date step=1 min=2014-09-08 value="2015-04-20"/>
                    <input id="eTime" type=time step=900/>
                </div>
                <div class="row">
                    <button id="submitTime" onclick="" class="btn btn-lg btn-primary">Submit</button>
                </div>
            </div>
            <br/>
            <div class='row'>
                <div class='col-sm-12' style="text-align: center;">
                    <a href="DeleteHistory?phone=${phone.id}" class="btn btn-danger btn-lg">Delete History</a>
                </div>
            </div>
                <br/>
                <br/>
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
