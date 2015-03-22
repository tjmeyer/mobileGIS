/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.logic;

import com.nex.mobilegis.dataaccess.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author M
 */
public class User{
    private String firstName;
    private String lastName;
    private String email;
    private String username;
    private Boolean master;
    private int id;
    private List<Phone> phones = new ArrayList<>();
    
    User (int newId,
            String newFirstName, 
            String newLastName, 
            String newEmail, 
            String newUsername) throws SQLException, ClassNotFoundException
    {
        this(newId, newFirstName, newLastName, newEmail, newUsername, false);
    }
    
    User (int newId,
            String newFirstName, 
            String newLastName, 
            String newEmail, 
            String newUsername,
            Boolean isMaster) throws SQLException, ClassNotFoundException
    {
        this.id         = newId;
        this.firstName  = newFirstName;
        this.lastName   = newLastName;
        this.email      = newEmail;
        this.username   = newUsername;
        this.master     = isMaster;
        
        DBManager db = DBManager.getInstance();
        String query = "SELECT * FROM phone WHERE user_id = " + newId;
        ResultSet rs = db.execute(query);
        while(rs.next())
        {
            //int newId, String newMac, String newName, Boolean newConnection            
            int phoneId = rs.getInt("id");
            String phoneMac  = rs.getString("mac");
            String phoneName = rs.getString("name");
            Boolean phoneConnection  = rs.getBoolean("connection");
            Phone newPhone = new Phone(phoneId, phoneMac, phoneName, phoneConnection);
            phones.add(newPhone);
        }
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }
    
    public Boolean isMaster() {
        return master;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setMaster(Boolean master) {
        this.master = master;
    }
    
    public List<Phone> getPhones()
    {
        return phones;
    }
}
