<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_ped" class="controller.CtrlPedido"/>

<div class="row" style="margin-bottom: 20% ; margin-top: 10%">
    <div class="col-8 offset-2">
        <h1 class="text-center">Meus Pedidos</h1> 
        <div class="text-center">
        </div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">ID Pedido</th>
                    <th scope="col">Data do Pedido</th>
                    <th scope="col">Itens</th>
                    <th scope="col">Valor dos Produtos</th>
                    <th scope="col">Valor do Frete</th>
                    <th scope="col">Valor Total</th>
                    <th scope="col">Status</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ctrl_ped.buscarPedidoCliente(cliente)}" var="ped">
                    <tr>
                        <th scope="row">${ped.id}</th>
                        <td><fmt:formatDate type="date" value="${ped.dataPedido.time}"></fmt:formatDate></td>
                        <td><a href="#" data-toggle="modal" data-target="#exampleModal${ped.id}">Mostrar</a></td>
                        <td>R$<fmt:formatNumber minFractionDigits="2" currencySymbol="R$">${ped.valor}</fmt:formatNumber></td>
                        <td>R$<fmt:formatNumber minFractionDigits="2" currencySymbol="R$">${ped.frete}</fmt:formatNumber></td>
                        <td>R$<fmt:formatNumber minFractionDigits="2" currencySymbol="R$">${ped.total}</fmt:formatNumber></td>
                            <td>
                            <c:if test="${cli.pago == true}"><h6 class="text-success">Aprovado</h6></c:if>
                            <c:if test="${cli.pago != true}"><h6 class="text-warning">Em análise</h6></c:if>       
                            </td>
                        </tr>
                </c:forEach>      
            </tbody>
        </table>
        <c:remove var="ped"></c:remove>
        </div>
    </div>


<c:forEach items="${ctrl_ped.buscarPedidoCliente(cliente)}" var="ped">
    <!-- MODAL LISTA DE PRODUTOS -->    
    <div class="modal fade" id="exampleModal${ped.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Lista de Itens</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID Produto</th>
                                <th scope="col">Nome</th>
                                <th scope="col">Quantidade</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${ctrl_ped.buscaItensPorPedido(ped.id)}" var="item">
                                <tr>
                                    <th scope="row">${item.produto.id}</th>
                                    <td>${item.produto.nome}</td>
                                    <td>${item.quant}</td>
                                    <td>R$<fmt:formatNumber minFractionDigits="2" currencySymbol="R$">${item.valorItens}</fmt:formatNumber></td>
                                </tr>
                            </c:forEach>    
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</c:forEach>




