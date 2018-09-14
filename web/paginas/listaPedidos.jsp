<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_ped" class="controller.CtrlPedido"/>

<div class="row" style="margin-bottom: 20% ; margin-top: 150px;">
    <div class="col-8 offset-2">
        <h1 class="text-left">Meus Pedidos</h1> 
        <hr>
        <div class="text-center">
        </div>
        <div class="table-responsive-md">
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
        </div>
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
                    <c:forEach items="${ctrl_ped.buscaItensPorPedido(ped.id)}" var="item">
                        <h5 class="text-center">${item.quant} x ${item.produto.nome}</h5>
                    </c:forEach>    
                </div>
            </div>
        </div>
    </div>
</c:forEach>




