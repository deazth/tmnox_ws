/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package noxcore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author JackS
 */
public class dbHandler {
    private static String dbconn = "jdbc:mysql://localhost:3306/tmnox";
    private static String user = "root";
    private static String pword = "";
    
    private Connection conn;
    private Statement stmt;
    
    public dbHandler() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");  
        conn = DriverManager.getConnection(dbconn, user, pword);
        stmt = conn.createStatement();
    }
    
    public ResultSet execSelect(String sql) throws SQLException{
        return stmt.executeQuery(sql);
    }
    
    public void close(){
        try {
            conn.close();
        } catch (Exception e) {
        }
    }
    
    public static String getStr(ResultSet rs, String colname) throws SQLException{
        String ret = rs.getString(colname);
        
        if(ret == null){
            ret = "";
        }
        
        return ret;
    }
    
}
