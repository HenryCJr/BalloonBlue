<%-- 
    Document   : user
    Created on : 23 de nov. de 2023, 12:34:44
    Author     : cimin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balloon Blue -- Login</title>
        <%@ include file="WEB-INF/jspf/header.jspf" %>
        <%@ include file="WEB-INF/jspf/metodos.jspf" %>
    </head>
    <body>

        <div class='pag'>
            <div id='login'>
                <h1>Login</h1>
                <input type="text" placeholder="Username" name="login" id="login" required>
                <input type="password" placeholder="Password" name="password" id="password" required>
                <input type="submit" value="Login" id="loginBtn">
                <div class="message">Not a member? <a href="create.jsp">Sign in</a></div>
            </div>




        </div>


        <script>
            // Quando o documento estiver pronto
            $(document).ready(function () {
                // Adicione um manipulador de clique ao botão de login
                $("#loginBtn").click(function () {
                    // Obtenha os valores dos campos de entrada
                    var login = $("#login").val();
                    var password = $("#password").val();

                    // Faça uma solicitação AJAX usando jQuery
                    $.ajax({
                        type: "GET",
                        url: "BalloonBlue/api/login",
                        data: {login: login, password: password},
                        success: function (response) {
                            // Lógica de sucesso - manipule a resposta do servidor conforme necessário
                            console.log(response);
                        },
                        error: function (error) {
                            // Lógica de erro - manipule os erros conforme necessário
                            console.error("Erro ao fazer login:", error);
                        }
                    });
                });
            });
        </script>





    </body>
</html>
