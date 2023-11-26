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
            <style>


                .bodcontainer {
                    max-width: 800px;
                    margin: 50px auto;
                    text-align: left;
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                }

                .bodcontainer input,
                .bodcontainer textarea,
                .bodcontainer button {
                    width: 100%;
                    padding: 10px;
                    margin-bottom: 16px;
                    box-sizing: border-box;
                }

                #bookbtn {
                    background-color: #4caf50;
                    color: #fff;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                #bookbtn:hover {
                    background-color: #45a049;
                }
            </style>
            <br>
            <div id="app" class="bodcontainer">
                <h2>Novo Livro</h2>

                <form id="userForm" onsubmit="insertOrUpdateUser(); return false;">
                    <label for="name">Nome Completo:</label>
                    <input type="text" id="name" name="name" required>

                    <label for="user">Username:</label>
                    <input type="text" id="user" name="user" required>

                    <label for="contact">Contato:</label>
                    <input type="text" id="contact" name="contact" required>

                    <label for="autores">Senha:</label>
                    <input type="password" placeholder="Password" name="password" id="passwordInput" required>

                    <label for="autores">Confirmar Senha:</label>
                    <input type="password" placeholder="Password" name="password" id="passwordConf" required>


                    <button type="submit">Enviar</button>
                    <div class="message">You are a member? <a href="login.jsp">Sign in</a>
                </form>
            </div>
        </div>


        <script>
            function passwordConfirm() {
                var password = $("#passwordInput").val();
                var confirmPassword = $("#passwordConf").val();

                if (password === confirmPassword) {
                    insertOrUpdateUser();
                } else {
                    alert("As senhas não coincidem!");
                }
            }

            function insertOrUpdateUser() {
                var jsonData = {
                    "login": $("#user").val(),
                    "name": $("#name").val(),
                    "role": "ADMIN",
                    "password": $("#passwordInput").val(),
                    "contact": $("#contact").val(),
                    "books": "",
                    "obras": ""
                            // Adicione outros campos do formulário conforme necessário
                };

                $.ajax({
                    type: 'POST',
                    url: '/BalloonBlue/api/users', // Substitua pelo caminho do seu endpoint de usuário
                    contentType: 'application/json', // Indica que você está enviando JSON
                    data: JSON.stringify(jsonData),
                    success: function (response) {
                        // Lógica de sucesso - manipule a resposta do servidor conforme necessário
                        console.log(response);
                    },
                    error: function (error) {
                        // Lógica de erro - manipule os erros conforme necessário
                        console.error('Erro ao inserir/atualizar usuário:', error);
                    }
                });
            }

            // Evento de envio do formulário
            $(document).ready(function () {
                $('#userForm').submit(function (event) {
                    event.preventDefault(); // Evita o comportamento padrão do formulário
                    passwordConfirm(); // Chama a função de verificação de senha
                });
            });
        </script>



    </body>
</html>



