/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;

/**
 *
 * @author asus
 */
public class Connector {
    
    private String host = "jdbc:mysql://localhost:3306/arrowsmithhydra";
    private String username = "root";
    private String password = "mervin1234";
    public Connection con;
    
    public Connector(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(host, username, password);
        }catch(Exception e){
            System.out.println("Unable to connect to DB");
        }
    }
    
    public Connection getConnector(){
        return con;
    }
    
}
