package controller;

import dao.ClienteDAO;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.Usuario;

public class CtrlCliente {

    ClienteDAO dao = null;

    public void cadastrar(Usuario cliente) throws Exception {
        dao = new ClienteDAO();
        dao.create(cliente);
    }
    
    public void editar(Usuario cliente) throws Exception {
        dao = new ClienteDAO();
        dao.edit(cliente);
    }

    public Usuario login(String email, String pws) throws Exception {
        dao = new ClienteDAO();
        return dao.findCliente(email, pws);
    }

    public boolean isAutorizado(Usuario cliente) {
        if (cliente == null) {
            return false;
        } 
        
        dao = new ClienteDAO();
        Usuario cli = dao.isAutorizado(cliente);
        return cli.isAdmin();
    }
    
    public void ativarAdmin(Usuario cli){
        dao = new ClienteDAO();
        dao.ativarAdmin(cli);
    }
    
    public  List<Usuario> buscaCliente(String dados , int tipo){
        dao = new ClienteDAO();
        return dao.findClientes(dados,tipo);
    }
    
    public Usuario buscaCliente(Long id){
        dao = new ClienteDAO();
        return dao.findCliente(id);
    }
    
    public  boolean isPrimeiro(){
        dao = new ClienteDAO();
        return dao.isPrimeiro();
    }

}
