/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import model.Item_Pedido;
import model.PedidoModel;

/**
 *
 * @author Casa
 */
public class PedidoDAO extends ConectaJPA {

    //PEDIDO
    //Salvar 
    public void criarPedido(PedidoModel dados) throws Exception {
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
            Query query = em.createQuery("select i from Item_Pedido as i , PedidoModel ped WHERE i.pedido.id = ped.id and ped.id = :dados");
            query.setParameter("dados", id);
            List<Item_Pedido> dadoss = query.getResultList();
            return dadoss;
        } finally {
            em.close();
        }
    }
}
