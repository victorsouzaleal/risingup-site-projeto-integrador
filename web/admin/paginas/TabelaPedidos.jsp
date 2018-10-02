<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row mt-5" style="margin-bottom: 20%">
    <div class="col-8 offset-2">
        <h1 class="text-center">Lista de Pedidos</h1> 
        <div class="text-center">
            <form id="busca" class=" mb-2 mt-1" action="../sys">
                <input type="hidden" name="logica" value="Pedido_Log">
                <input type="hidden" name="action" value="buscar">
                <div class="form-group">
                    <button name="b_botao" class="btn btn-outline-dark text-white d-inline-block mb-2 mt-1">Buscar</button>
                </div>
            </form>
        </div>
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Data</th>
                    <th scope="col">Subtotal</th>
                    <th scope="col">Frete</th>
                    <th scope="col">Total</th>
                    <th scope="col">Status</th>
                    <th scope="col">Acao</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pedidos}" var="pedido">
                    <tr>
                        <th scope="row">${pedido.id}</th>
                        <td><fmt:formatDate type="date" value="${pedido.dataPedido.time}"></fmt:formatDate></td>
                        <td>${pedido.valor}</td>
                        <td>${pedido.frete}</td>
                        <td>${pedido.total}</td>
                        <td>
                            <c:if test="${pedido.pago == true}"><h5 class="text-success">Pago</h3></c:if>
                            <c:if test="${pedido.pago != true}"><h5 class="text-warning">Em análise</h3></c:if>
                        </td>
                        <td><a href="../sys?logica=Pedido_Log&action=alt_status&id=${pedido.id}">Alterar Status</a></td>
                    </tr>
                </c:forEach>   
            </tbody>
        </table>
        <c:remove var="pedidos" scope="session"></c:remove>
    </div>
</div>

