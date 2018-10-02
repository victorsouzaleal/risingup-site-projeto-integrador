/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import model.Usuario;
import model.Item_Pedido;
import model.Pedido;

/**
 *
 * @author Casa
 */
public class PedidoDAO extends ConectaJPA {

    //PEDIDO
    //Salvar 
    public void criarPedido(Pedido dados) throws Exception {
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
    public void edit(Pedido dados) throws Exception {
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
                if (buscarPedido(id) == null) {

                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //Listar pedido por ID
    public Pedido buscarPedido(Long id) throws Exception {
        try {
            Query query = em.createQuery("select p from Pedido as p WHERE p.id = :id");
            query.setParameter("id", id);
            Pedido dadoss = (Pedido) query.getSingleResult();
            return dadoss;
        } finally {
            em.close();
        }
    }

    //Listar pedidos de um cliente
    public List<Pedido> buscarPedidoCliente(Usuario cli) throws Exception {
        try {
            Query query = em.createQuery("select p from Pedido as p , Usuario c WHERE p.cliente.id = c.id and c.id = :dados");
            query.setParameter("dados", cli.getId());
            List<Pedido> dadoss = query.getResultList();
            return dadoss;
        } finally {
            em.close();
        }
    }

    // ITEM
    public void criarItemPedido(Item_Pedido dados) throws Exception {
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

    //Buscar itens de acordo com o ID do PEDIDO
    public List<Item_Pedido> buscarItensPedido(Long id) throws Exception {
        try {
            Query query = em.createQuery("select i from Item_Pedido as i , Pedido ped WHERE i.pedido.id = ped.id and ped.id = :dados");
            query.setParameter("dados", id);
            List<Item_Pedido> dadoss = query.getResultList();
            return dadoss;
        } finally {
            em.close();
        }
    }

    //Buscar todos por nomes
    public List<Pedido> findPedidos() {
        try {
            Query query = em.createQuery("select x from Pedido as x");
            List<Pedido> lista = query.getResultList();
            return lista;
        } finally {
            em.close();
        }
    }
}
