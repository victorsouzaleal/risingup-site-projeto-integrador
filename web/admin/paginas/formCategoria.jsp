<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_cat" class="controller.CtrlCategoria"/>
<c:if test="${param.id != null}">
    <c:set var="cat" value="${ctrl_cat.buscarCategoria(param.id)}"></c:set>
</c:if>

<div class="row mt-5" style="margin-bottom: 100px;">
    <div class="col-md-6 offset-md-3 p-4 fundoverm px-3 py-3" style="border-radius: 10px;">
        <form id="formcadastro_prod" method="post" role="form" enctype="multipart/form-data" action="../sys" autocomplete="off">
            <h1 class="text-center">Cadastro de Categorias</h1>
            <c:if test="${not empty cat}">
                <input type="hidden" name="action" value="edit">
            </c:if>
            <c:if test="${empty cat}">
                <input type="hidden" name="action" value="cad">
            </c:if>
            <input type="hidden" name="idcat" value="${param.id}">
            <input type="hidden" name="logica" value="Categoria_Log">
            <div class="form-group">
                <label for="">Nome</label>
                <input class="form-control" type="text" name="nome" placeholder="Nome da Categoria" value="${cat.nome}">
            </div>
            <div class="form-group">
                <label for="">Icone 1 (Pequeno - Navbar)</label>
                <input class="form-control" type="file" name="icone1">
            </div>

            <div class="form-group">
                <label for="">Icone 2 (Maior)</label>
                <input class="form-control" type="file" name="icone2">
            </div>

            <input type="submit" class="btn btn-dark w-100" name="cad_prod" value="Cadastrar">
        </form>
    </div>
</div>