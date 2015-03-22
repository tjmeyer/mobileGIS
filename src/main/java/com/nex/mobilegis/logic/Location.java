/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.logic;

import java.sql.Timestamp;


/**
 *
 * @author M
 */
public class Location{
    private int id;
    private double latitude;
    private double longitude;
    private double altitude;
    private Timestamp time;
    
    Location(int newID, double newLat, double newLon, double newAlt, Timestamp newTime)
    {
        this.id    = newID;
        this.latitude   = newLat;
        this.longitude  = newLon;
        this.altitude   = newAlt;
        this.time       = newTime;
    }

    public double getAlt() {
        return altitude;
    }

    public double getLon() {
        return longitude;
    }

    public double getLat() {
        return latitude;
    }

    public Timestamp getTime() {
        return time;
    }

    public int getId() {
        return id;
    }
    
    //mutators are not available because that should not be accessible
    //  from the web client!!
}
