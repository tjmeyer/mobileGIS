/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.logic;

import com.nex.mobilegis.dataaccess.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author M
 */
public class Authenticator {
    public static Boolean valid = false;
    public static int validAccountId;
    public static String user = null;
    public static String pass = null;
    public static Account account = null;
    
    public static Boolean Authenticate(String username, String password) throws SQLException, ClassNotFoundException{
        DBManager db = DBManager.getInstance();
        String query = "SELECT account_id, password FROM user WHERE username = \"" + username + "\"";
        ResultSet rs = db.execute(query);
        if(rs.next())
        {
            String validPassword = rs.getString("password");
            valid = validPassword.equals(password);
        }
        else
        {
            valid = false;
        }

        if(valid)
        {
            user = username;
            pass = password;
            validAccountId = rs.getInt("account_id");
        }

        return valid;
    }
    
    public static void invalidate()
    {
        valid = false;
        user = null;
        pass = null;
    }
}
