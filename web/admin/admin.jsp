<%-- 
    Document   : admin
    Created on : 28/08/2018, 08:41:22
    Author     : Casa
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ctrl_cli" class="controller.CtrlCliente"/>

<c:if test="${cliente == null || ctrl_cli.isAutorizado(cliente) == false}">
    <script>window.location.href = "index.jsp"</script>
</c:if>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <title>ADMIN</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Painel Admin</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Gerenciar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="admin.jsp?acao=lista_prod">Produtos</a>
                                <a class="dropdown-item" href="admin.jsp?acao=lista_cli">Usuarios</a>
                                <a class="dropdown-item" href="#">Pedidos</a>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="../index.jsp">Voltar ao site</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="../Admin?action=off">Sair</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <c:import url="../paginas/alertas.jsp"></c:import>
            <section id="conteudo">
            <c:choose>
                <c:when test="${param.acao == 'cad_produto'}">
                    <c:import url="paginas/formCadastroProd.html"></c:import>
                </c:when>
                <c:when test="${param.acao == 'lista_prod'}">
                    <c:import url="paginas/TabelaProdutos.jsp"></c:import>
                </c:when>
                <c:when test="${param.acao == 'lista_cli'}">
                    <c:import url="paginas/TabelaClientes.jsp"></c:import>
                </c:when>
                <c:when test="${param.acao == 'edit_user'}">
                    <c:import url="paginas/formEditarUsuario.jsp"></c:import>
                </c:when>
                <c:when test="${param.acao == 'edit_prod'}">
                    <c:import url="paginas/formEditarProduto.jsp"></c:import>
                </c:when>
                <c:otherwise>
                    <div class="container text-center mt-5">
                        <button class="btn btn-success"><a href="admin.jsp?acao=cad_produto" style="text-decoration: none; color: #fff;">Cadastro de Produtos</a></button>
                        <button class="btn btn-success"><a href="admin.jsp?acao=lista_prod" style="text-decoration: none; color: #fff;">Relatório de Produtos</a></button>
                        <button class="btn btn-success"><a href="admin.jsp?acao=lista_cli" style="text-decoration: none; color: #fff;">Relatório de Clientes</a></button>
                    </div>
                </c:otherwise>
            </c:choose>
        </section>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="../js/jquery-ui.structure.min.css">
        <link rel="stylesheet" href="../js/jquery-ui.theme.min.css">
        <script src="../js/datepicker.js"></script>
    </body>
</html>
