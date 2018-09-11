/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Aluno
 */
@Entity
public class Categoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    private String nome;
    private String icone1;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIcone1() {
        return icone1;
    }

    public void setIcone1(String icone1) {
        this.icone1 = icone1;
    }

    private String validarCategoria() {
        String erros = "";

        if (nome.equals("")) {
            erros += "Campo NOME está em branco.<br>";
        }
        if (icone1.equals("")) {
            erros += "ICONE 1 não selecionado<br>";
        }

        return erros;
    }

    public void validar() throws Exception {
        String erros = "";
        erros = validarCategoria();
        if (!erros.equals("")) {
            throw new Exception(erros);
        }
    }
    
    private String validarCategoriaEdit() {
        String erros = "";

        if (nome.equals("")) {
            erros += "Campo NOME está em branco.<br>";
        }

        return erros;
    }

    public void validarEdit() throws Exception {
        String erros = "";
        erros = validarCategoriaEdit();
        if (!erros.equals("")) {
            throw new Exception(erros);
        }
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Categoria)) {
            return false;
        }
        Categoria other = (Categoria) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Categoria[ id=" + id + " ]";
    }

}
