/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.CtrlCliente;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;


@MultipartConfig
@WebServlet(name = "CliServlet", urlPatterns = {"/Cliente"})
public class CliServlet extends HttpServlet {

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
        String acao = request.getParameter("action");
        HttpSession msgs = request.getSession();
        String pagina = "index.jsp";

        if (acao.equals("cad")) {
            // CADASTRO
            try {
                Cliente cli = new Cliente();
                CtrlCliente ctrlcli = new CtrlCliente();
                cli.setNome(request.getParameter("nome"));

                if (!request.getParameter("data").equals("")) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(sdf.parse(request.getParameter("data")));
                    cli.setDataNasc(cal);
                }

                cli.setEmail(request.getParameter("email"));
                cli.setPws(request.getParameter("pws"));
                cli.setComplemento(request.getParameter("comp"));
                cli.setNumero(request.getParameter("num"));
                cli.getEndereco().setCep(request.getParameter("cep"));
                cli.getEndereco().setLogradouro(request.getParameter("rua"));
                cli.getEndereco().setBairro(request.getParameter("bairro"));
                cli.getEndereco().setCidade(request.getParameter("cidade"));
                cli.getEndereco().setUf(request.getParameter("uf"));
                
                cli.validar(request.getParameter("confpws"));
                ctrlcli.cadastrar(cli);
                msgs.setAttribute("avisos", "Cadastrado com sucesso");
                pagina = "index.jsp";
            } catch (Exception ex) {
                msgs.setAttribute("erros", ex.getMessage().replace("\n","<br>"));
                pagina = "index.jsp?acao=cad_usuario";
            }
        }

        if (acao.equals("login")) {
            //LOGIN
            try {
                CtrlCliente ctrlcli = new CtrlCliente();
                Cliente cli = ctrlcli.login(request.getParameter("email"), request.getParameter("pws"));
                HttpSession user = request.getSession();
                cli.setPws("");
                user.setAttribute("cliente", cli);
                msgs.setAttribute("avisos", "Olá " + cli.getEmail() + "");
            } catch (Exception ex) {
                msgs.setAttribute("erros", "Usuario ou senha invalido");
                pagina = "index.jsp?acao=login_usuario";
            }
        }

        if (acao.equals("off")) {
            HttpSession user = request.getSession();
            //Remove um item da session
            //user.removeAttribute("cliente");
            //Apaga a session user
            user.invalidate();
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
