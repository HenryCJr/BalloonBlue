<%-- 
    Document   : user
    Created on : 23 de nov. de 2023, 13:53:14
    Author     : cimin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página do Usuário</title>
        <%@ include file="WEB-INF/jspf/header.jspf" %>
        
    </head>
    <body>
        <div class='pag'>

            <button class='btnForm' onclick="location.href='book.jsp';">Adicionar Livro</button>


            <h1>Livros do Usuário</h1>
            <%@ include file="WEB-INF/jspf/produtos.jspf" %>
        </div>
    </body>
</html>
