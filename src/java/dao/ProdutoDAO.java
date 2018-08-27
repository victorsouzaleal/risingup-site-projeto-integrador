/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import model.Item_Pedido;
import model.Produto;

/**
 *
 * @author Casa
 */
public class ProdutoDAO extends ConectaJPA {

    //Salvar 
    public void create(Produto dados) throws Exception {
        et = em.getTransaction();
        try {
            et.begin();
            em.persist(dados);
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {
                re.toString();
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //Buscar todos
    public List<Produto> findProdutos() {
        try {
            Query query = em.createQuery("select p from Produto as p");
            List<Produto> dadoss = query.getResultList();
            return dadoss;
        } finally {
            em.close();
        }
    }

    //Buscar todos por nomes
    public List<Produto> findProdutos(String dados) {
        try {
            Query query = em.createQuery("select p from Produto as p where p.nome like :dados");
            query.setParameter("dados", dados + "%");
            List<Produto> produtos = query.getResultList();
            return produtos;
        } finally {
            em.close();
        }
    }

    //Busca pelo ID
    public Produto findProduto(Long id) {
        try {
            return em.find(Produto.class, id);
        } finally {
            em.close();
        }
    }


}
