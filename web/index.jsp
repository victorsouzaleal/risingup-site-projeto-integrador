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
                            <span class="badge badge-light" style="border-radius: 10px;">
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
                            <a class="nav-link dropdown-toggle clrd-font" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="img/icones_gerais/user.png" style="width: 30px; height: auto;">&nbsp;&nbsp;&nbsp;Login
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item clrd-font" href="#login" data-toggle="modal" data-target="#login">Entrar</a>
                                <a class="dropdown-item clrd-font" href="#cadusuario" data-toggle="modal" data-target="#cadusuario">Cadastre-se</a>
                            </div>
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
                    <c:import url="paginas/carrinho.jsp"></c:import>
                </c:when>
                <c:when test="${param.acao == 'alterar'}">
                    <c:import url="paginas/tela_alterardados.jsp"></c:import>
                </c:when>
                <c:when test="${param.acao == 'categoria'}">
                    <c:import url="paginas/tela_categoria.jsp"></c:import>
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
                <c:when test="${param.acao == null}">
                    <c:import url="paginas/inicio.jsp"></c:import>
                </c:when>
                <c:otherwise>
                    <c:import url="paginas/erro.jsp"></c:import>    
                </c:otherwise>
            </c:choose>
            <!-- ---------- Footer -----------  -->
            <footer class="container-fluid py-5 text-white text-center" style="background-color: #000000">
                <div class="row">
                    <div class="col-12 col-md">
                        <img class="p-2" src="img/logo/logo.png">
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

            <!-- MODAIS -->
            <!-- Modal Usuario -->
            <div class="modal fade" id="cadusuario" tabindex="-1" role="dialog" aria-labelledby="cadusuario" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title clrd-font" id="cadusuario">Cadastro de Usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body text-center">
                            <form class="container mt-4" method="post" action="sys">
                                <input type="hidden" name="logica" value="User">
                                <input type="hidden" name="action" value="cad">
                                <h2 class="text-center clrd-font">Cadastre-se agora!</h2>
                                <div class="form-group mt-4">
                                    <input type="text" class="form-control text-center" id="nome_usu" aria-describedby="emailHelp" name="nome" placeholder="Nome">
                                </div>         
                                <div class="form-group">
                                    <input class="form-control text-center" type="text" name="data" id="datepicker"/>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control text-center" id="email_usu" aria-describedby="emailHelp" name="email" placeholder="Email">
                                </div>               
                                <div class="form-group">
                                    <input type="password" class="form-control text-center" id="senha_usu" name="pws" placeholder="Senha">
                                </div>            
                                <div class="form-group">
                                    <input type="password" class="form-control text-center" id="senha_usu2" name="confpws" placeholder="Confirmar Senha">
                                </div>
                                <div class="form-row">
                                    <div class="col-7">
                                        <input type="text" class="form-control text-center" onblur="pesquisacep(this.value)" name="cep" id="cep" placeholder="CEP">
                                    </div>  
                                    <div class="col">
                                        <input type="text" class="form-control text-center" placeholder="Numero" name="num">
                                    </div>
                                    <div class="col-12 pt-3">
                                        <input type="text" class="form-control text-center" placeholder="Complemento" name="comp">
                                    </div>
                                    <div class="col-7 pt-3">
                                        <input type="text" class="form-control text-center" id="cidade" placeholder="Cidade" name="cidade" readonly="">
                                    </div>
                                    <div class="col pt-3">
                                        <input type="text" class="form-control text-center" id="uf" placeholder="UF" name="uf" readonly="">
                                    </div>
                                    <div class="col-12 pt-3">
                                        <input type="text" class="form-control text-center" id="rua" placeholder="Rua" name="rua" readonly="">
                                    </div>
                                    <div class="col-12 pt-3">
                                        <input type="text" class="form-control text-center" id="bairro" placeholder="Bairro" name="bairro" readonly="">
                                    </div>
                                </div><p></p>
                                <button type="submit" name="cadastrar" class="btn btn-outline-secondary w-100">Cadastrar</button>
                            </form>
                            <p class="pt-2 text-center"><img src="img/logo/logotexpre.png"></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Login -->
            <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title clrd-font" id="login">Login de Usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body text-center">
                            <form class="container pt-5" action="sys" method="post">
                                <input type="hidden" name="logica" value="User">
                                <input type="hidden" name="action" value="login">                
                                <h2 class="text-center clrd-font">Faça seu login</h2>                   
                                <div class="form-group pt-3">
                                    <input type="email" class="form-control text-center" id="email_usu" aria-describedby="emailHelp" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control text-center" id="senha_usu" name="pws" placeholder="Senha">
                                </div>           
                                <small class="text-muted bb clrd-font">Não tem conta?<a href="#cadusuario" data-toggle="modal" data-target="#cadusuario">Cadastre-se!</a></small>
                                <div class="pt-2">
                                    <button type="submit" class="btn btn-outline-secondary w-100">Entrar</button>
                                </div>
                            </form>
                            <p class="pt-2 text-center"><img src="img/logo/logotexpre.png"></p>
                        </div>

                    </div>
                </div>
            </div>
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
            <link rel="stylesheet" href="js/jquery-ui.theme.min.css">
            <script src="js/datepicker.js"></script>
            <script src="js/spinner.js"></script>
            <script src="js/ceps.js"></script>
            <!-- JavaScript -->
            <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/alertify.min.js"></script>

            <!-- AVISOS E MENSAGENS -->
            <c:import url="paginas/alertas.jsp"></c:import>
    </body>
</html>