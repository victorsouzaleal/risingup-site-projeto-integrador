<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_prod" class="controller.CtrlProduto"/>
<jsp:useBean id="ctrl_cat" class="controller.CtrlCategoria"/>
<c:set value="${param.id}" var="id_cat"></c:set>
<c:set value="${ctrl_prod.listarProdutos(id_cat)}" var="prod"></c:set>       
<c:set value="${ctrl_cat.buscarCategoria(id_cat)}" var="cat"></c:set>       
    <!-- ---------- Card Computador-----------  -->
    <div class="container" style="margin-bottom: 20%; margin-top: 150px;">
        <a href="index.jsp" class="d-inline-block"><h4 class="d-inline-block clrd-font">Inicio</h4></a><h4 class="d-inline-block ml-2"> -> Categoria : ${cat.nome}</h4>
    <hr>
    <section class="text-center pb-1">
        <div class="row pt-5">
            <c:forEach items="${prod}" var="produto">
                <div class="col-lg-3 col-md-6 mb-r mb-3">
                    <div class="card card-cascade narrower" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                        <div class="view overlay hm-white-slight">
                            <img src="img/produtos/${produto.foto1}" class="img-fluid pt-2" style="width: 180px; height: auto;"><p></p>
                            <p>${produto.nome}</p>
                            <p class="clrd-font2" style="font-size: 18px; font-weight: 600;">R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" currencySymbol="R$">${produto.preco}</fmt:formatNumber></p>
                            <a href="index.jsp?acao=detalhes&id=${produto.id}" class="btn btn-sm btn-outline-secondary px-5">Saiba Mais</a>
                        </div>
                        <span class=" mt-3"></span>
                    </div>
                </div>
            </c:forEach>                                                     
        </div>
    </section>

</div>
