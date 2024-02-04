<%-- 
    Document   : show_blog_page
    Created on : 11-Oct-2023, 6:41:49 pm
    Author     : Ankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.user" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="com.tech.blog.helper.CoonectionProvider"%>
<%@page errorPage="error_Page.jsp" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category" %>

<%
    user User=(user)session.getAttribute("currentuser");
    if(User==null){
    response.sendRedirect("login_Page.jsp");
    }

%>

<% 
int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(CoonectionProvider.getConnection());
Post p=d.getPostByPostId(postId);


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || TechBlog by Learn Code with Aman</title>
        
        <!-- css -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <style>
                
                .banner-background{
                 clip-path: polygon(50% 0%, 80% 0, 100% 0, 100% 98%, 75% 91%, 50% 99%, 23% 91%, 0 99%, 0 9%, 16% 3%);
                }
                
                .post-title{
                    font-weight: 100;
                    font-size: 30px;
                }
                .post-content{
                    font-weight: 100;
                    font-size: 24;
                }
                .post-date{
                    font-style: italic;
                    font-weight: bold;
                }
                .post-user-info{
                    font-size: 12px;
                   
                }
                .row-user{
                    border: 1px solid #e2e2e2;
                    padding-top: 10px;
                }
                
                body{
                    background: url(img/wall.jpg);
                    background-size: cover;
                    background-attachment: fixed;
                }
            </style>
        
    </head>
    <body>
        
         <!-- navbar -->
        
       <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-code"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-coffee"></span>Code With Aman <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square-o"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure & Algorithm</a>
        </div>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="#"><span class="fa fa-phone-square"></span>Contact Us</a>
       </li>
       <li class="nav-item">
           <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Do Post</a>
       </li>
       
       
      
    </ul>
      <ul class="navbar-nav mr-right">
        
          <li class="nav-item">
              <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-mortar-board"></span><%= User.getName()%></a>
      </li>  
          
          <li class="nav-item">
           <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus "></span>Log Out</a>
      </li>  
          
      </ul>
  </div>
</nav> 
     
       <!-- end od navbar -->
       
       <!-- main content of body -->
       
       <div class="container">
           <div class="row my-4">
               <div class="col-md-8 offset-md-2">
                   
                   <div class="card">
                       
                       <div class="card-header primary-background text-white">
                           <h4 class="post-title"><%= p.getpTitle() %></h4>
                           
                       </div>
                           <div class="card-body">
                                 
                                  <img class="card-img-top my-2" src="img/<%= p.getpPic() %>" alt="Card image cap">
                                  
                                  <div class="row my-2 row-user">
                                      <div class="col-md-8">
                                          <%
                                              UserDao ud=new UserDao(CoonectionProvider.getConnection());
                                              %>
                                       
                                              <p class="post-user-info"> <a href="#"><%= ud.getUserByUserId(p.getUserId()).getName() %></a> has posted:</p>
                                      </div>
                                      
                                      <div class="col-md-4">
                                          <p class="post-date"> <%= p.getpDate().toLocaleString() %> </p>
                                      </div>
                                      
                                  </div>
                                  
                                  <p class="post-content"><%= p.getpContent() %></p>
                               <br>
                               <br><!-- comment -->
                               <div class="post-code">
                               <pre><%= p.getpCode() %></pre>
                               </div>
                               
                           </div>
                               <div class="card-footer primary-background">
                                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span>10</span> </a> 
             
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span> </a>
                               </div>
                       
                       
                   </div>  
                   
                   
                  
               </div>
               
           </div>
           
       </div>
       
       
       <!-- end content of body -->
        
        
        
        
        <!-- profile Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
          <h5 class="modal-title" id="exampleModalLabel"><span class="fa fa-code"></span>Tech Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img scr= "pics/<%= User.getProfile()%>"><!-- comment -->
              <br><!-- comment -->
               <h5 class="modal-title" id="exampleModalLabel"><%= User.getName()%></h5>
              
               <!-- details -->
               <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">Id: </th>
      <td><%= User.getId()%></td>
     
    </tr>
    <tr>
      <th scope="row">Email: </th>
      <td><%= User.getEmail()%></td>
      
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%= User.getGender()%></td>
      
    </tr>
    <tr>
      <th scope="row">Status: </th>
      <td><%= User.getAbout()%></td>
      
    </tr>
    
    <tr>
      <th scope="row">Registered On: </th>
      <td><%= User.getDateTime().toString()%></td>
      
    </tr>
    
  </tbody>
</table>
               
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
       
       
      <!-- end of profile modal -->
      
      <!-- add post modal -->
 
      <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Provide the Post Details..</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>---Select Categories---</option
                      <%
                          PostDao postd=new PostDao(CoonectionProvider.getConnection());
                          ArrayList<Category> list=postd.getAllCategories();
                          for(Category c:list){
                          %>
                       
                          <option value="<%= c.getCid() %>"><%= c.getName() %></option> 
                                 <%
                                     }
                                     %>
                  
              </select> 
              </div>
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter post tittle" class="form-control"><!-- comment -->
                
              </div>
              
              <div class="form-group">
                  <textarea name="pContent" class="form-control" style="height: 170px;" placeholder="Enter your Content" ></textarea>
                  
            </div>
              
              <div class="form-group">
                  <textarea name="pCode" class="form-control" style="height: 170px;" placeholder="Enter your program (if any?)" ></textarea>
                  
            </div>
              
              <div class="form-group">
                  <label>Select Your Pic: </label>
                  <br><!-- comment -->
                  <input type="file" name="pic"><!-- comment --><!-- comment -->
                  
              </div>
      
                                     <div class="container text-center">
                                         
                                         <button type="submit" class="btn btn-outline-primary">Post</button>
                                     </div>
              
              
          </form>
        
        
        
        
        
      </div>
      
    </div>
  </div>
</div>
      
      <!-- End of post modal -->
       
        <!-- javaScript -->
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myjs.js" type="text/javascript"></script>
       
<!-- now add post js --> 

<script>
    $(document).ready(function (e){
      //
      $("#add-post-form").on("submit",function(event){
          //this code gets called when forn is sybmitted...
          event.preventDefault();
          console.log("you have clicked on submit");
          let form=new FormData(this);
          // now requestong to server
          $.ajax({
              url: "AddPostServlet",
              type: 'POST',
              data: form,
              success: function (data, textStatus, jqXHR) {
                        //success
                        console.log(data);
                        if(data.trim()=='done'){
                            swal("Good job!", "Saved Successfully", "success");
                        }else {
                            swal("Error...", "Something went wrong..", "error");
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error
                         swal("Error...", "Something went wrong..", "error");
                    },
                    processData: false,
                    contentType: false
          })
          
      })
    })
    
</script>
        
        
    </body>
</html>
