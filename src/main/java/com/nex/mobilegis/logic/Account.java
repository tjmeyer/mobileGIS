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

/**
 *
 * @author M
 */
public class Account {
    private int id;
    private List<User> users = new ArrayList<>();

    public Account(int newId) throws SQLException, ClassNotFoundException
    {
        this.id = newId;
        DBManager db = DBManager.getInstance();
        String query = "SELECT * FROM user WHERE account_id = " + newId;
        ResultSet rs = db.execute(query);
        while(rs.next())
        {
//            int newId,
//            String newFirstName, 
//            String newLastName, 
//            String newEmail, 
//            String newUsername,
//            Boolean isMaster
            int userId = rs.getInt("id");
            String userFirstName    = rs.getString("first_name");
            String userLastName     = rs.getString("last_name");
            String userEmail    = rs.getString("email");
            String userUsername = rs.getString("username");
            Boolean userMaster  = rs.getBoolean("master_user");
            User newUser = new User(userId, userFirstName, 
            userLastName, userEmail, userUsername, userMaster);
            users.add(newUser);            
        }
    }
    
    public Boolean setUser(List<User> newUsers)
    {
        Boolean valid = false;
        if(this.users.addAll(newUsers))
        {
            valid = true;
        }
        return valid;
    }
    
    public Boolean setUser(User newUser)
    {
        Boolean valid = false;
        if(this.users.add(newUser))
        {
            valid = true;
        }
        return valid;
    }
    
    public int getId() {
        return id;
    }
    
    public List getUsers() {
        return users;
    }
    
}
