<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row mt-5" style="margin-bottom: 20%">
    <div class="col-8 offset-2">
        <h1 class="text-center">Lista de Produtos</h1> 
        <div class="text-center">
            <form id="busca" class=" mb-2 mt-1" action="../Produto?action=buscar" method="POST">
                <div class="form-group">
                    <input name="b_nome" class="form-control d-inline-block" type="text" style="width: 200px"/>
                    <button name="b_botao" class="btn btn-info d-inline-block mb-2 mt-1">Buscar</button>
                </div>
                <div class="form-group">
                    <input type="radio" name="tipo" value="1" checked=""> Nome
                    <input type="radio" name="tipo" value="2"> Descricao
                    <input type="radio" name="tipo" value="3"> Recentes
                </div>
            </form>
            <button class="btn btn-success mb-2 mt-1"><a href="admin.jsp?acao=cad_produto" style="text-decoration: none; color: #fff;">Adicionar Produto</a></button>
        </div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Descrição</th>
                    <th scope="col">Qtd</th>
                    <th scope="col">Preço</th>
                    <th scope="col">Status</th>
                    <th scope="col">Foto 1</th>
                    <th scope="col">Acao</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${b_resultado}" var="prod">
                    <tr>
                        <th scope="row">${prod.id}</th>
                        <td>${prod.nome}</td>
                        <td>${prod.descricao}</td>
                        <td>${prod.quant}</td>
                        <td>${prod.preco}</td>
                        <td>
                            <c:if test="${prod.ativo == true}">Ativo</c:if>
                            <c:if test="${prod.ativo != true}">Desativado</c:if>       
                            </td>
                            <td><img style="width: 200; height: 120px;"src='<c:url value='../img/produtos/${prod.foto1}'/>'/></td>
                        <td><a href="#">Editar</a> <a href="#">Remover</a></td>
                    </tr>
                </c:forEach>   
            </tbody>
        </table>
        <c:remove var="b_resultado" scope="session"></c:remove>
    </div>
</div>

