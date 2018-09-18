/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import controller.CtrlPedido;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.Item_Pedido;
import model.Pedido;

public class Pedido_Log implements Logica {

    public String executa(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession msgs = request.getSession();
        List<Item_Pedido> car = (List<Item_Pedido>) request.getSession().getAttribute("carrinho");
        String pagina = "index.jsp";

        if (request.getParameter("action").equals("confirmar")) { // CONFIRMAÇÃO DO PEDIDO
            if (request.getSession().getAttribute("cliente") == null) { // SE NÃO HOUVER CLIENTE LOGADO
                msgs.setAttribute("alertas", "Entre na sua conta para continuar a compra");
                pagina = "index.jsp?acao=login";
            } else if (car == null || car.size() < 1) { // SE O CARRINHO NÃO EXISTIR OU ESTIVER VAZIO
                msgs.setAttribute("erros", "Você não tem nenhum item para finalizar o pedido");
                pagina = "index.jsp";
            } else { // SE TUDO ESTIVER CORRETO     
                msgs.setAttribute("frete_pedido", request.getSession().getAttribute("frete"));
                msgs.setAttribute("total_pedido", request.getSession().getAttribute("total"));
                double total = (Double) request.getSession().getAttribute("frete") + (Double) request.getSession().getAttribute("total");
                msgs.setAttribute("total_geral", total);
                pagina = "index.jsp?acao=finalizarPedido";
            }
        }

        if (request.getParameter("action").equals("finalizar")) { // FINALIZAÇÃO DO PEDIDO
            CtrlPedido ctrl = new CtrlPedido();
            Pedido ped = new Pedido();
            // CADASTRANDO PEDIDO     
            ped.setCliente((Usuario) request.getSession().getAttribute("cliente"));
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
            request.getSession().removeAttribute("carrinho");
            request.getSession().removeAttribute("frete");
            request.getSession().removeAttribute("total");
            SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
            String data = formatoData.format(dt.getTime());
            msgs.setAttribute("avisos", "Pedido realizado com sucesso no dia " + data + " no valor de " + total);
            pagina = "index.jsp";
        }

        if (request.getParameter("action").equals("buscar")) {
            CtrlPedido ctrlPedido = new CtrlPedido();
            HttpSession lista = request.getSession();
            try {
                List<Pedido> pedidos = ctrlPedido.pesquisar();
                lista.setAttribute("pedidos", pedidos);
            } catch (Exception ex) {
                msgs.setAttribute("erros", "Dados não encontrados.");
            }
            pagina = "admin/admin.jsp?acao=lista_ped";
        }

        return pagina;
    }

}