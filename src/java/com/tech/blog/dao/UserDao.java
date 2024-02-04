/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entities.user;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Ankit
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con=con;
    }
    
    //method to insert user to data base;
    
    public boolean saveUser(user User){
        boolean f=false;
        try{
            
            // user>>>databse
            
            String querry="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(querry);
            pstmt.setString(1, User.getName());
            pstmt.setString(2, User.getEmail());
            pstmt.setString(3, User.getPassword());
            pstmt.setString(4, User.getGender());
            pstmt.setString(5, User.getAbout());
            
            pstmt.executeUpdate();
            f=true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //get user by useremail and userpassword
    public user getUserByEmailAndPassword(String email,String password){
        
        
        user User=null;
        try{
            String query="select * from user where email=? and password=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set= pstmt.executeQuery();
            if (set.next()) {
                User=new user();
                //data from db
                String name=set.getString("name");
                //set to user Object
                User.setName(name);
                
                User.setId(set.getInt("id"));
                
                User.setEmail(set.getString("email"));
                User.setPassword(set.getString("password"));
                User.setGender(set.getString("gender"));
                User.setAbout(set.getString("about"));
                User.setDateTime(set.getTimestamp("rdate"));
                User.setProfile(set.getString("profile"));
                
            }
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return User;
    }
    
    public user getUserByUserId(int UserId){
        user User=null;
            String q="select * from user where id=?";
        try {
            
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1, UserId);
            ResultSet set=ps.executeQuery();
            if (set.next()) {
                 User=new user();
                //data from db
                String name=set.getString("name");
                //set to user Object
                User.setName(name);
                
                User.setId(set.getInt("id"));
                
                User.setEmail(set.getString("email"));
                User.setPassword(set.getString("password"));
                User.setGender(set.getString("gender"));
                User.setAbout(set.getString("about"));
                User.setDateTime(set.getTimestamp("rdate"));
                User.setProfile(set.getString("profile"));
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
          
            return User;      
    }
    
}
