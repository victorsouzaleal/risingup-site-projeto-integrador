<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_prod" class="controller.CtrlProduto"/>
<jsp:useBean id="ctrl_cat" class="controller.CtrlCategoria"/>

<!-- ---------- carousel -----------  -->
<div id="carousel-example-2" class="carousel slide carousel-fade z-depth-1-half" data-ride="carousel" style="z-index: 1; margin-top: 90px;">
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-2" data-slide-to="1"></li>
        <li data-target="#carousel-example-2" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
            <div class="view">
                <img class="d-block w-100" src="img/carousel/carousel07.png" alt="First slide">
                <div class="mask rgba-black-light"></div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="view">
                <img class="d-block w-100" src="img/carousel/carousel01.png" alt="Second slide">
                <div class="mask rgba-black-light"></div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="view">
                <img class="d-block w-100" src="img/carousel/carousel03.png" alt="Third slide">
                <div class="mask rgba-black-light"></div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="view">
                <img class="d-block w-100" src="img/carousel/carousel06.png" alt="Third slide">
                <div class="mask rgba-black-light"></div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="view">
                <img class="d-block w-100" src="img/carousel/carousel04.png" alt="Third slide">
                <div class="mask rgba-black-light"></div>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- AVISOS E MENSAGENS -->
<c:import url="paginas/alertas.jsp"></c:import>
    <!-- ----------------- Linha -----------------  -->
    <hr>
    <!-- ---------- carousel de Marcas -----------  -->
    <div class="container-fluid d-none d-lg-block">
        <div id="multi-item-example" class="carousel slide carousel-multi-item carousel-multi-item-2 text-center" data-ride="carousel">
            <div class="controls-top">
                <a class="black-text" href="#multi-item-example" data-slide="prev"><i class="fa fa-angle-left fa-3x pr-3"></i></a>
                <a class="black-text" href="#multi-item-example" data-slide="next"><i class="fa fa-angle-right fa-3x pl-3"></i></a>
            </div>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/nvidia.png">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/amd.png">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/asus.png">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/corsair.png">
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/samsung.png">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/intel.png">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/kingston.png">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <div class="">
                            <img class="img-fluid" src="img/marcas/logitech.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>   
    <style type="text/css">
        @media (min-width: 768px) {
            .carousel-multi-item-2 .col-md-3 {
                float: left;
                width: 25%;
                max-width: 100%; } }

        .carousel-multi-item-2 .card img {
            border-radius: 2px; }
        </style>
        <!-- ---------------- Linha --------------  -->
        <hr>
        <!-- ---------- Card Computador-----------  -->
        <div class="container">
        <section class="text-center pb-1">
            <div class="row pt-5">
                <div class="col-lg-3 col-md-6 mb-r">
                    <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                        <div class="view overlay hm-white-slight">
                            <div class="card-header">
                                <h4 class="my-0 font-weight-normal clrd-font">Computador</h4>
                            </div> 
                            <img src="img/iconesindex/computador.png" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                            <a href="#" class="btn btn-sm btn-outline-secondary" style="border-color: #04A3FF;">Todos os modelos</a>
                        </div>
                        <span class=" mt-3"></span>
                    </div>
                </div>
            <c:forEach items="${ctrl_prod.listarProdutos(1,3)}" var="prod">
                <c:if test="${prod != null}">
                    <div class="col-lg-3 col-md-6 mb-r">
                        <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                            <div class="view overlay hm-white-slight">
                                <div class="card-header">
                                    <h4 class="my-0 font-weight-normal clrd-font">${prod.nome}</h4>
                                </div> 
                                <img src="img/produtos/${prod.foto1}" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                                <a href="index.jsp?acao=detalhes&id=${prod.id}" class="btn btn-sm btn-outline-secondary" style="border-color: #04A3FF;">Saiba mais</a>
                            </div>
                            <span class=" mt-3"></span>
                        </div>
                    </div>
                </c:if>
            </c:forEach>                           
        </div>
    </section>
</div>

<!-- ---------- Card Notebook -----------  -->
<div class="container">
    <section class="text-center pb-1">
        <div class="row pt-5">
            <div class="col-lg-3 col-md-6 mb-r">
                <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                    <div class="view overlay hm-white-slight">
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal clrd-font">Notebook</h4>
                        </div> 
                        <img src="img/iconesindex/laptop.png" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                        <a href="#" class="btn btn-sm btn-outline-secondary"style="border-color: #04A3FF;">Todos os modelos</a>
                    </div>
                    <span class=" mt-3"></span>
                </div>
            </div>
            <c:forEach items="${ctrl_prod.listarProdutos(2,3)}" var="prod">
                <c:if test="${prod != null}">
                    <div class="col-lg-3 col-md-6 mb-r">
                        <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                            <div class="view overlay hm-white-slight">
                                <div class="card-header">
                                    <h4 class="my-0 font-weight-normal clrd-font">${prod.nome}</h4>
                                </div> 
                                <img src="img/produtos/${prod.foto1}" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                                <a href="index.jsp?acao=detalhes&id=${prod.id}" class="btn btn-sm btn-outline-secondary" style="border-color: #04A3FF;">Saiba mais</a>
                            </div>
                            <span class=" mt-3"></span>
                        </div>
                    </div>
                </c:if>
            </c:forEach>                             
        </div>
    </section>
</div>
<!-- ---------- Card Teclado-----------  -->
<div class="container">
    <section class="text-center pb-1">
        <div class="row pt-5">
            <div class="col-lg-3 col-md-6 mb-r">
                <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                    <div class="view overlay hm-white-slight">
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal clrd-font">Teclado</h4>
                        </div> 
                        <img src="img/iconesindex/keyboard.png" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                        <a href="#" class="btn btn-sm btn-outline-secondary" style="border-color: #04A3FF;">Todos os modelos</a>
                    </div>
                    <span class=" mt-3"></span>
                </div>
            </div>
            <c:forEach items="${ctrl_prod.listarProdutos(3,3)}" var="prod">
                <c:if test="${prod != null}">
                    <div class="col-lg-3 col-md-6 mb-r">
                        <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                            <div class="view overlay hm-white-slight">
                                <div class="card-header">
                                    <h4 class="my-0 font-weight-normal clrd-font">${prod.nome}</h4>
                                </div> 
                                <img src="img/produtos/${prod.foto1}" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                                <a href="index.jsp?acao=detalhes&id=${prod.id}" class="btn btn-sm btn-outline-secondary" style="border-color: #04A3FF;">Saiba mais</a>
                            </div>
                            <span class=" mt-3"></span>
                        </div>
                    </div>
                </c:if>
            </c:forEach>                           
        </div>
    </section>
</div>

<!-- ---------- Card Mouse -----------  -->
<div class="container">
    <section class="text-center pb-1">
        <div class="row pt-5">
            <div class="col-lg-3 col-md-6 mb-r">
                <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                    <div class="view overlay hm-white-slight">
                        <div class="card-header">
                            <h4 class="my-0 font-weight-normal clrd-font2">Mouse</h4>
                        </div> 
                        <img src="img/iconesindex/mouse.png" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                        <a href="#" class="btn btn-sm btn-outline-secondary" style="border-color: #04A3FF;">Todos os modelos</a>
                    </div>
                    <span class=" mt-3"></span>
                </div>
            </div>

            <c:forEach items="${ctrl_prod.listarProdutos(4,3)}" var="prod">
                <c:if test="${prod != null}">
                    <div class="col-lg-3 col-md-6 mb-r">
                        <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                            <div class="view overlay hm-white-slight">
                                <div class="card-header">
                                    <h4 class="my-0 font-weight-normal clrd-font">${prod.nome}</h4>
                                </div> 
                                <img src="img/produtos/${prod.foto1}" class="img-fluid pt-5" style="width: 180px; height: auto;"><p></p>
                                <a href="index.jsp?acao=detalhes&id=${prod.id}" class="btn btn-sm btn-outline-secondary" style="border-color: #04A3FF;">Saiba mais</a>
                            </div>
                            <span class=" mt-3"></span>
                        </div>
                    </div>
                </c:if>
            </c:forEach>                            
        </div>
    </section>
</div>
<!-- ----------------- Linha -----------------  -->
<hr style="margin-top: 120px;">
<!-- ---------- Galeria -----------  -->
<div class="container-fluid pt-5 d-none d-lg-block">
    <div class="row">
        <c:forEach items="${ctrl_prod.listarProdutos(1,4)}" var="prod">
            <div class="col-md-3 col-sm-4 col-xs-12 single_portfolio_text">
                <img src="img/produtos/${prod.foto1}" alt="" class="d-block mx-auto" style="width : 50%; height: auto;"/>
                <div class="portfolio_images_overlay text-center">
                    <h2 class="clrd-font">${prod.nome}</h2>
                    <p class="clrd-font pt-2">${prod.descricao}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- ----------------- Linha -----------------  -->
<hr style="margin-top: 40px;">
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