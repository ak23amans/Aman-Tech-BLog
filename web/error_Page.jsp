<%-- 
    Document   : error_Page
    Created on : 05-Oct-2023, 2:15:11 pm
    Author     : Ankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something Went Wrong....</title>
        <!-- css -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <style>
                
                .banner-background{
                 clip-path: polygon(50% 0%, 80% 0, 100% 0, 100% 98%, 75% 91%, 50% 99%, 23% 91%, 0 99%, 0 9%, 16% 3%);
                }
            </style>
        
        
        
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png " class="img-fluid">
            <h3 class="display-3">Sorry! Something Went Wrong..</h3>
            <%=exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
            
        </div>
        
        
        
    </body>
</html>
