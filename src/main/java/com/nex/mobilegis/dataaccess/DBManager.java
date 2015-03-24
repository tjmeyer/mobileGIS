/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.dataaccess;

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
    static final String USER = "phoneAccess";
    static final String PASS = "HDL8M9WfUUSnBHcT";
    
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
    
    public void close()
    {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
