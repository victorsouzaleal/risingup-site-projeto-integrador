<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- AREA DE MENSAGENS -->

<c:if test="${not empty avisos}">
    <script>
        var message = "${avisos}";
        alertify.alert("Aviso", message);
    </script>
    <c:remove var="avisos" scope="session" />
</c:if>

<c:if test="${not empty erros}">
    <script>
        var message = "${erros}";
        alertify.alert("Erro", message);
    </script>
    <c:remove var="erros" scope="session" />
</c:if>

<c:if test="${not empty alertas}">
    <script>
        var message = "${alertas}";
        alertify.alert("Alerta", message);
    </script>
    <c:remove var="alertas" scope="session" />
</c:if>



<!-- FIM AREA DE MENSAGENS -->


