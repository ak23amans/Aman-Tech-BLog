<%-- 
    Document   : load_posts
    Created on : 09-Oct-2023, 8:29:20 pm
    Author     : Ankit
--%>
<%@page import="com.tech.blog.helper.CoonectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.List"%>

<div class="row">

<% 
PostDao d=new PostDao(CoonectionProvider.getConnection());

int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid==0){
 posts=d.getAllPosts();
    }else{
    posts=d.getPostByCatId(cid);
    }
    
    
for(Post p:posts){
%>

<div class="col-md-6 mt-4" >
    <div class="card">
        <img class="card-img-top" src="img/<%= p.getpPic() %>" alt="Card image cap"><!-- comment -->
        <div class="card-body">
            <b><%= p.getpTitle()%></b>
            <p><%= p.getpContent()%></p>
            <pre><%= p.getpCode()%></pre>
            
        </div>
            <div class="card-footer primary-background text-center">
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span>10</span> </a> 
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span> </a>
                
            </div>
        
        
    </div>
    
    
</div>

<%
    }



%>
</div>