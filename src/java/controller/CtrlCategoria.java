/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoriaDAO;
import java.util.List;
import model.Categoria;

/**
 *
 * @author Aluno
 */
public class CtrlCategoria {

    CategoriaDAO dao = null;

    public void cadastrar(Categoria cat) throws Exception {
        dao = new CategoriaDAO();
        dao.create(cat);
    }

    public void editar(Categoria cat) throws Exception {
        dao = new CategoriaDAO();
        dao.edit(cat);
    }

    public Categoria buscarCategoria(Long id) throws Exception {
        dao = new CategoriaDAO();
        return dao.findCategoria(id);
    }
    
    public List<Categoria> buscarCategorias(String nome) throws Exception {
        dao = new CategoriaDAO();
        return dao.findCategorias(nome);
    }
    
    public List<Categoria> buscarCategorias() throws Exception {
        dao = new CategoriaDAO();
        return dao.findCategorias();
    }
    
}
