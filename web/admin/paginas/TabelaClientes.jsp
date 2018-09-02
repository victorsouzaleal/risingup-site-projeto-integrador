<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="row mt-5" style="margin-bottom: 20%">
    <div class="col-8 offset-2">
        <h1 class="text-center">Lista de Clientes</h1> 
        <div class="text-center">
            <form id="busca" class="d-inline-block mb-2 mt-1" action="../Admin?action=buscar_cli" method="POST">
                <div class="form-group">
                    <input name="b_nome" class="form-control d-inline-block" type="text" style="width: 200px"/>
                    <button name="b_botao" class="btn btn-info d-inline-block mb-2 mt-1">Buscar</button>
                </div>
                <div class="form-group">
                    <input type="radio" name="tipo" value="1" checked=""> Nome
                    <input type="radio" name="tipo" value="2"> Email
                    <input type="radio" name="tipo" value="3"> CEP
                </div>
            </form>
        </div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Email</th>
                    <th scope="col">Data de Nascimento</th>
                    <th scope="col">CEP</th>
                    <th scope="col">Status</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Ação</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${b_resultado}" var="cli">
                    <tr>
                        <th scope="row">${cli.id}</th>
                        <td>${cli.nome}</td>
                        <td>${cli.email}</td>
                        <td><fmt:formatDate type="date" value="${cli.dataNasc.time}"></fmt:formatDate></td>
                        <td>${cli.endereco.cep}</td>
                        <td>
                            <c:if test="${cli.ativo == true}">Ativo</c:if>
                            <c:if test="${cli.ativo != true}">Desativado</c:if>       
                            </td>
                            <td>
                            <c:if test="${cli.admin == true}">Admin</c:if>
                            <c:if test="${cli.admin != true}">Membro</c:if>       
                            </td>
                            <td><a href="admin.jsp?acao=edit_user&iduser=${cli.id}">Editar</a> </td>
                        </tr>
                </c:forEach>   
            </tbody>
        </table>
        <c:remove var="b_resultado" scope="session"></c:remove>
    </div>
</div>

