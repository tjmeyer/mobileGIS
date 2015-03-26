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
    static final String DB_URL = "jdbc:mysql://localhost/nex";
    
    //  Database credentials
    static final String USER = "root";
    static final String PASS = "kumite2";
    
//    // JDBC driver name and database URL
//    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
//    static final String DB_URL = "jdbc:mysql://127.7.255.2:3306/java";
//    
//    //  Database credentials
//    static final String USER = "adminzXPkWVV";
//    static final String PASS = "CnPzN5ksVQAE";
    
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
    
    public Boolean usernameExists(String username) throws SQLException
    {
        Boolean exists = true;
        String query = "SELECT id FROM user WHERE username = \""+username+"\"";
        ResultSet rs = execute(query);
        if(!rs.next())
        {
            exists = false;
        }
        return exists;
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
    
    public void insertUser(String newFirstName, String newLastName, String newEmail, String newUsername, String newPassword, Boolean isMasterUser, int accountId) throws SQLException
    {
        System.out.println("Preparing statement... [INSERT INTO user VALUES ("
                + newFirstName +", "+newLastName+", "+newEmail+", "+newUsername+", "+newPassword+")");
        String query = "INSERT INTO user (first_name, last_name, email, username, password, master_user, account_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, newFirstName);
        statement.setString(2, newLastName);
        statement.setString(3, newEmail);
        statement.setString(4, newUsername);
        statement.setString(5, newPassword);
        statement.setBoolean(6, isMasterUser);
        statement.setInt(7, accountId);
        statement.execute();
    }
    
    public int insertAccount() throws SQLException
    {
        System.out.println("Preparing statement... [INSERT INTO account]");
        String query = "INSERT INTO account VALUES ()";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
        ResultSet key = stmt.getGeneratedKeys();
        int lastId = 0;
        if(key.next())
        {
            lastId = key.getInt(1);
        }
        return lastId;
    }
    
    public void close()
    {
        try {
            System.out.println("Closing Conneciton");
            conn.close();
            singletonInstance = null;
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
