/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.CtrlCliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;

/**
 *
 * @author Casa
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/Admin"})
public class AdminServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CtrlCliente ctrlcli = new CtrlCliente();
        String acao = request.getParameter("action");
        HttpSession user = request.getSession();
        String pagina = "";


        if (acao.equals("login")) {
            try {
                Cliente cli = ctrlcli.login(request.getParameter("email"), request.getParameter("pws"));
                cli.setPws("");
                if (ctrlcli.isAutorizado(cli) == true) {
                    user.setAttribute("cliente", cli);
                    user.setAttribute("avisos", "Bem-vindo a pagina de administrador");
                    response.sendRedirect("admin/admin.jsp");
                } else {
                    user.setAttribute("erros", "Sem permissão");
                    response.sendRedirect("admin/index.jsp");
                }
            } catch (Exception ex) {
                user.setAttribute("erros", "Usuario ou senha invalido");
                response.sendRedirect("admin/index.jsp");
            }
        }

        if (acao.equals("off")) {
            user = request.getSession();
            //Remove um item da session
            //user.removeAttribute("cliente");
            //Apaga a session user
            user.invalidate();
            response.sendRedirect("admin/index.jsp");
        }

        if (acao.equals("buscar_cli")) {
            String dado_cli = request.getParameter("b_nome");
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            CtrlCliente ctrl = new CtrlCliente();
            List<Cliente> lista;
            lista = ctrl.buscaCliente(dado_cli, tipo);
            user.setAttribute("b_resultado", lista);
            if (lista.size() < 1) {
                user.setAttribute("erros", "Dados não encontrados");
            }
            pagina = "admin/admin.jsp?acao=lista_prod";
            response.sendRedirect("admin/admin.jsp?acao=lista_cli");
        }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
