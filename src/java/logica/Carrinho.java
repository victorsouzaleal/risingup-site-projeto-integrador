/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import controller.CtrlProduto;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item_Pedido;
import model.Produto;

public class Carrinho implements Logica {

    public String executa(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("action");
        String pagina = "";
        HttpSession carrinho = request.getSession();
        HttpSession msgs = request.getSession();
        boolean igual = false;
        List<Item_Pedido> car = (List<Item_Pedido>) carrinho.getAttribute("carrinho");

        // ADICIONAR AO CARRINHO
        if (acao.equals("adicionar")) {
            if (car == null) {
                car = new ArrayList();
                carrinho.setAttribute("carrinho", carrinho);
            }

            CtrlProduto ctrl = new CtrlProduto();
            Produto prod = ctrl.buscarProduto(Long.parseLong(request.getParameter("prod_id")));
            Item_Pedido item = new Item_Pedido();
            item.setProduto(prod);
            item.setQuant(Integer.parseInt(request.getParameter("prod_qtd")));
            item.setValorItens(item.getProduto().getPreco() * item.getQuant());

            for (Item_Pedido i : car) {
                if (i.getProduto().equals(item.getProduto())) {
                    i.setQuant(i.getQuant() + Integer.parseInt(request.getParameter("prod_qtd")));
                    i.setValorItens(i.getProduto().getPreco() * i.getQuant());
                    igual = true;
                }
            }

            if (!igual) {
                item.setProduto(prod);
                item.setQuant(Integer.parseInt(request.getParameter("prod_qtd")));
                car.add(item);
            }

            atualizarCarrinho(carrinho, car);
            pagina = "index.jsp?acao=carrinho";
        }

        // ALTERAR QUANTIDADE DOS PRODUTOS
        if (acao.equals("alterar_qtd")) {
            for (Item_Pedido i : car) {
                if (i.getProduto().getId() == Long.parseLong(request.getParameter("id"))) {
                    i.setQuant(Integer.parseInt(request.getParameter("qtd")));
                    i.setValorItens(i.getProduto().getPreco() * i.getQuant());
                }
            }
            atualizarCarrinho(carrinho, car);
            pagina = "index.jsp?acao=carrinho";
        }

        if (acao.equals("remover")) {
            for (int i = 0; i < car.size(); i++) {
                if (car.get(i).getProduto().getId() == Long.parseLong(request.getParameter("iditem"))) {
                    car.remove(car.get(i));
                }
            }

            atualizarCarrinho(carrinho, car);
            pagina = "index.jsp?acao=carrinho";
        }
        return pagina;
    }

 
    public Double total(List<Item_Pedido> carrinho) {
        Double total = 0.0;
        if (carrinho == null) {
            return total;
        } else {
            for (Item_Pedido i : carrinho) {
                total += i.getValorItens();
            }
        }
        return total;
    }

    public void atualizarCarrinho(HttpSession carrinho, List<Item_Pedido> car) {
        carrinho.setAttribute("total", total(car));
        carrinho.setAttribute("frete", 50.00);
        carrinho.setAttribute("carrinho", car);
    }

    public void apagarCarrinho(List<Item_Pedido> car) {
        for (int i = 0; i < car.size(); i++) {
            car.remove(car.get(i));
        }
    }

}
