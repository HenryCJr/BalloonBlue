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

                <form @submit.prevent="insertOrUpdateBook()">
                    <label for="bookName">Título:</label>
                    <input type="text" id="bookName" name="bookName" required>

                    <label for="category">Categoria:</label>
                    <input type="text" id="category" name="category" required>

                    <label for="autores">Autores:</label>
                    <input v-model="autores" type="text" id="autores" name="autores" required>

                    <label for="desc">Descrição:</label>
                    <textarea v-model="desc" id="desc" name="desc" rows="4" required></textarea>

                    <label for="price">Preço:</label>
                    <input v-model="price" type="number" id="price" step="0.01" name="price" required>

                    <label for="cape">Capa:</label>
                    <input @change="cape" type="file" id="cape" name="cape" accept="image/*" required>

                    <label for="arq">Arquivo PDF:</label>
                    <input @change="arq" type="file" id="arq" name="arq" accept="arq" required>

                    <button type="submit">{{editingBook ? 'Atualizar medicamento' : 'Inserir medicamento'}}</button>
                </form>
            </div>
        </div>


        


    </body>
</html>
