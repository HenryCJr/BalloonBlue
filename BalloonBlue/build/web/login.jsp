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
                <form id="loginForm">
                <input type="text" placeholder="Username" name="login" id="loginInput" required>
                <input type="password" placeholder="Password" name="password" id="passwordInput" required>
                <input type="submit" value="Login" id="loginBtn">
            </form>
                <div class="message">Not a member? <a href="create.jsp">Sign in</a></div>
            </div>




        </div>


        <script>
        $(document).ready(function () {
            $("#loginForm").submit(function (event) {
                event.preventDefault();

                // Obtém os valores dos campos de entrada
                var username = $("#loginInput").val();
                var password = $("#passwordInput").val();

                // Verifica se os campos estão preenchidos
                if (!username || !password) {
                    alert("Por favor, preencha todos os campos.");
                    return;
                }

                // Cria um objeto JSON com os dados
                var userData = {
                    "login": username,
                    "password": password
                };

                // Envia os dados para o servlet usando AJAX
                $.ajax({
                    type: "PUT",
                    url: "/BalloonBlue/api/login", // Substitua pelo caminho correto para o seu servlet
                    contentType: "application/json",
                    data: JSON.stringify(userData),
                    success: function (response) {
                        // Manipule a resposta do servidor, se necessário
                        console.log(response);
                        window.location.href = "user.jsp";
                    },
                    error: function (error) {
                        console.error('Erro na solicitação:', error);
                    }
                });
            });
        });
    </script>





    </body>
</html>
