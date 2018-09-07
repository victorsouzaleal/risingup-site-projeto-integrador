/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.PedidoDAO;
import java.util.List;
import model.Usuario;

import model.Item_Pedido;
import model.Pedido;

public class CtrlPedido {

    PedidoDAO dao = null;

    //PEDIDO
    public void criarPedido(Pedido dados) throws Exception {
        dao = new PedidoDAO();
        dao.criarPedido(dados);
    }
    
    public List<Pedido> buscarPedidoCliente(Usuario cli ) throws Exception{
        dao = new PedidoDAO();
        return dao.buscarPedidoCliente(cli);
    }

    // ITEM PEDIDO
    public void criarItemPedido(Item_Pedido dados) throws Exception {
        dao = new PedidoDAO();
        dao.criarItemPedido(dados);
    }

    public List<Item_Pedido> buscaItensPorPedido(Long id) throws Exception {
        dao = new PedidoDAO();
        return dao.buscarItensPedido(id);
    }
   public List<Pedido> pesquisar() throws Exception {
        dao = new PedidoDAO();
        return dao.findPedidos();
    }
}
