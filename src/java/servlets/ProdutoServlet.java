/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.CtrlCliente;
import controller.CtrlProduto;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Produto;
import util.Arquivo;

@MultipartConfig

@WebServlet(name = "ProdutoServlet", urlPatterns = {"/Produto"})
public class ProdutoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
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
            CtrlProduto ctrl = new CtrlProduto();
            List<Produto> lista;
            lista = ctrl.buscaPorNome(nome_produto);
            listas.setAttribute("b_resultado", lista);
            if (lista.size() < 1) {
                msgs.setAttribute("erros", "Dados não encontrados");
            }
            pagina = "admin/admin.jsp?acao=lista_prod";
        }
        response.sendRedirect(pagina);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
