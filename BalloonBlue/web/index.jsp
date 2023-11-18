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

  <header>
        <div class="container">
     

            <form id="search-form">
                <img id="logo" src="img/logo.png" alt="Logo">
                <input type="text" placeholder="Buscar produtos">
                <button class="btnSearch" type="submit">Buscar</button>

        
                <div class="perfil" onclick="location.href='https://www.google.com';">
                    <img class="ftPerfil" src="img/perfil.png" alt="Alternate Text">
                </div>
        
             <!--  </div>  
             </ul> -->

            </form>
     
        </div>
   
    </header>

    <div class="pag">

        <div class="banner-container">
            <img class="bannerImg" src="img/banner1.jpg" alt="Banner">
        </div>



        <form id="cat-form">

      
            <button class="category-button">
                <img class="btnBal" src="img/balloon.png" width="50px">
                <h4>Adventure</h4>
            </button>

            <button class="category-button">
                <img class="btnBal" src="img/balloon.png" width="50px">
                <h4>Romance</h4>
            </button>

          <button class="category-button">
              <img class="btnBal" src="img/balloon.png" width="50px">
              <h4>Terror</h4>
          </button>

         <button class="category-button">
             <img class="btnBal" src="img/balloon.png" width="50px">
             <h4>Ação</h4>
         </button>

     <button class="category-button">
         <img class="btnBal" src="img/balloon.png" width="50px">
         <h4>Fantasia</h4>
     </button>

      <button class="category-button">
          <img class="btnBal" src="img/balloon.png" width="50px">
          <h4>Mangá</h4>
      </button>

     

     </form>
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

    <ul>

        <li><h3>Categorias</h3></li>

        <li><a href="#">Ação</a></li>

        <li><a href="#">Romance</a></li>

        <li><a href="#">Terror</a></li>

        <li>_______________________</li>

        <li><h3>Localização</h3></li>

        <li><a href="#">Frete Grátis</a></li>

        <li><a href="#">Cidade</a></li>

        <li><a href="#">Região</a></li>

        <li><a href="#">Estado</a></li>

        <li>_______________________</li>

        <li><a href="#">Top Tier</a></li>

        <li><a href="#">Destaques</a></li>

    </ul>

</div>

    
        
        <div class="product-grid">
            <!-- Individual Products Go Here -->

<div class="product">

    <div class="circle-button" onclick="location.href='https://www.google.com';">

    <img src="img/book.jpg" alt="Alternate Text">

    
    <!-- <img src="banner1.jpg" alt="Product Name"> -->
    <h3>Product Name</h3>
    <p>Product Description</p>
    <p>Price: $99.99</p>
    <button>Add to Cart</button>
    </div>
  </div>

<div class="product">

    <div class="circle-button" onclick="location.href='https://www.google.com';">

    <img src="img/book.jpg" alt="Alternate Text">

    
    <!-- <img src="banner1.jpg" alt="Product Name"> -->
    <h3>Product Name</h3>
    <p>Product Description</p>
    <p>Price: $99.99</p>
    <button>Add to Cart</button>
    </div>
  </div>

<div class="product">

    <div class="circle-button" onclick="location.href='https://www.google.com';">

    <img src="img/book.jpg" alt="Alternate Text">

    
    <!-- <img src="banner1.jpg" alt="Product Name"> -->
    <h3>Product Name</h3>
    <p>Product Description</p>
    <p>Price: $99.99</p>
    <button>Add to Cart</button>
    </div>
  </div>

<div class="product">

    <div class="circle-button" onclick="location.href='https://www.google.com';">

    <img src="img/book.jpg" alt="Alternate Text">

    
    <!-- <img src="banner1.jpg" alt="Product Name"> -->
    <h3>Product Name</h3>
    <p>Product Description</p>
    <p>Price: $99.99</p>
    <button>Add to Cart</button>
    </div>
  </div>
</div>
</div>

</main>

  <!-- Restante do conteúdo da sua página aqui -->

  <footer>
    <p>&copy; 2023 BalloonBlue. Todos os direitos reservados.</p>
  </footer>

</body>
</html>
