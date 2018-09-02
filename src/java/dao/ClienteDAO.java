package dao;

import java.util.List;
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
//import javax.persistence.EntityTransaction;
//import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import model.Usuario;

public class ClienteDAO extends ConectaJPA {

    //Salvar 
    public void create(Usuario dados) throws Exception {
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
    public void edit(Usuario dados) throws Exception {
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
                if (findCliente(id) == null) {

                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //Apagar
    public void destroy(Long id) throws Exception {
        et = em.getTransaction();
        try {
            et.begin();
            Usuario dados = null;
            try {
                dados = em.getReference(Usuario.class, id);
                dados.getId();
            } catch (EntityNotFoundException enfe) {

            }
            em.remove(dados);
            et.commit();
        } catch (Exception ex) {
            try {
                et.rollback();
            } catch (Exception re) {

            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //Busca pelo ID
    public Usuario findCliente(Long id) {
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }

    //Buscar todos por nomes
    public List<Usuario> findClientes(String dado, int tipo) {
        try {
            Query query = em.createQuery("select p from Usuario as p where p.nome like :dados");
            switch (tipo) {
                case 1:
                    query = em.createQuery("select p from Usuario as p where p.nome like :dados");
                    break;
                case 2:
                    query = em.createQuery("select p from Usuario as p where p.email like :dados");
                    break;
                case 3:
                    query = em.createQuery("select p from Usuario as p where p.endereco.cep like :dados");
                    break;
            }
            query.setParameter("dados", dado + "%");
            List<Usuario> dadoss = query.getResultList();
            return dadoss;
        } finally {
            em.close();
        }
    }

    //Verificar se é o primeiro usuario cadastrado
    public boolean isPrimeiro() {
        Query query = em.createQuery("select p from Usuario as p");
        List<Usuario> cli = query.getResultList();
        return cli.isEmpty();
    }

    //Busca dados pela email e senha
    public Usuario findCliente(String email, String pws) {
        try {
            Query query = em.createQuery(""
                    + "select p from Usuario as p "
                    + "where p.email = :email and p.pws = :pws");
            query.setParameter("email", email);
            query.setParameter("pws", pws);
            return (Usuario) query.getSingleResult();
        } finally {
            em.close();
        }
    }

    //Ver se o usuario é autorizado
    public Usuario isAutorizado(Usuario cliente) {
        Long id = cliente.getId();
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }

    public void ativarAdmin(Usuario cli) {
        Long id = cli.getId();
        try {
            Query query = em.createQuery("UPDATE Usuario as c SET c.ativo = true where c.id = :id");
            query.setParameter("dados", id);
        } finally {
            em.close();
        }
    }

}
