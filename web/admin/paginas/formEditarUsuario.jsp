<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="user" class="controller.CtrlCliente"/>
<c:set var="usuario" value="${user.buscaCliente(param.iduser)}"></c:set>

<div class="container">
    <form id="formcadastro" method="POST" role="form"  enctype="multipart/form-data" action="../sys"  autocomplete="off">
        <div class="row mt-5" style="margin-bottom: 100px;">
            <div class="col-md-6">
                <h1 class="text-center">Dados Pessoais</h1>
                <input type="hidden" name="iduser" value="${param.iduser}">
                <input type="hidden" name="logica" value="User">
                <div class="form-group">
                    <label for="">Nome</label>
                    <input class="form-control" type="text" name="nome" placeholder="Digite seu nome" value="${usuario.nome}">
                </div>
                <div class="form-group">
                    <label for="">Data de Nascimento</label>
                    <input class="form-control" type="text" name="data" id="datepicker" value="<fmt:formatDate type="date" value="${usuario.dataNasc.time}"></fmt:formatDate>">
                </div>

                <div class="form-group">
                    <label for="">Email</label>
                    <input class="form-control" type="text" name="email" placeholder="Digite seu email" value="${usuario.email}">
                </div>

                <div class="form-group">
                    <label for="">Senha</label>
                    <input class="form-control" type="password" name="pws" placeholder="Digite sua senha" value="${usuario.pws}">
                </div>
                
                <div class="form-group">
                    <label for="">Confirmar Senha</label>
                    <input class="form-control" type="password" name="confpws" placeholder="Digite novamente sua senha" value="${usuario.pws}">
                </div>  
                
                <div class="form-group">
                    <label for="">Tipo: </label>
                    <c:if test="${usuario.admin == true}">
                        <input type="radio" name="tipo" value="0"> Cliente
                        <input type="radio" name="tipo" value="1" checked=""> Administrador
                    </c:if>
                    <c:if test="${usuario.admin == false}">
                        <input type="radio" name="tipo" value="0" checked=""> Cliente
                        <input type="radio" name="tipo" value="1"> Administrador
                    </c:if>   
                </div>
                
                <div class="form-group">
                    <label for="">Status: </label>
                    <c:if test="${usuario.ativo == true}">
                        <input type="radio" name="ativo" value="1" checked=""> Sim
                        <input type="radio" name="ativo" value="0" > Não
                    </c:if>
                    <c:if test="${usuario.ativo == false}">
                        <input type="radio" name="ativo" value="1" > Sim
                        <input type="radio" name="ativo" value="0" checked=""> Não
                    </c:if>   
                </div>
 
            </div>
            <div class="col-md-6">
                <h1 class="text-center">Endereco</h1>
                <div class="form-group">
                    <label for="">CEP</label>
                    <input class="form-control" type="text" id="cep" onblur="pesquisacep(this.value)" name="cep" value="${usuario.endereco.cep}">
                </div>
                <div class="form-group">
                    <label for="">Rua</label>
                    <input class="form-control" type="text" id="rua" name="rua" readonly="" value="${usuario.endereco.logradouro}">
                </div>

                <div class="form-group">
                    <label for="">Bairro</label>
                    <input class="form-control" type="text" id="bairro" name="bairro" readonly="" value="${usuario.endereco.bairro}">
                </div>

                <div class="form-group">
                    <label for="">Cidade</label>
                    <input class="form-control" type="text" id="cidade" name="cidade" readonly="" value="${usuario.endereco.cidade}" >
                </div>
                <div class="form-group">
                    <label for="">UF</label>
                    <input class="form-control" type="text" id="uf" name="uf" readonly="" value="${usuario.endereco.uf}">
                </div>

                <div class="form-group">
                    <label for="">Numero</label>
                    <input class="form-control" type="txt" name="num" value="${usuario.numero}">
                </div>

                <div class="form-group">
                    <label for="">Complemento</label>
                    <input class="form-control" type="text" name="comp" value="${usuario.complemento}">
                </div>
            </div>        
            <input type="submit" class="btn btn-dark w-100" name="cadastrar"  value="Editar">
        </div>
    </form>
</div>
<script src="../js/ceps.js"></script>

