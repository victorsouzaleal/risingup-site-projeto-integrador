/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.CtrlPedido;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Item_Pedido;
import model.Pedido;

/**
 *
 * @author Aluno
 */
@WebServlet(name = "Pedido", urlPatterns = {"/Pedido"})
public class PedidoServlet extends HttpServlet {

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
        HttpSession msgs = request.getSession();
        List<Item_Pedido> car = (List<Item_Pedido>) request.getSession().getAttribute("carrinho");
        String pagina;
        
        if (request.getSession().getAttribute("cliente") == null) { // SE NÃO HOUVER CLIENTE LOGADO
            msgs.setAttribute("alertas", "Entre na sua conta para continuar a compra");
            response.sendRedirect("index.jsp?acao=login_usuario");
        } else if (car == null || car.size() < 1) { // SE O CARRINHO NÃO EXISTIR OU ESTIVER VAZIO
            msgs.setAttribute("erros", "Você não tem nenhum item para finalizar o pedido");
            response.sendRedirect("index.jsp");
        } else { // SE TUDO ESTIVER CORRETO
            
            if (request.getParameter("action").equals("confirmar")) { // CONFIRMAÇÃO DO PEDIDO
                request.setAttribute("frete_pedido", request.getSession().getAttribute("frete"));
                request.setAttribute("total_pedido", request.getSession().getAttribute("total"));
                double total = (Double) request.getSession().getAttribute("frete") + (Double) request.getSession().getAttribute("total");
                request.setAttribute("total_geral", total);
                pagina = "index.jsp?acao=finalizarPedido";
                request.getRequestDispatcher(pagina).forward(request, response);
            }

            if (request.getParameter("action").equals("finalizar")) { // FINALIZAÇÃO DO PEDIDO
                CtrlPedido ctrl = new CtrlPedido();
                Pedido ped = new Pedido();
                // CADASTRANDO PEDIDO     
                ped.setCliente((Cliente) request.getSession().getAttribute("cliente"));
                Calendar dt = new GregorianCalendar(Locale.ROOT);
                ped.setDataPedido(dt);
                ped.setFechado(true);
                ped.setFrete((Double) request.getSession().getAttribute("frete"));
                ped.setPago(false);
                ped.setValor((Double) request.getSession().getAttribute("total"));
                double total = (Double) request.getSession().getAttribute("frete") + (Double) request.getSession().getAttribute("total");
                ped.setTotal(total);
                ctrl.criarPedido(ped);
                // FIM CADASTRO PEDIDO

                // CADASTRANDO ITENS
                for (Item_Pedido item : car) {
                    item.setPedido(ped);
                    ctrl.criarItemPedido(item);
                }
                // FIM CADASTRO DE ITENS

                //ZERANDO CARRINHO
                CarrinhoServlet car_servlet = new CarrinhoServlet();
                car_servlet.apagarCarrinho(car);
                request.getSession().removeAttribute("frete");
                request.getSession().removeAttribute("total");
                SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
                String data = formatoData.format(dt.getTime());
                msgs.setAttribute("avisos", "Pedido realizado com sucesso no dia " + data + " no valor de " + total);
                pagina = "index.jsp";
                response.sendRedirect(pagina);
            }

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
