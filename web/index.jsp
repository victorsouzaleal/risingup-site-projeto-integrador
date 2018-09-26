<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ctrl_cat" class="controller.CtrlCategoria"/>
<jsp:useBean id="ctrl_prod" class="controller.CtrlProduto"/>
<!doctype html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/full-slider.css" rel="stylesheet"> <!-- carousel  -->
        <link rel="stylesheet" href="css/style.css">       <!-- Galeria  -->
        <link rel="shortcut icon" type="image/ico" href="img/logo/favicon.png"/>
        <!-- CSS -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/css/alertify.min.css"/>
        <!-- Bootstrap theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/css/themes/bootstrap.min.css"/>
        <title>Rising UP!</title>
    </head>
    <body>
        <!-- ---------- navbar -----------  -->    
        <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #000000;">
            <a class="navbar-brand" href="index.jsp">
                <img src="img/logo/logo.png" alt="logo" style="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
                <ul class="nav justify-content-end">
                    <li class="nav-item dropdown d-lg-none">
                        <a class="nav-link dropdown-toggle clrd-font" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            &nbsp;&nbsp;&nbsp;Categorias
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:forEach items="${ctrl_cat.buscarCategorias()}" var="cat">
                                <a class="nav-link clrd-font d-inline-block" href="index.jsp?acao=categoria&id=${cat.id}">${cat.nome}</a>
                            </c:forEach>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp?acao=carrinho"><img src="img/icones_gerais/store.png" style="width: 30px; height: auto;"/>
                            <span class="badge" style="background-color: #673AB7; color: #fff;border-radius: 10px;">
                                <c:set value="0" var="car_num"></c:set>
                                <c:forEach items="${carrinho}" var="car1">
                                    <c:set value="${car_num + 1}" var="car_num"></c:set>
                                </c:forEach>
                                ${car_num}
                            </span>
                        </a>
                    </li>  
                    <c:if test="${empty cliente.id}">
                        <li class="nav-item dropdown mr-4">
                            <a class="nav-link clrd-font d-inline-block" href="index.jsp?acao=login">Entrar</a>
                        </li>
                    </c:if>
                    <c:if test="${not empty cliente.id}">  
                        <li class="nav-item dropdown mr-4">
                            <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="img/icones_gerais/user.png" style="width: 30px; height: auto;">&nbsp;&nbsp;&nbsp;${cliente.nome}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item clrd-font" href="index.jsp?acao=meus_pedidos" >Meus Pedidos</a>
                                <a class="dropdown-item clrd-font" href="index.jsp?acao=alterar">Alterar Dados</a>
                                <a class="nav-link clrd-font" href="sys?logica=User&action=off">&nbsp;&nbsp;&nbsp;Sair</a>
                            </div>
                        </li>

                    </c:if>

                </ul>
            </div>  
        </nav>

        <c:if test="${param.acao == null}">
            <!-- ---------- navbar com itens-----------  -->     
            <div class="container-fluid d-none d-lg-block" style="padding-top: 30px; background-color: rgba(0, 0, 0, 0.5); position: absolute; z-index: 2">
            </c:if>
            <c:if test="${param.acao != null}">
                <!-- ---------- navbar com itens-----------  -->     
                <div class="container-fluid d-none d-lg-block" style="padding-top: 30px; background-color: rgba(0, 0, 0, 1); position: relative; top: 90px; z-index: 2">
                </c:if>
                <ul class="nav justify-content-center text-center">
                    <li class="nav-item px-4">
                        <img src="img/icones_gerais/home.png" style="width: 30px; height: auto;">
                        <a class="nav-link text-white" href="index.jsp">Home</a>
                    </li>
                    <c:forEach items="${ctrl_cat.buscarCategorias()}" var="cat">
                        <li class="nav-item px-4">
                            <img src="img/icones_cat/${cat.icone1}" style="width: 30px; height: auto;">
                            <a class="nav-link text-white" href="index.jsp?acao=categoria&id=${cat.id}">${cat.nome}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <!-- PAGINAS -->
            <c:choose>
                <c:when test="${param.acao == 'carrinho'}">
                    <c:import url="paginas/carrinho.jsp" charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == 'cadastro' && empty cliente}">
                    <c:import url="paginas/cad_usu.html"  charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == 'login' && empty cliente}">
                    <c:import url="paginas/login_usu.html" charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == 'alterar'}">
                    <c:import url="paginas/tela_alterardados.jsp" charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == 'categoria'}">
                    <c:import url="paginas/tela_categoria.jsp" charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == 'finalizarPedido'}">
                    <c:import url="paginas/finalizarPedido.jsp" charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == 'meus_pedidos'}">
                    <c:import url="paginas/listaPedidos.jsp" charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == 'detalhes'}">
                    <c:import url="paginas/detalhesProdutos.jsp" charEncoding="utf-8"></c:import>
                </c:when>
                <c:when test="${param.acao == null}">
                    <c:import url="paginas/inicio.jsp" charEncoding="utf-8"></c:import>
                </c:when>
                <c:otherwise>
                    <c:import url="paginas/erro.jsp" charEncoding="utf-8"></c:import>    
                </c:otherwise>
            </c:choose>

            <!-- ----------------- Linha -----------------  -->
            <hr style="margin-top: 40px;">
            <!-- ---------- Galeria -----------  -->
            <div class="container-fluid pt-5 d-none d-lg-block">
                <div class="row">
                    <div class="col-md-3 col-sm-4 col-xs-12 single_portfolio_text">
                        <img src="img/galeria/Battlefield-c.png" alt="" class="d-block mx-auto" style="width : 100%; height: auto;"/>
                        <div class="portfolio_images_overlay text-center">
                            <h2 class="clrd-font">Raptor</h2>
                            <p class="clrd-font pt-2">Você é aficionado por games e precisa de uma máquina que te acompanhe, certo? Conheça o Raptor, um computador desenvolvido pela Rocketz para você destruir nos games atuais.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12 single_portfolio_text">
                        <img src="img/galeria/Fortnite-c.png" alt="" class="d-block mx-auto" style="width : 100%; height: auto;"/>
                        <div class="portfolio_images_overlay text-center">
                            <h2 class="clrd-font">Firestorm</h2>
                            <p class="clrd-font pt-2">O Firestorm chega a sua 4ª edição! Agora ainda mais moderno, mais rápido e mais impressionante! No seu coração pulsa o poderoso e novíssimo Core i5 8400, um dos processadores.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12 single_portfolio_text">
                        <img src="img/galeria/PUBG-c.png" alt="" class="d-block mx-auto" style="width : 100%; height: auto;"/>
                        <div class="portfolio_images_overlay text-center">
                            <h2 class="clrd-font">Predator</h2>
                            <p class="clrd-font pt-2">Aguce seus instintos, é hora da caça! Que tal conhecer de perto o poder dessa super-máquina? Equipada com Intel Core i7 e reunindo tudo o que há de melhor se tratando de hardware.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12 single_portfolio_text">
                        <img src="img/galeria/Witcher.png" alt="" class="d-block mx-auto" style="width : 100%; height: auto;"/>
                        <div class="portfolio_images_overlay text-center">
                            <h2 class="clrd-font">Veneno</h2>
                            <p class="clrd-font pt-2">Experimente um novo nível de performance e vá onde nenhum outro computador pode chegar. Equipada com o Core i7 8700K, uma GeForce GTX 1070 Ti em conjunto com um SSD de 120GB.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ----------------- Linha -----------------  -->
            <hr style="margin-top: 40px;">

            <!-- ---------- Footer -----------  -->
            <footer class="container-fluid py-5 text-white text-center" style="background-color: #000000">
                <div class="row">
                    <div class="col-12 col-md">
                        <img class="p-2" src="img/logo/logo.png">
                    </div>
                    <div class="col-6 col-md">
                        <h5 class="clrd-font2">Sobre</h5>
                        <ul class="list-unstyled text-small clrd-font">
                            <li><a class="clrd-font" href="#quemsomos" data-toggle="modal" data-target="#quemsomos">Quem Somos</a></li>
                            <li><a class="clrd-font" href="#">Trabalhe Conosco</a></li>

                        </ul>
                    </div>
                    <div class="col-6 col-md">
                        <h5 class="clrd-font2">Dúvidas</h5>
                        <ul class="list-unstyled text-small clrd-font">
                            <li><a class="clrd-font" href="#">FAQ</a></li>
                            <li><a class="clrd-font" href="#">Central de Atendimento</a></li>

                        </ul>
                    </div>
                    <div class="col-6 col-md">
                        <h5 class="clrd-font2">Informações</h5>
                        <ul class="list-unstyled text-small clrd-font">
                            <li><a class="clrd-font" href="#">Frete e envio</a></li>
                            <li><a class="clrd-font" href="#">Politica de Privacidade</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md">
                        <h5 class="clrd-font2">Problemas</h5>
                        <ul class="list-unstyled text-small clrd-font">
                            <li><a class="clrd-font" href="#">Entre em contato</a></li>
                            <li><a class="clrd-font" href="#">Trocas e devolução</a></li>
                        </ul>
                    </div>
                </div>
            </footer>

            <!-- MODAIS -->
            <!-- Modal Quem somos -->
            <div class="modal fade" id="quemsomos" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title clrd-font" id="exampleModalCenterTitle">Quem somos</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body text-center">    

                            O site da Rising UP! Ã© um marketplace focado no pÃºblico gamer. NÃ³s contamos com um site dedicado Ã  missÃ£o de oferecer sempre os melhores computadores e acessÃ³rios para sua diversÃ£o.
                            <p class="pt-2"> AtravÃ©s do web-site vocÃª vai encontrar produtos, serviÃ§os e um atendimento exclusivo que vÃ£o transformar os seus sonhos em realidade.</p>
                            <p class="pt-2 text-center"><img src="imagens/logo/logotexpre.png"></p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            <script src="js/ceps.js"></script>
            <!-- JavaScript -->
            <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/alertify.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
            <script src="js/datepicker.js"></script>
            <!-- AVISOS E MENSAGENS -->
            <c:import url="paginas/alertas.jsp"></c:import>
    </body>
</html>