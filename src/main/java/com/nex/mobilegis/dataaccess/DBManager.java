/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.dataaccess;

import com.nex.mobilegis.logic.Phone;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author M
 */
public class DBManager {
    
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://127.7.255.2:3306/java";
    
    //  Database credentials
    static final String USER = "adminzXPkWVV";
    static final String PASS = "CnPzN5ksVQAE";
    
    // This is a singleton class
    static DBManager singletonInstance = null;
    static Connection conn = null;
    
    DBManager(){}
    
    public static DBManager getInstance() throws SQLException, ClassNotFoundException
    {
        if(singletonInstance == null)
        {
            startConnection();
            singletonInstance = new DBManager();
        }
        return singletonInstance;
    }
    
    public static void startConnection() throws SQLException, ClassNotFoundException
    {
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Connecting to database...");
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
    }
    
    public ResultSet execute(String query) throws SQLException
    {
        System.out.println("Creating statement...["+query+"]");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        return rs;
    }
    
    public void insertPhone(String newMac, String newName, Boolean newConn, int account_id, int user_id) throws SQLException
    {
        String query = "INSERT INTO phone (mac, name, connection, account_id, user_id) "
                + "VALUES (?, ?, ?, ?, ?)";
        
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, newMac);
        statement.setString(2, newName);
        statement.setBoolean(3, newConn);
        statement.setInt(4, account_id);
        statement.setInt(5, user_id);
        statement.execute();
    }
    
    public void close()
    {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
