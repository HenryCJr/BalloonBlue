<%-- 
    Document   : book
    Created on : 23 de nov. de 2023, 14:16:15
    Author     : cimin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Livro</title>
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

                <form id="bookForm" onsubmit="insertOrUpdateBook(); return false;">
                    <label for="name">Título:</label>
                    <input type="text" id="name" name="name" required>

                    <label for="category">Categoria:</label>
                    <input type="text" id="category" name="category" required>

                    <label for="autores">Autores:</label>
                    <input v-model="autores" type="text" id="autores" name="autores" required>

                    <label for="description">Descrição:</label>
                    <textarea v-model="description" id="description" name="description" rows="4" required></textarea>

                    <label for="price">Preço:</label>
                    <input v-model="price" type="number" id="price" step="0.01" name="price" required>

                    <label for="capa">Capa:</label>
                    <input @change="capa" type="file" id="capa" name="capa" accept="image/*" required>

                    <label for="archive">Arquivo PDF:</label>
                    <input @change="archive" type="file" id="archive" name="archive" accept="archive" required>

                    <button type="submit">Enviar</button>
                </form>
            </div>
        </div>


        <script>

       

            function insertOrUpdateBook() {
                var jsonData = {
                    // Adicione campos do formulário aqui
                    "name": $("#name").val(),
                    "category": $("#category").val(),
                    "autores": $("#autores").val(),
                    "description": $("#description").val(),
                    "price": $("#price").val(),
                    "capa": $("#capa").val(),
                    "archive": $("#archive").val(),
                    // Adicione outros campos do formulário conforme necessário
                };

                $.ajax({
                    type: 'POST',
                    url: '/BalloonBlue/api/mybooks', // Substitua pelo caminho do seu endpoint de livro
                    contentType: 'application/json', // Indica que você está enviando JSON
                    data: JSON.stringify(jsonData),
                    success: function (response) {
                        // Lógica de sucesso - manipule a resposta do servidor conforme necessário
                        console.log(response);
                        window.location.href = "user.jsp";
                    },
                    error: function (error) {
                        // Lógica de erro - manipule os erros conforme necessário
                        console.error('Erro ao inserir/atualizar livro:', error);
                    }
                });
            }

            // Evento de envio do formulário
            $('#bookForm').submit(function (event) {
                event.preventDefault();  // Evita o comportamento padrão do formulário
                //insertOrUpdateBook();  // Chama a função de inserção/atualização
            });

        </script>


    </body>
</html>
