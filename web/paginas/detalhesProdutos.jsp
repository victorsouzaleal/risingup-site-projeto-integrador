<%-- 
    Document   : detalhesProdutos
    Created on : 30/08/2018, 10:44:22
    Author     : Casa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_prod" class="controller.CtrlProduto"/>
<c:set value="${param.id}" var="id_produto"></c:set>
<c:set value="${ctrl_prod.buscarProduto(id_produto)}" var="prod"></c:set>

    <section class="container mt-3 px-0 py-3" id="descricao"> <!-- ################ INICIO SECAO OFERTAS ############# -->
        <div class="row">
            <div class="col-md-4">
                <div class="col-md-12 mb-3">
                    <img src="<c:url value="img/produtos/${prod.foto1}" />" class="img-fluid"/>
            </div>
            <c:if test="${not empty prod.foto2}">
                <div class="col-md-12 mb-3">
                    <img src="<c:url value="img/produtos/${prod.foto2}" />" class="img-fluid"/>
                </div>
            </c:if>
            <c:if test="${not empty prod.foto3}">
                <div class="col-md-12 mb-3">
                    <img src="<c:url value="img/produtos/${prod.foto3}" />" class="img-fluid"/>
                </div>
            </c:if>
        </div>
        <div class="col-md-8 text-center">
            <h1 class="mb-3">${prod.nome}</h1>
            <h4 class="mb-5">${prod.descricao}</h4>
            <h3 class="mb-5">Preço: R$<fmt:formatNumber minFractionDigits="2" currencySymbol="R$">${prod.preco}</fmt:formatNumber></h3>
            <form action="Carrinho">
                <input type="hidden" name="prod_id" value="${id_produto}">
                <input type="hidden" name="action" value="adicionar">
                <label>Quantidade :</label>
                <input  name="prod_qtd" value="1" id="spinner"/>
                <button class="btn btn-success">Adicionar ao Carrinho</button>
            </form>       
        </div>
    </div>
</section>
