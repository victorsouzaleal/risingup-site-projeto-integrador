<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="ctrl_prod" class="controller.CtrlProduto"/>
<jsp:useBean id="ctrl_cat" class="controller.CtrlCategoria"/>
<c:set var="prod" value="${ctrl_prod.buscarProduto(param.id)}"></c:set>
    <div class="row mt-5" style="margin-bottom: 100px;">
        <div class="col-md-6 offset-md-3 p-4 fundoverm px-3 py-3" style="border-radius: 10px;">
            <form id="formcadastro_prod" method="post" role="form" enctype="multipart/form-data" action="../sys" autocomplete="off">
                <h1 class="text-center">Edição de Produtos</h1>
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="logica" value="Produto_Log">
                <input type="hidden" name="idprod" value="${param.id}">
            <div class="form-group">
                <label for="">Nome</label>
                <input class="form-control" type="text" name="nome" placeholder="Nome do Produto" value="${prod.nome}">
            </div>
            <div class="form-group">
                <label for="">Descricao</label>
                <input class="form-control" type="text" name="descricao" placeholder="Descricao do Produto" value="${prod.descricao}">
            </div>
            <div class="form-group">
                <label for="">Quantidade</label>
                <input class="form-control" type="number" name="qtd" placeholder="Quantidade" value="${prod.quant}">
            </div>
            <div class="form-group">
                <label for="">Preco</label>
                <input class="form-control" type="text" name="preco" placeholder="Preco do Produto" value="${prod.preco}">
            </div>
            
            <div class="form-group">
                <label for="">Categoria</label>
                <select name="cat">
                    <c:forEach items="${ctrl_cat.buscarCategorias()}" var="cats">
                        <c:if test="${prod.categoria.id == cats.id}">
                            <option value="${cats.id}" selected="true">${cats.nome}</option>
                        </c:if>
                        <c:if test="${prod.categoria.id != cats.id}">
                            <option value="${cats.id}">${cats.nome}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="" class="mr-3">Ativo</label>
                <c:if test="${prod.ativo == true}">
                    <input type="radio" name="ativo" value="v" checked="checked"> SIM
                    <input type="radio" name="ativo" value="f"> NAO  
                </c:if>
                <c:if test="${prod.ativo != true}">
                    <input type="radio" name="ativo" value="v"> SIM
                    <input type="radio" name="ativo" value="f" checked="checked"> NAO  
                </c:if>
            </div>
            <h3>Fotos Atuais</h3>
            <div class="row my-5">
                <div class="col-md-4">
                    <img src="<c:url value="../img/produtos/${prod.foto1}"/>" class="img-fluid"/>
                </div>
                <c:if test="${not empty prod.foto2}">
                    <div class="col-md-4">
                        <img src="<c:url value="../img/produtos/${prod.foto2}"/>" class="img-fluid"/>
                    </div>
                </c:if>
                <c:if test="${not empty prod.foto3}">
                    <div class="col-md-4">
                        <img src="<c:url value="../img/produtos/${prod.foto3}"/>" class="img-fluid"/>
                    </div>
                </c:if>
            </div>

            <div class="form-group">
                <label for="">Foto 1</label>
                <input class="form-control" type="file" name="foto1" value="${prod.foto1}">
            </div>

            <div class="form-group">
                <label for="">Foto 2</label>
                <input class="form-control" type="file" name="foto2" value="${prod.foto2}">
            </div>
            <div class="form-group">
                <label for="">Foto 3</label>
                <input class="form-control" type="file" name="foto3" value="${prod.foto3}">
            </div>

            <input type="submit" class="btn btn-dark w-100" name="cad_prod" value="Editar">
        </form>
    </div>
</div>
