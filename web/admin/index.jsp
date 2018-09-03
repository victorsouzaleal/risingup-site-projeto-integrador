<%-- 
    Document   : index
    Created on : 28/08/2018, 08:40:45
    Author     : Casa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ctrl_cli" class="controller.CtrlCliente"/>


<c:if test="${cliente != null && ctrl_cli.isAutorizado(cliente) == true}">
    <script>window.location.href="admin.jsp"</script>
</c:if>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <title>Login - ADMIN</title>
    </head>
    <body>
        <div class="container">
            <c:import url="../paginas/alertas.jsp"></c:import>
            <div class="row mt-5">
                <div class="col-lg-4 col-8 offset-2 offset-lg-4 p-4 fundoverm" style="border-radius: 10px;">
                    <form id="formcadastro" method="post" role="form" action="../sys" autocomplete="off">
                        <h1 class="text-center">Login</h5>
                            <input type="hidden" name="action" value="login">
                            <input type="hidden" name="logica" value="Admin">
                            <div class="form-group">
                                <label for="">Email</label>
                                <input class="form-control" type="text" name="email">
                            </div>
                            <div class="form-group">
                                <label for="">Senha</label>
                                <input class="form-control" type="password" name="pws">
                            </div>
                            <input type="submit" class="btn btn-dark w-100" name="login" value="Entrar">
                    </form>
                </div>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
<html>

