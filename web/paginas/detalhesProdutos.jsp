<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_prod" class="controller.CtrlProduto"/>
<c:set value="${param.id}" var="id_produto"></c:set>
<c:set value="${ctrl_prod.buscarProduto(id_produto)}" var="prod"></c:set>


    <!-- Produto -->
    <div class="container" style="margin-top: 150px; margin-bottom: 5%;">
        <div class="row">
            <div class="col-md-7 order-md-2 mb-4">
                <div class="card text-center">
                    <div class="card-header">
                    ${prod.nome}
                </div>
                <div class="card-body">
                    <h5 class="card-title">${prod.nome_detalhado}</h5>
                    <h2>R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" currencySymbol="R$">${prod.preco}</fmt:formatNumber></h2>
                        <hr>
                        <h2>12x de R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" currencySymbol="R$">${prod.preco/12}</fmt:formatNumber></h2>
                    <p class="card-text">Total R$ <fmt:formatNumber minFractionDigits="2" currencySymbol="R$">${prod.preco}</fmt:formatNumber></p>
                        <p class="card-text">Parcelas sem juros nos cartoes de credito.</p>
                    </div>
                    <div>
                        <form action="sys">
                            <input type="hidden" name="prod_id" value="${id_produto}">
                        <input type="hidden" name="logica" value="Carrinho">
                        <input type="hidden" name="action" value="adicionar">
                        <input  type="hidden" name="prod_qtd" value="1" />
                        <button class="btn px-5 btn-outline-secondary">Comprar</button>
                    </form> 
                </div>
                <span class="pt-5"></span>
            </div>
        </div>

        <!-- Imagens do produto -->
        <div class="col-md-5 order-md-1">
            <div class="card text-center">
                <div class="card-body">
                    <!-- Container for the image gallery -->
                    <div class="container">
                        <!-- Full-width images with number text -->
                        <div class="mySlides text-center">
                            <div class="numbertext">1 / 3</div>
                            <img src="img/produtos/${prod.foto1}" style="width:70%">
                        </div>

                        <c:if test="${not empty prod.foto2}">
                            <div class="mySlides text-center">
                                <div class="numbertext">2 / 3</div>
                                <img src="img/produtos/${prod.foto2}" style="width:70%">
                            </div>
                        </c:if>

                        <c:if test="${not empty prod.foto3}">
                            <div class="mySlides text-center">
                                <div class="numbertext">3 / 3</div>
                                <img src="img/produtos/${prod.foto3}" style="width:70%">
                            </div>
                        </c:if>

                        <!-- Next and previous buttons -->
                        <a class="prev" style="float:left" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>

                        <!-- Image text -->
                        <p class="pt-4"></p>

                        <!-- Thumbnail images -->
                        <div class="row">
                            <div class="column col-4">
                                <img class="demo cursor border" src="img/produtos/${prod.foto1}" style="width:100%" onclick="currentSlide(1)" >
                            </div>
                            <c:if test="${not empty prod.foto2}">
                                <div class="column col-4"> 
                                    <img class="demo cursor border" src="img/produtos/${prod.foto2}" style="width:100%" onclick="currentSlide(2)" >
                                </div>
                            </c:if>
                            <c:if test="${not empty prod.foto3}">
                                <div class="column col-4">
                                    <img class="demo cursor border" src="img/produtos/${prod.foto3}" style="width:100%" onclick="currentSlide(3)">
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <p style="margin-top: 100px;"></p>

    <!-- Descricão do produto -->
    <div class="card mb-5">
        <div class="card-header">
            Ficha técnica
        </div>
        <div class="card-body">
            <div class="card-text">
                ${prod.especificacao}
                <script type="text/javascript">
                    var tb = document.querySelector("table");
                    tb.setAttribute("class", "table");
                </script>
            </div>
        </div>
    </div>


    <h3 class="text-left">Produtos semelhantes</h3>  
    <hr>
    <!-- ---------- Produtos Semelhantes-----------  -->
    <div class="container">
        <section class="text-center pb-1">                                      
            <div class="row pt-5">                           
                <c:forEach items="${ctrl_prod.produtosSemelhantes(prod.categoria.id, 4, prod.id)}" var="prod_sem">
                    <div class="col-lg-3 col-md-6 mb-r mb-2">
                        <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                            <div class="view overlay hm-white-slight">
                                <img src="img/produtos/${prod_sem.foto1}" class="img-fluid pt-2" style="width: 180px; height: auto;"><p></p>
                                <a href="index.jsp?acao=detalhes&id=${prod_sem.id}" class="btn btn-sm btn-outline-secondary px-5">Saiba mais</a>
                            </div>
                            <span class=" mt-3"></span>
                        </div>
                    </div>
                </c:forEach>                        
            </div>
        </section>
    </div>
</div>


<style>
    .table {
        width: 100%!important;
        height: auto!important;
        border: 0px;
    }

    * {
        box-sizing: border-box;
    }

    /* Position the image container (needed to position the left and right arrows) */
    .container {
        position: relative;
    }

    /* Hide the images by default */
    .mySlides {
        display: none;
    }

    /* Add a pointer when hovering over the thumbnail images */
    .cursor {
        cursor: pointer;
    }

    /* Next & previous buttons */
    .prev{
        cursor: pointer;
        position: absolute;
        top: 40%;
        left: 0;
        width: auto;
        padding: 16px;
        margin-top: -50px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        border-radius: 0 3px 3px 0;
        user-select: none;
        -webkit-user-select: none;
    }

    .next {
        cursor: pointer;
        position: absolute;
        top: 40%;
        width: auto;
        padding: 16px;
        margin-top: -50px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        border-radius: 0 3px 3px 0;
        user-select: none;
        -webkit-user-select: none;
    }

    /* Position the "next button" to the right */
    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    /* On hover, add a black background color with a little bit see-through */
    .prev:hover,
    .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    /* Number text (1/3 etc) */
    .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
    }

    /* Container for image text */
    .caption-container {
        text-align: center;
        background-color: #222;
        padding: 2px 16px;
        color: white;
    }

    .row:after {
        content: "";
        display: table;
        clear: both;
    }

    /* Six columns side by side */
    .column {
        float: left;
        width: 16.66%;
    }

    /* Add a transparency effect for thumnbail images */
    .demo {
        opacity: 0.6;
    }

    .active,
    .demo:hover {
        opacity: 1;
    }
</style>


<script type="text/javascript">
    var slideIndex = 1;
    showSlides(slideIndex);

    // Next/previous controls
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    // Thumbnail image controls
    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        captionText.innerHTML = dots[slideIndex - 1].alt;
    }
</script>
