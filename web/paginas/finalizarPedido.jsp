<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- SE O USUARIO TENTAR ACESSAR DIRETAMENTE SEM TER NADA NO CARRINHO -->
<c:if test="${empty total_geral || empty carrinho}">
    <script>window.location.href = "index.jsp";</script>    
</c:if>
<!-- ############################ -->        

<!-- CARREGAR AS INFORMAÇÕES DO PEDIDO AO RECARREGAR PAGINA -->
<form action="sys" name="confirmar">
    <input type="hidden" name="logica" value="Pedido_Log" />
    <input type="hidden" name="action" value="confirmar" />
</form>

<script>document.finalizar.submit()</script>        

<!-- ####################################################### -->

<div class="container" style="margin-top: 150px; margin-bottom: 20%">
    <div class="row">
        <div class="col-md-12 order-md-2 mb-4">          
            <div class="card text-center">             
                <div class="card-header">
                    <big>Finalizar Pedido</big>
                </div>
                <div class="card-body">
                    <strong>Endereço de entrega : <small> ${cliente.endereco.logradouro} - ${cliente.endereco.bairro} - ${cliente.endereco.cidade} - ${cliente.endereco.uf}</small></strong><p></p>
                    <strong>Complemento : <small> ${cliente.complemento} - ${cliente.numero}</small></strong><p></p>
                    <hr>
                    <strong>Valor do pedido : <small> R$ <f:formatNumber minFractionDigits="2" currencySymbol="R$">${total_pedido}</f:formatNumber></small></strong><p></p>
                    <strong>Frete : <small> R$ <f:formatNumber minFractionDigits="2" currencySymbol="R$">${frete_pedido}</f:formatNumber></small></strong><p></p>
                    <strong>Total <small> R$ <f:formatNumber minFractionDigits="2" currencySymbol="R$">${total_geral}</f:formatNumber></small></strong>
                    <hr>
                    <small>Está tudo de acordo?</small><a class="text-muted" href="index.jsp?acao=carrinho"><small> Caso não esteja, clique aqui</small></a>
                </div>
                <div>
                    <form action="sys">
                        <input type="hidden" name="action" value="finalizar" />
                        <input type="hidden" name="logica" value="Pedido_Log" />
                        <button class="btn px-5 btn-outline-secondary">Finalizar Pedido</button>
                    </form>
                </div>
                <span class="pt-4"></span>
            </div>
        </div>
    </div>
</div>

