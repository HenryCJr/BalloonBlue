<%-- 
    Document   : user
    Created on : 23 de nov. de 2023, 12:34:44
    Author     : cimin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ballon Blue -- Create Account</title>
        <%@ include file="WEB-INF/jspf/header.jspf" %>
        
    </head>
    <body>

        <div class='pag'>
            <div id='login'>
                <h1>Create Account</h1>
                
                <input type="text" placeholder="Username" name="uname" required>
                

                <input type="password" placeholder="Password" name="psw" required>
                <input type="password" placeholder="Confirm Password" name="psw" required>


                <input type="submit" value="Login">
            <div class="message">You are a member? <a href="login.jsp">Sign in</a>
            </div>

            </div>




        </div>


    </body>
</html>
