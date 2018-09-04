/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import controller.CtrlCategoria;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Categoria;
import util.Arquivo;

/**
 *
 * @author Aluno
 */
public class Categoria_Log implements Logica {

    public String executa(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession msgs = request.getSession();
        String pagina = "admin/admin.jsp";
        String acao = request.getParameter("action");

        if (acao.equals("cad")) {
            Arquivo arq = new Arquivo();
            Categoria cat = new Categoria();
            CtrlCategoria ctrl_cat = new CtrlCategoria();
            cat.setNome(request.getParameter("nome"));
            cat.setIcone1(request.getPart("icone1").getSubmittedFileName());
            cat.setIcone2(request.getPart("icone2").getSubmittedFileName());
            cat.validar();
            arq.upload(arq.getPath_icone_cat(), cat.getIcone1(), request.getPart("icone1").getInputStream());
            arq.upload(arq.getPath_icone_cat(), cat.getIcone2(), request.getPart("icone2").getInputStream());
            ctrl_cat.cadastrar(cat);
        }

        if (acao.equals("edit")) {
            try {
                Arquivo arq = new Arquivo();
                CtrlCategoria ctrl_cat = new CtrlCategoria();
                Categoria cat_atual = ctrl_cat.buscarCategoria(Long.parseLong(request.getParameter("id")));
                Categoria cat = new Categoria();
                cat.setId(Long.parseLong(request.getParameter("idcat")));
                cat.setNome(request.getParameter("nome"));
                cat.setIcone1(request.getPart("icone1").getSubmittedFileName());
                cat.setIcone2(request.getPart("icone2").getSubmittedFileName());
                cat.validarEdit();
                ctrl_cat.editar(cat);

                if (cat.getIcone1().equals("")) {
                    cat.setIcone1(cat_atual.getIcone1());
                } else {
                    arq.upload(arq.getPath_icone_cat(), cat.getIcone1(), request.getPart("icone1").getInputStream());
                }

                if (cat.getIcone2().equals("")) {
                    cat.setIcone2(cat_atual.getIcone2());
                } else {
                    arq.upload(arq.getPath_icone_cat(), cat.getIcone2(), request.getPart("icone2").getInputStream());
                }
            } catch (Exception ex) {
                msgs.setAttribute("erros", ex.getMessage());
                pagina = "admin/admin.jsp?acao=edit_cat&id=" + request.getParameter("idcat");
            }
        }
        return pagina;
    }
}
