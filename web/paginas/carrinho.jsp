<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${total == null}">
    <c:set scope="request" var="subtotal" value="0"></c:set>
</c:if>
<c:if test="${total != null}">
    <c:set scope="request" var="subtotal" value="${total}"></c:set>
</c:if>

<div class="container" style="margin-top:10%; margin-bottom: 20%;">
    <c:if test="${empty carrinho}">
        <h2 class="text-center">Seu carrinho atualmente está vazio.</h2>
        <h2 class="text-center clrd-font"><a href="index.jsp">Ir ás compras</a></h2>
    </c:if>
    <c:if test="${not empty carrinho}">
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">          
                <div class="card text-center">               
                    <div class="card-header">
                        <big>Seu carrinho</big>
                    </div>        
                    <div class="card-body">
                        <h5>Subtotal <small><f:formatNumber minFractionDigits="2" currencySymbol="R$">${subtotal}</f:formatNumber></small></h5><p></p>
                            <hr>
                            <h5>Frete : <small> R$ 50,00</small></h5><p></p>
                            <hr>
                            <h5 class="card-title">Total</h5>
                            <strong class="card-text"><f:formatNumber minFractionDigits="2" currencySymbol="R$">${subtotal + frete}</f:formatNumber> <small> Á€ vista no boleto </small></strong><p></p>
                        <small> Ou em 12x de R$ <f:formatNumber maxFractionDigits="2" minFractionDigits="2" currencySymbol="R$">${(subtotal + frete)/12}</f:formatNumber> sem juros no cartão</small></strong>    
                        </div>
                        <div>
                            <form action="sys" style="display: inline-block">
                                <input type="hidden" name="action" value="confirmar"/>
                                <input type="hidden" name="logica" value="Pedido_Log"/>
                                <button class="btn px-5 btn-outline-secondary">Finalizar Pedido</button>
                            </form>
                        </div>
                        <span class="pt-4"></span>
                    </div>
                </div>

                <div class="col-md-8 order-md-1">
                    <div class="card">
                        <div class="card-header">
                            <big>Seu carrinho</big>
                        </div>
                        <div class="card-body">
                        <c:forEach items="${carrinho}" var="item">
                            <div class="row">
                                <div class="col-md-2">
                                    <img class="img-fluid" style="width: 100px;" src="img/produtos/${item.produto.foto1}">
                                </div> 
                                <div class="col-md-4">
                                    <strong class="card-text">${item.produto.nome} <p><small>${item.produto.nome_detalhado}</small></strong>
                                </div>  

                                <div class="col-md-4">
                                    <label for="staticEmail" class="col-sm-9 col-form-label"><strong>Quantidade</strong></label>
                                    <div class="ml-4">
                                        <form name="alterar${item.produto.id}" action="sys">
                                            <input type="hidden" name="action" value="alterar_qtd"/>
                                            <input type="hidden" name="logica" value="Carrinho"/>
                                            <input type="hidden" name="id" value="${item.produto.id}"/>
                                            <input class="form-control col-4" type="number" name="qtd" value="${item.quant}" id="example-number-input" onchange="document.alterar${item.produto.id}.submit();">
                                        </form>  
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <button type="button ml-4" style="color: #FF0000; position: relative; top: 0;"  class="close" aria-label="Close">
                                        <a href="sys?logica=Carrinho&action=remover&iditem=${item.produto.id}" style="text-decoration: none; color: red"><span aria-hidden="true">&times;</span></a>
                                    </button>
                                    <strong class="card-text">Valor <p></p></strong><small> R$ <f:formatNumber minFractionDigits="2" currencySymbol="R$">${item.valorItens}</f:formatNumber></small>
                                    </div>
                                </div>
                                <hr>
                        </c:forEach>
                    </div>
                    <a class="text-muted ml-4" href="#">&larr; Escolher mais produtos</a>
                    <span class="pt-4"></span>
                </div>
            </div>
        </div>
    </c:if>
</div>

