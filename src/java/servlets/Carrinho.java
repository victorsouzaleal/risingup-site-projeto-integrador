/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.CtrlProduto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item;
import model.Produto;

/**
 *
 * @author Casa
 */
@WebServlet(name = "Carrinho", urlPatterns = {"/Carrinho"})
public class Carrinho extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("action");
        HttpSession carrinho = request.getSession();
        HttpSession msgs = request.getSession();
        boolean igual = false;
        List<Item> car = (List<Item>) carrinho.getAttribute("carrinho");
        
        
        // ADICIONAR AO CARRINHO
        if (acao.equals("adicionar")) {
            if (car == null) {
                car = new ArrayList();
                carrinho.setAttribute("carrinho", carrinho);
            }

            CtrlProduto ctrl = new CtrlProduto();
            Produto prod = ctrl.buscarProduto(Long.parseLong(request.getParameter("prod_id")));
            Item item = new Item();
            item.setProduto(prod);
            item.setQuantidade(Integer.parseInt(request.getParameter("prod_qtd")));
            item.setTotal(item.getProduto().getPreco() * item.getQuantidade());

            for (Item i : car) {
                if (i.getProduto().equals(item.getProduto())) {
                    i.setQuantidade(i.getQuantidade() + 1);
                    i.setTotal(i.getProduto().getPreco() * i.getQuantidade());
                    igual = true;
                }
            }

            if (!igual) {
                item.setProduto(prod);
                item.setQuantidade(Integer.parseInt(request.getParameter("prod_qtd")));
                car.add(item);
            }

            
            atualizarCarrinho(carrinho, car);
            response.sendRedirect("index.jsp?acao=carrinho");
            
        }
        
        // ALTERAR QUANTIDADE DOS PRODUTOS
        if (acao.equals("alterar_qtd")) {
            for (Item i : car) {
                if (i.getProduto().getId() == Long.parseLong(request.getParameter("id"))) {
                    i.setQuantidade(Integer.parseInt(request.getParameter("qtd")));
                    i.setTotal(i.getProduto().getPreco() * i.getQuantidade());
                }
            }
            atualizarCarrinho(carrinho, car);
            response.sendRedirect("index.jsp?acao=carrinho");
        }
        
        // APAGAR CARRINHO
        if (acao.equals("apagar")) {
            apagarCarrinho(carrinho);
            response.sendRedirect("index.jsp?acao=carrinho");
        }
        
        if(acao.equals("remover")){          
            for (int i = 0 ; i < car.size() ; i++){
                if(car.get(i).getProduto().getId() == Long.parseLong(request.getParameter("iditem"))){
                    car.remove(car.get(i));
                }
            }
            
            atualizarCarrinho(carrinho, car);
            msgs.setAttribute("avisos", "Item removido");
            response.sendRedirect("index.jsp?acao=carrinho");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Carrinho.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Carrinho.class.getName()).log(Level.SEVERE, null, ex);
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

    private Double total(List<Item> carrinho) {
        Double total = 0.0;
        if (carrinho == null) {
            return total;
        } else {
            for (Item i : carrinho) {
                total += i.getTotal();
            }
        }
        return total;
    }
    
    private void atualizarCarrinho(HttpSession carrinho,List<Item> car) {
        carrinho.setAttribute("total", total(car));
        carrinho.setAttribute("frete", 50.00);
        carrinho.setAttribute("carrinho", car);
    }
    
    private void apagarCarrinho(HttpSession carrinho) {
        carrinho.removeAttribute("carrinho");
        carrinho.removeAttribute("total");
    }
    

    
  


}
