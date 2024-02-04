/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;
import java.sql.*;
/**
 *
 * @author Ankit
 */
public class CoonectionProvider
{
private static Connection con;
    public static Connection getConnection;
public static Connection getConnection(){
    try{
        if (con==null) {
            //driver class load
        Class.forName("com.mysql.cj.jdbc.Driver");
        //create a connection..
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amantechblog","root","T#9758@qlph");
        }
        
        
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return con;
}
    
}
