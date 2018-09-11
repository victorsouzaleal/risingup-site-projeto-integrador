<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- AREA DE MENSAGENS -->
<c:if test="${not empty avisos}">
    <div class="alert alert-info">
        <strong><p class="text-center">${avisos}</p></strong>
        <c:remove var="avisos" scope="session" />
    </div>
</c:if>
<c:if test="${not empty erros}">
    <div class="alert alert-danger">
        <strong><p class="text-center">${erros}</p></strong>
        <c:remove var="erros" scope="session" />
    </div>
</c:if>
<c:if test="${not empty alertas}">
    <div class="alert alert-warning">
        <strong><p class="text-center">${alertas}</p></strong>
        <c:remove var="alertas" scope="session" />
    </div>
</c:if>
<c:if test="${not empty testes}">
    <div class="alert alert-warning">
        <c:forEach items="${testes}" var="t">
            <strong><p class="text-center">${t}</p></strong>
        </c:forEach>
        <c:remove var="testes" scope="session" />
    </div>
</c:if>



<!-- FIM AREA DE MENSAGENS -->


