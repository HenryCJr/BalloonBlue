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

            <button class='btnForm' onclick="location.href = 'book.jsp';">Adicionar Livro</button>


            <h1>Livros do Usuário</h1>
            <%@ include file="WEB-INF/jspf/produtos.jspf" %> 
        </div>
    </body>

    <script>

        function loadSession() {
            // Cria um objeto Deferred do jQuery
            var deferred = $.Deferred();

            // Faz a solicitação AJAX usando $.ajax
            $.ajax({
                type: "GET",
                url: "/BalloonBlue/api/login",
                dataType: "json", // Define o tipo de dados esperado como JSON
                success: function (data) {
                    // Resolva a promessa com os dados da sessão se a solicitação for bem-sucedida
                    deferred.resolve(data);
                },
                error: function (xhr, status, error) {
                    // Rejeite a promessa com informações de erro se a solicitação falhar
                    deferred.reject({xhr: xhr, status: status, error: error});
                }
            });

            // Retorna a promessa do objeto Deferred
            return deferred.promise();
        }

// Exemplo de uso da função
        loadSession().done(function (data) {
            // Manipule os dados da sessão bem-sucedidos aqui
            console.log("Dados da sessão:", data);
        }).fail(function (error) {
            // Manipule os erros da solicitação aqui
            console.error('Erro na solicitação:', error);
            window.location.href = "login.jsp";
        });
    </script>

</html>
