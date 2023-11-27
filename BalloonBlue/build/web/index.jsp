<%-- 
    Document   : index
    Created on : 17 de nov. de 2023, 18:59:20
    Author     : cimin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BallonBlue -- Where the Stories Live</title>

        <link rel="stylesheet" href="css/style.css">
    </head>


    <body>

        <%@ include file="WEB-INF/jspf/header.jspf" %>


        <div class="pag">

            <div class="banner-container">
                <img class="bannerImg" src="img/banner1.jpg" alt="Banner">
            </div>

            <%@ include file="WEB-INF/jspf/but.jspf" %>


            <br>
        </div>

        <!--Categorias esquerda-->



        <!-- Produtos -->
        <main>

            <div class="pag">
                <br>
                <h2>Featured Products</h2>
                <div class="home">
                    <div class="navbar">
                        <%@ include file="WEB-INF/jspf/categories.jspf" %>
                    </div>


                    <%@ include file="WEB-INF/jspf/produtos.jspf" %>


                </div>
            </div>
<br><br><br>
        </main>
                    
        <!-- Restante do conteúdo da sua página aqui -->

        <%@ include file="WEB-INF/jspf/footer.jspf" %>

    </body>

    <script>
        $(document).ready(function () {
            $('.category-button').on('click', function () {
                var categoria = $(this).find('h4').text();

                // Cria um objeto com a categoria
                var dados = {categoria: categoria};

                // Faz uma requisição AJAX para o servidor com dados em formato JSON
                $.ajax({
                    type: 'GET',
                    url: '/BalloonBlue/api/mybooks',
                    contentType: 'application/json', // Define o tipo de conteúdo como JSON
                    data: JSON.stringify(dados), // Converte o objeto para uma string JSON
                    success: function (data) {
                        console.log('Dados recebidos:', data);



                    },
                    error: function (error) {
                        console.error('Erro na requisição AJAX:', error);
                    }
                });
            });
        });
    </script>



</html>
