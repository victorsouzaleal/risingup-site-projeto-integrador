/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import model.Categoria;

/**
 *
 * @author Aluno
 */
public class CategoriaDAO extends ConectaJPA {

    //Salvar 
    public void create(Categoria dados) throws Exception {
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
    public void edit(Categoria dados) throws Exception {
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
                if (findCategoria(id) == null) {

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
    public List<Categoria> findCategorias() {
        try {
            Query query = em.createQuery("select c from Categoria as c");
            List<Categoria> dadoss = query.getResultList();
            return dadoss;
        } finally {
            em.close();
        }
    }

    //Busca pelo ID
    public Categoria findCategoria(Long id) {
        try {
            return em.find(Categoria.class, id);
        } finally {
            em.close();
        }
    }
    
    //Buscar todos por nomes
    public List<Categoria> findCategorias(String dados){
        try {
            Query query = em.createQuery("select c from Categoria as c where c.nome like :dados");
            query.setParameter("dados", dados + "%");
            List<Categoria> categorias = query.getResultList();
            return categorias;
        } finally {
            em.close();
        }
    }
}
