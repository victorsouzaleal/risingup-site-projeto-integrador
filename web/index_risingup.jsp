<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ctrl_cat" class="controller.CtrlCategoria"/>
<!doctype html>
<html lang="pt-br">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/full-slider.css" rel="stylesheet"> <!-- carousel  -->
        <link rel="stylesheet" href="css/style.css">       <!-- Galeria  -->
        <link rel="shortcut icon" type="image/ico" href="img/logo/favicon.png"/>
        <title>Rising UP!</title>
    </head>
    <body>
        <!-- ---------- navbar -----------  -->    
        <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #000000;">
            <a class="navbar-brand" href="#">
                <img src="img/logo/logo.png" alt="logo" style="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
                <ul class="nav justify-content-end">
                    <c:if test="${empty cliente.nome}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle clrd-font" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="img/icones_gerais/user.png" style="width: 30px; height: auto;">&nbsp;&nbsp;&nbsp;Login
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item clrd-font" href="#login" data-toggle="modal" data-target="#login">Entrar</a>
                                <a class="dropdown-item clrd-font" href="#cadusuario" data-toggle="modal" data-target="#cadusuario">Cadastre-se</a>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${not empty cliente.nome}">    
                        <li class="nav-item">
                            <a class="nav-link clrd-font" href="#"><img src="img/icones_gerais/user.png" style="width: 30px; height: auto;">&nbsp;&nbsp;&nbsp;${cliente.nome}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link clrd-font" href="sys?logica=User&action=off">&nbsp;&nbsp;&nbsp;Sair</a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link clrd-font" href="#"><img src="img/icones_gerais/store.png" style="width: 30px; height: auto;"> Carrinho</a>
                    </li>          
                </ul>
            </div>  
        </nav>
        <!-- ---------- navbar com itens-----------  -->     
        <div class="container-fluid" style="padding-top: 30px; background-color: rgba(0, 0, 0, 0.5); position: absolute; z-index: 2">
            <ul class="nav justify-content-center text-center">
                <li class="nav-item px-4">
                    <img src="img/icones_cat/home.png" style="width: 30px; height: auto;">
                    <a class="nav-link text-white" href="#">Home</a>
                </li>
                <c:forEach items="${ctrl_cat.buscarCategorias()}" var="cat">
                    <li class="nav-item px-4">
                        <img src="img/icones_cat/${cat.icone1}" style="width: 30px; height: auto;">
                        <a class="nav-link text-white" href="#">${cat.nome}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!-- PAGINAS -->
        <c:choose>
            <c:when test="${param.acao == 'carrinho'}">
                <c:import url="paginas/carrinho.jsp"></c:import>
            </c:when>
            <c:when test="${param.acao == 'finalizarPedido'}">
                <c:import url="paginas/finalizarPedido.jsp"></c:import>
            </c:when>
            <c:when test="${param.acao == 'meus_pedidos'}">
                <c:import url="paginas/listaPedidos.jsp"></c:import>
            </c:when>
            <c:when test="${param.acao == 'detalhes'}">
                <c:import url="paginas/detalhesProdutos.jsp"></c:import>
            </c:when>
            <c:otherwise>
                <c:import url="paginas/inicio.jsp"></c:import>    
            </c:otherwise>
        </c:choose>
        <!-- ---------- Footer -----------  -->
        <footer class="container-fluid py-5 text-white text-center" style="background-color: #000000">
            <div class="row">
                <div class="col-12 col-md">
                    <img src="img/logo/logo.png">
                </div>
                <div class="col-6 col-md">
                    <h5 class="clrd-font2">Features</h5>
                    <ul class="list-unstyled text-small clrd-font">
                        <li><a class="text-muted" href="#quemsomos" data-toggle="modal" data-target="#quemsomos">Quem Somos</a></li>
                        <li><a class="text-muted" href="#">Random feature</a></li>

                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5 class="clrd-font2">Resources</h5>
                    <ul class="list-unstyled text-small clrd-font">
                        <li><a class="text-muted" href="#">Resource</a></li>
                        <li><a class="text-muted" href="#">Resource name</a></li>

                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5 class="clrd-font2">Resources</h5>
                    <ul class="list-unstyled text-small clrd-font">
                        <li><a class="text-muted" href="#">Business</a></li>
                        <li><a class="text-muted" href="#">Education</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5 class="clrd-font2">About</h5>
                    <ul class="list-unstyled text-small clrd-font">
                        <li><a class="text-muted" href="#">Team</a></li>
                        <li><a class="text-muted" href="#">Locations</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="js/jquery-ui.theme.min.css">
        <script src="js/datepicker.js"></script>
        <script src="js/spinner.js"></script>
        <script src="js/ceps.js"></script>
    </body>
</html>