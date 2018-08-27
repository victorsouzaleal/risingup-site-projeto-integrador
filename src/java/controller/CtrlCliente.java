package controller;

import dao.ClienteDAO;
import javax.servlet.http.HttpSession;
import model.Cliente;

public class CtrlCliente {

    ClienteDAO dao = null;

    public void cadastrar(Cliente cliente) throws Exception {
        dao = new ClienteDAO();
        dao.create(cliente);
    }

    public Cliente login(String email, String pws) throws Exception {
        dao = new ClienteDAO();
        return dao.findCliente(email, pws);
    }

    public boolean isAutorizado(Cliente cliente) {
        if (cliente == null) {
            return false;
        } 
        
        dao = new ClienteDAO();
        Cliente cli = dao.isAutorizado(cliente);
        return cli.isAdmin();
    }

}
