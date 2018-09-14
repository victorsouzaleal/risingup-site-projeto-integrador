/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
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
    
        //Alterar 
    public void edit(Produto dados) throws Exception {
        et = em.getTransaction();
        try {
            et.begin();
            dados = em.merge(dados);
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {

            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = dados.getId();
                if (findProduto(id) == null) {

                }
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
    public List<Produto> findProdutos(String dados, int tipo){
        try {
            Query query = em.createQuery("select p from Produto as p where p.nome like :dados");
            switch (tipo) {
                case 1:
                    query = em.createQuery("select p from Produto as p where p.nome like :dados");
                    query.setParameter("dados", dados.trim() + "%");
                    break;
                case 2:
                    query = em.createQuery("select p from Produto as p where p.descricao like :dados");
                    query.setParameter("dados", dados.trim() + "%");
                    break;
                case 3:
                    query = em.createQuery("select p from Produto as p ORDER BY p.id DESC");
                    break;
            }         
            List<Produto> produtos = query.getResultList();
            return produtos;
        } finally {
            em.close();
        }
    }
    
    //Buscar produtos de acordo com a categoria
    public List<Produto> findProdutos(int tipo_categoria , int limite){
        try {
            String cat = "Computador";
            Query query = em.createQuery("select p from Produto as p where p.categoria.nome = :cat and p.ativo = true ORDER BY p.id DESC");
            switch (tipo_categoria) {
                case 1:
                    cat = "Computador";
                    query = em.createQuery("select p from Produto as p where p.categoria.nome = :cat and p.ativo = true ORDER BY p.id DESC");
                    query.setParameter("cat", cat);
                    break;
                case 2:
                    cat = "Notebook";
                    query = em.createQuery("select p from Produto as p where p.categoria.nome = :cat and p.ativo = true ORDER BY p.id DESC");
                    query.setParameter("cat", cat);
                    break;
                case 3:
                    cat = "Teclado";
                    query = em.createQuery("select p from Produto as p where p.categoria.nome = :cat and p.ativo = true ORDER BY p.id DESC");
                    query.setParameter("cat", cat);
                    break;
                case 4:
                    cat = "Mouse";
                    query = em.createQuery("select p from Produto as p where p.categoria.nome = :cat and p.ativo = true ORDER BY p.id DESC");
                    query.setParameter("cat", cat);
                    break;
            }         
            List<Produto> produtos = query.setMaxResults(limite).getResultList();
            return produtos;
        } finally {
            em.close();
        }
    }
    
    //Buscar produtos de acordo com a categoria
    public List<Produto> findProdutos(Long id_cat){
        try {
            Query query = em.createQuery("select p from Produto as p where p.categoria.id = :cat and p.ativo = true ORDER BY p.id DESC");
            query.setParameter("cat", id_cat);   
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
    
    //Produtos semelhantes por categoria
        public List<Produto> produtosSemelhantes(Long id_cat , int limite , Long id_prod){
        try {
            Query query = em.createQuery("select p from Produto as p where NOT p.id = :id_prod and p.categoria.id = :id_cat and p.ativo = true  ORDER BY p.id DESC");
            query.setParameter("id_cat", id_cat);        
            query.setParameter("id_prod", id_prod);        
            List<Produto> produtos = query.setMaxResults(limite).getResultList();
            return produtos;
        } finally {
            em.close();
        }
    }


}
