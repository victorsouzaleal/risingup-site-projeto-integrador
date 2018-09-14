/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProdutoDAO;
import java.util.List;
import model.Produto;



/**
 *
 * @author Casa
 */
public class CtrlProduto {
   
    ProdutoDAO dao = null;
    
    public void cadastrar(Produto prod) throws Exception{
        dao = new ProdutoDAO();
        dao.create(prod);
    }
    
    public void editar(Produto prod) throws Exception{
        dao = new ProdutoDAO();
        dao.edit(prod);
    }
    
    public List<Produto> listarProdutos() throws Exception{
        dao = new ProdutoDAO();
        return dao.findProdutos();
    }
    
    public List<Produto> listarProdutos(int tipo_cat, int limite) throws Exception{
        dao = new ProdutoDAO();
        return dao.findProdutos(tipo_cat, limite);
    }
    
    public List<Produto> listarProdutos(Long id_cat) throws Exception{
        dao = new ProdutoDAO();
        return dao.findProdutos(id_cat);
    }
    
    public Produto buscarProduto(Long id) throws Exception{
        dao = new ProdutoDAO();
        return dao.findProduto(id);
    }
    
    public List<Produto> busca(String nome , int tipo){
        dao = new ProdutoDAO();
        return dao.findProdutos(nome,tipo);
    }
    
    public List<Produto> produtosSemelhantes(Long id , int limite , Long id_prod){
        dao = new ProdutoDAO();
        return dao.produtosSemelhantes(id, limite, id_prod);
    }
      
}
