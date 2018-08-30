<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="prod" class="controller.CtrlProduto"/>

<section class="container mt-3 px-0 py-3" id="produtos"> <!-- ################ INICIO SECAO OFERTAS ############# -->
    <h1 class="text-center mb-4">Pagina Inicial</h1>
    <div class="row">
        <c:forEach items="${prod.listarProdutos()}" var="prod">
            <div class="col-md-4 mb-2">
                <div class="card">
                    <img class="card-img-top px-4 py-4" src="<c:url value="img/produtos/${prod.foto1}" /> " alt="">                      
                    <div class="card-body">
                        <h4 class="card-title">${prod.nome}</h4>
                        <p class="card-text">${prod.descricao}</p>
                        <p class="card-text">Preço: <f:formatNumber minFractionDigits="2" currencySymbol="R$">${prod.preco}</f:formatNumber></p>
                        
                        <!-- VER DETALHES DO PRODUTO -->    
                        <form style="display: inline-block;" method="GET">
                            <input type="hidden" name="id" value="${prod.id}"/>                       
                            <input  type="hidden" name="acao" value="detalhes"/>                       
                            <button class="btn btn-info">Detalhes</button>
                        </form>
                            
                        <!-- Adicionando o produto no carrinho de compras -->
                        <form style="display: inline-block;" action="Carrinho" method="POST">
                            <input type="hidden" name="prod_id" value="${prod.id}"/>                       
                            <input  type="hidden" name="action" value="adicionar"/>                       
                            <input type="hidden" class="qtde" name="prod_qtd" value="1"/>
                            <button class="btn btn-success">Adicionar ao Carrinho</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section> <!-- ################## FIM SECAOO OFERTAS ################ -->
