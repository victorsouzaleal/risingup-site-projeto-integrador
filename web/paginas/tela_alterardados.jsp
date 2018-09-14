
<div class="container" style="margin-bottom: 20%; margin-top: 150px;">
    <div class="row">
        <div class="col-md-12 order-md-2 mb-4">            
            <div class="card">               
                <div class="card-header">
                    <big>Editar perfil</big>
                </div>           
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-10"> <div class="col-md-12">
                                <h5 class="py-2">Dados pessoais</h5></div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="nome_usu" aria-describedby="emailHelp" name="nome_usu" value="${cliente.nome}" placeholder="Nome">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" id="email_usu" aria-describedby="emailHelp" name="email_usu" value="${cliente.email}" readonly="true" placeholder="Email">
                            </div>
                            <a href="#" class="btn btn-outline-secondary">Alterar dados pessoais</a>
                        </div> 
                        <div class="col-md-12 py-2">
                            <hr><h5 class= py-2">Alterar senha</h5>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="password" class="form-control" id="senha_usu" name="senha_usu" placeholder="Senha antiga">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="password" class="form-control" id="senha_usu2" name="senha_usu2" placeholder="Nova senha">
                            </div> 
                        </div>

                        <div class="col-md-6"><a href="#" class="btn btn-outline-secondary">Alterar senha antiga</a></div>

                        <div class="col-md-12 py-2">
                            <hr><h5 class= py-2">Endereço Residencial</h5>
                        </div>

                        <div class="col-md-3 pt-3">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="CEP" value="${cliente.endereco.cep}">
                            </div>
                        </div>


                        <div class="col-md-2">
                            <div class="form-group pt-3">
                                <input type="text" class="form-control" placeholder="NÃºmero" value="${cliente.numero}">
                            </div> 
                        </div>


                        <div class="col-md-3">
                            <div class="form-group pt-3">
                                <input type="text" class="form-control" placeholder="UF" value="${cliente.endereco.uf}">
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="form-group pt-3">
                                <input type="text" class="form-control" placeholder="Cidade" value="${cliente.endereco.cidade}">
                            </div> 
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Rua" value="${cliente.endereco.logradouro}">
                            </div>
                        </div>
                            
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Bairro" value="${cliente.endereco.bairro}">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Complemento" value="${cliente.complemento}">
                            </div> 
                        </div>

                        <div class="col-md-12 "><a href="#" class="btn btn-outline-secondary">Alterar endereço residencial</a></div>
                    </div>

                </div>
                <span class="pt-4"></span>
            </div>
        </div>
    </div>
</div>
