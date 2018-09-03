/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import controller.CtrlProduto;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Produto;
import util.Arquivo;

@MultipartConfig
public class Produto_Log implements Logica {

    public String executa(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("action");
        HttpSession msgs = request.getSession();
        HttpSession listas = request.getSession();
        String pagina = "index.jsp";

        if (acao.equals("cad_prod")) {
            try {
                Produto prod = new Produto();
                Arquivo arq = new Arquivo();
                CtrlProduto ctrl = new CtrlProduto();
                String path_foto = arq.getPath_foto_produto();
                prod.setNome(request.getParameter("nome"));
                prod.setDescricao(request.getParameter("descricao"));
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
                msgs.setAttribute("avisos", "Produto cadastrado com sucesso");
                pagina = "admin/admin.jsp?acao=cad_produto";
            } catch (Exception ex) {
                msgs.setAttribute("erros", ex.getMessage());
                pagina = "admin/admin.jsp?acao=cad_produto";
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
