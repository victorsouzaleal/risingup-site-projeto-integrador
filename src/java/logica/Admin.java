/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import controller.CtrlCliente;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

public class Admin implements Logica {

    public String executa(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
               response.setContentType("text/html;charset=UTF-8");
        CtrlCliente ctrlcli = new CtrlCliente();
        String acao = request.getParameter("action");
        HttpSession user = request.getSession();
        String pagina = "";

        if (acao.equals("login")) {
            try {
                Usuario cli = ctrlcli.login(request.getParameter("email"), request.getParameter("pws"));
                cli.setPws("");
                if (ctrlcli.isAutorizado(cli) == true) {
                    user.setAttribute("cliente", cli);
                    user.setAttribute("avisos", "Bem-vindo a pagina de administrador");
                    pagina = "admin/admin.jsp";
                } else {
                    user.setAttribute("erros", "Sem permissão");
                    pagina = "admin/index.jsp";
                }
            } catch (Exception ex) {
                user.setAttribute("erros", "Usuario ou senha invalido");
                pagina = "admin/index.jsp";
            }
        }

        if (acao.equals("off")) {
            user = request.getSession();
            //Remove um item da session
            //user.removeAttribute("cliente");
            //Apaga a session user
            user.invalidate();
            pagina = "admin/index.jsp";
        }

        if (acao.equals("buscar_cli")) {
            String dado_cli = request.getParameter("b_nome");
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            CtrlCliente ctrl = new CtrlCliente();
            List<Usuario> lista;
            lista = ctrl.buscaCliente(dado_cli, tipo);
            user.setAttribute("b_resultado", lista);
            if (lista.size() < 1) {
                user.setAttribute("erros", "Dados não encontrados");
            }
            pagina = "admin/admin.jsp?acao=lista_cli";
        }
        return pagina;
    }
}
