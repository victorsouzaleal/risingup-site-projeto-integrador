<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: 'textarea',
        height: 500,
        menubar: false,
        plugins: [
            'advlist autolink lists link image charmap print preview anchor textcolor',
            'searchreplace visualblocks code fullscreen',
            'insertdatetime media table contextmenu paste code help wordcount'
        ],
        toolbar: 'insert | undo redo |  formatselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
        content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            '//www.tinymce.com/css/codepen.min.css']
    });
</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ctrl_cat" class="controller.CtrlCategoria"/>
<div class="row mt-5" style="margin-bottom: 100px;">
    <div class="col-md-6 offset-md-3 p-4 fundoverm px-3 py-3" style="border-radius: 10px;">
        <form id="formcadastro_prod" method="post" role="form" enctype="multipart/form-data" action="../sys" autocomplete="off">
            <h1 class="text-center">Cadastro de Produtos</h1>
            <input type="hidden" name="action" value="cad_prod">
            <input type="hidden" name="logica" value="Produto_Log">
            <div class="form-group">
                <label for="">Nome</label>
                <input class="form-control" type="text" name="nome" placeholder="Nome do Produto">
            </div>
            <div class="form-group">
                <label for="">Nome Detalhado</label>
                <input class="form-control" type="text" name="nomedet" placeholder="Nome Detalhado">
            </div>
            <div class="form-group">
                <label for="">Descricao</label>
                <input class="form-control" type="text" name="descricao" placeholder="Descricao do Produto">
            </div>
            <div class="form-group">
                <label for="">Especificacao</label>
                <textarea name="espec"></textarea>
            </div>
            <div class="form-group">
                <label for="">Quantidade</label>
                <input class="form-control" type="number" name="qtd" value="0" placeholder="Quantidade">
            </div>
            <div class="form-group">
                <label for="">Preco</label>
                <input class="form-control" type="text" name="preco" placeholder="Preco do Produto">
            </div>

            <div class="form-group">
                <label for="">Categoria</label>
                <select name="cat">
                    <c:forEach items="${ctrl_cat.buscarCategorias()}" var="cats">
                        <option value="${cats.id}">${cats.nome}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="" class="mr-3">Ativo</label>
                <input type="radio" name="ativo" value="v" checked="checked"> SIM
                <input type="radio" name="ativo" value="f"> NAO    
            </div>

            <div class="form-group">
                <label for="">Foto 1</label>
                <input class="form-control" type="file" name="foto1">
            </div>

            <div class="form-group">
                <label for="">Foto 2</label>
                <input class="form-control" type="file" name="foto2">
            </div>
            <div class="form-group">
                <label for="">Foto 3</label>
                <input class="form-control" type="file" name="foto3">
            </div>

            <input type="submit" class="btn btn-dark w-100" name="cad_prod" value="Cadastrar">
        </form>
    </div>
</div>
