<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row mt-5" style="margin-bottom: 20%">
    <div class="col-8 offset-2">
        <h1 class="text-center">Lista de Categorias</h1> 
        <div class="text-center">
            <form id="busca" class=" mb-2 mt-1" action="../sys">
                <input type="hidden" name="logica" value="Categoria_Log">
                <input type="hidden" name="action" value="buscar">
                <div class="form-group">
                    <input name="b_nome" class="form-control d-inline-block" type="text" style="width: 200px"/>
                    <button name="b_botao" class="btn btn-info d-inline-block mb-2 mt-1">Buscar</button>
                </div>
            </form>
            <button class="btn btn-success mb-2 mt-1"><a href="admin.jsp?acao=cad_cat" style="text-decoration: none; color: #fff;">Adicionar Categoria</a></button>
        </div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Acao</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${b_resultado}" var="cat">
                    <tr>
                        <th scope="row">${cat.id}</th>
                        <td>${cat.nome}</td>
                        <td><a href="admin.jsp?acao=edit_cat&id=${cat.id}">Editar</a> <a href="#">Remover</a></td>
                    </tr>
                </c:forEach>   
            </tbody>
        </table>
        <c:remove var="b_resultado" scope="session"></c:remove>
    </div>
</div>