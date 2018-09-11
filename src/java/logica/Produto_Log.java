/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import controller.CtrlCategoria;
import controller.CtrlProduto;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Produto;
import util.Arquivo;
import util.VerificarImagens;

@MultipartConfig
public class Produto_Log implements Logica {

    public String executa(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("action");
        HttpSession msgs = request.getSession();
        HttpSession listas = request.getSession();
        VerificarImagens verificar = new VerificarImagens();
        String pagina = "index.jsp";

        if (acao.equals("cad_prod")) {
            try {
                Produto prod = new Produto();
                Arquivo arq = new Arquivo();
                CtrlProduto ctrl = new CtrlProduto();
                String path_foto = arq.getPath_foto_produto();
                prod.setNome(request.getParameter("nome"));
                prod.setNome_detalhado(request.getParameter("nomedet"));
                CtrlCategoria ctrl_cat = new CtrlCategoria();
                prod.setCategoria(ctrl_cat.buscarCategoria(Long.parseLong(request.getParameter("cat"))));
                prod.setDescricao(request.getParameter("descricao"));
                prod.setEspecificacao(request.getParameter("espec"));
                prod.setFoto1(request.getPart("foto1").getSubmittedFileName());
                prod.setFoto2(request.getPart("foto2").getSubmittedFileName());
                prod.setFoto3(request.getPart("foto3").getSubmittedFileName());

                //GERAR NOMES ALEATORIOS PARA FOTO
                if (!(prod.getFoto1().equals(""))) {// FOTO 1 
                    prod.setFoto1(arq.gerarNome(prod.getFoto1()));
                }

                if (!(prod.getFoto2().equals(""))) {// FOTO 2           
                    prod.setFoto2(arq.gerarNome(prod.getFoto2()));
                }

                if (!(prod.getFoto3().equals(""))) {// FOTO 3  
                    prod.setFoto3(arq.gerarNome(prod.getFoto3()));
                }

                if (request.getParameter("ativo").equals("v")) {
                    prod.setAtivo(true);
                } else {
                    prod.setAtivo(false);
                }

                prod.validar(request.getParameter("preco"), request.getParameter("qtd"));

                // SE NÃO HOUVER ERROS NA VALIDAÇÃO
                prod.setPreco(Float.parseFloat(request.getParameter("preco")));
                prod.setQuant(Integer.parseInt(request.getParameter("qtd")));

                //UPLOAD DE IMAGENS
                if (!(prod.getFoto1().equals(""))) { // FOTO 1
                    arq.upload(path_foto, prod.getFoto1(), request.getPart("foto1").getInputStream());
                }
                if (!(prod.getFoto2().equals(""))) { // FOTO 2
                    arq.upload(path_foto, prod.getFoto2(), request.getPart("foto2").getInputStream());
                }
                if (!(prod.getFoto3().equals(""))) { // FOTO 3
                    arq.upload(path_foto, prod.getFoto3(), request.getPart("foto3").getInputStream());
                }

                ctrl.cadastrar(prod); // CADASTRO
                verificar.deletarImagensProduto();
                msgs.setAttribute("avisos", "Produto cadastrado com sucesso , caminho :" + arq.getPath_foto_produto());
                pagina = "admin/admin.jsp?acao=cad_produto";
            } catch (Exception ex) {
                msgs.setAttribute("erros", ex.getMessage());
                pagina = "admin/admin.jsp?acao=cad_produto";
            }
        }

        if (acao.equals("edit")) {
            try {
                Arquivo arq = new Arquivo();
                CtrlProduto ctrl_prod = new CtrlProduto();
                Produto dados_atuais = ctrl_prod.buscarProduto(Long.parseLong(request.getParameter("idprod")));
                Produto novos_dados = new Produto();
                novos_dados.setId(Long.parseLong(request.getParameter("idprod")));
                novos_dados.setNome(request.getParameter("nome"));
                novos_dados.setNome_detalhado(request.getParameter("nomedet"));
                CtrlCategoria ctrl_cat = new CtrlCategoria();
                novos_dados.setCategoria(ctrl_cat.buscarCategoria(Long.parseLong(request.getParameter("cat"))));
                novos_dados.setDescricao(request.getParameter("descricao"));
                novos_dados.setEspecificacao(request.getParameter("espec"));
                novos_dados.setFoto1(request.getPart("foto1").getSubmittedFileName());
                novos_dados.setFoto2(request.getPart("foto2").getSubmittedFileName());
                novos_dados.setFoto3(request.getPart("foto3").getSubmittedFileName());

                if (request.getParameter("ativo").equals("v")) {
                    novos_dados.setAtivo(true);
                } else {
                    novos_dados.setAtivo(false);
                }

                novos_dados.validarEdit(request.getParameter("preco"), request.getParameter("qtd"));
                novos_dados.setPreco(Float.parseFloat(request.getParameter("preco")));
                novos_dados.setQuant(Integer.parseInt(request.getParameter("qtd")));

                if (novos_dados.getFoto1().equals("")) {
                    novos_dados.setFoto1(dados_atuais.getFoto1());
                } else {
                    novos_dados.setFoto1(arq.gerarNome(novos_dados.getFoto1()));
                    arq.upload(arq.getPath_foto_produto(), novos_dados.getFoto1(), request.getPart("foto1").getInputStream());
                }

                if (novos_dados.getFoto2().equals("")) {
                    novos_dados.setFoto2(dados_atuais.getFoto2());
                } else {
                    novos_dados.setFoto2(arq.gerarNome(novos_dados.getFoto2()));
                    arq.upload(arq.getPath_foto_produto(), novos_dados.getFoto2(), request.getPart("foto2").getInputStream());
                }

                if (novos_dados.getFoto3().equals("")) {
                    novos_dados.setFoto3(dados_atuais.getFoto3());
                } else {
                    novos_dados.setFoto3(arq.gerarNome(novos_dados.getFoto3()));
                    arq.upload(arq.getPath_foto_produto(), novos_dados.getFoto3(), request.getPart("foto3").getInputStream());
                }

                ctrl_prod.editar(novos_dados);
                File file = new File(arq.getPath_foto_produto());
                File[] arquivos = file.listFiles();
                List<String> nomes = new ArrayList();
                for (File arqu : arquivos){
                    nomes.add(arqu.getName());
                }
                verificar.deletarImagensProduto();
                msgs.setAttribute("testes", nomes);
                msgs.setAttribute("avisos", "Produto editado com sucesso");
                pagina = "admin/admin.jsp?acao=lista_prod";
            } catch (Exception ex) {
                msgs.setAttribute("erros", ex.getMessage());
                System.out.print(ex.getMessage());
                pagina = "admin/admin.jsp?acao=edit_prod&id=" + request.getParameter("idprod");
            }
        }

        if (acao.equals("buscar")) {
            String nome_produto = request.getParameter("b_nome");
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            CtrlProduto ctrl = new CtrlProduto();
            List<Produto> lista;
            lista = ctrl.busca(nome_produto, tipo);
            listas.setAttribute("b_resultado", lista);
            if (lista.size() < 1) {
                msgs.setAttribute("erros", "Dados não encontrados");
            }
            pagina = "admin/admin.jsp?acao=lista_prod";
        }

        return pagina;
    }
}
