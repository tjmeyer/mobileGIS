/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.logic;

import com.nex.mobilegis.dataaccess.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author M
 */
public class Phone {
    private int id;
    private String mac;
    private String name;
    private Boolean connection;
    private List<Location> locations = new ArrayList<>();
    
    Phone(int newId, String newMac, String newName, Boolean newConnection) throws SQLException, ClassNotFoundException
    {
        this.id         = newId;
        this.mac        = newMac;
        this.name       = newName;
        DBManager db = DBManager.getInstance();
        String query = "SELECT * FROM location WHERE phone_id = " + newId;
        ResultSet rs = db.execute(query);
        while(rs.next())
        {
            //int newID, double newLat, double newLon, double newAlt, Timestamp newTime            
            int locationId  = rs.getInt("id");
            double lat      = rs.getDouble("latitude");
            double lon      = rs.getDouble("longitude");
            double alt      = rs.getDouble("altitude");
            Timestamp time  = rs.getTimestamp("time_stamp");
            Location newLocation = new Location(locationId, lat, lon, alt, time);
            locations.add(newLocation);
        }
        if(!locations.isEmpty())
        {
            this.connection = System.currentTimeMillis() <= (locations.get(locations.size()-1).getTime().getTime() + 1800000);
            Collections.sort(locations, new CustomComparator());
        }
    }
    
    public Boolean addLocation(Location newLocation)
    {
        Boolean valid = false;
        try
        {
            if(this.locations.add(newLocation))
            {
                valid = true;
            }
        }
        catch(Exception e)
        {
        }
        return valid;
    }
    
    public Boolean addLocation(List<Location> newLocations)
    {
        Boolean valid = false;
        try
        {
            if(this.locations.addAll(newLocations))
            {
                valid = true;
            }
        }
        catch(Exception e)
        {
        }
        return valid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public void setConnection(Boolean connection) {
        this.connection = connection;
    }

    public Boolean getConnection() {
        return connection;
    }

    public String getName() {
        return name;
    }

    public String getMac() {
        return mac;
    }

    public List<Location> getLocations() {
        return locations;
    }
    
    public Location getRecentLocation()
    {
        if (locations.isEmpty())
            return null;
        else
            return locations.get(locations.size() - 1);
    }

    public int getId() {
        return id;
    }
    
    public class CustomComparator implements Comparator<Location> {
        @Override
        public int compare(Location o1, Location o2) {
            return o1.getTime().compareTo(o2.getTime());
        }
        
    }
    
}
