<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row mt-5" style="margin-bottom: 20%">
    <div class="col-8 offset-2">
        <form action="Pedido" style="display: inline-block">
            <input type="hidden" name="action" value="confirmar"/>
            <button class="btn btn-success">Finalizar Pedido</button>
        </form>
        <form action="Carrinho" style="display: inline-block">
            <input type="hidden" name="action" value="apagar"/>
            <button class="btn btn-danger">Apagar Carrinho</button>
        </form>
        <table class="table table-light">
            <thead>
            <h1 class="text-center">Carrinho</h1>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Descrição</th>
                <th scope="col">Qtd</th>
                <th scope="col">Preço</th>
                <th scope="col">Ação</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${carrinho}" var="item">
                    <tr>
                        <th scope="row">${item.produto.id}</th>
                        <td>${item.produto.nome}</td>
                        <td>${item.produto.descricao}</td>
                        <td>
                            <form name="alterar${item.produto.id}" action="Carrinho">
                                <input type="hidden" name="action" value="alterar_qtd"/>
                                <input type="hidden" name="id" value="${item.produto.id}"/>
                                <input type="number" name="qtd" value="${item.quant}" onchange="document.alterar${item.produto.id}.submit();">
                            </form>                             
                        </td>
                        <td>R$<f:formatNumber minFractionDigits="2" currencySymbol="R$">${item.valorItens}</f:formatNumber></td>
                        <td><a href="Carrinho?action=remover&iditem=${item.produto.id}">Remover</a></td>
                        </tr>
                </c:forEach>   
            </tbody>
        </table>
        <h1 class="text-center text-success">TOTAL :
            <c:if test="${total == null}">R$ 0,00</c:if>
            <c:if test="${total != null}">R$<f:formatNumber minFractionDigits="2" currencySymbol="R$">${total}</f:formatNumber></c:if>
        </h1>
    </div>
</div>