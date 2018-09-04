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
 * @author Casa
 */
@Entity
public class Produto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    private String nome;
    private String descricao;
    private int quant;
    private float preco;
    private String foto1;
    private String foto2;
    private String foto3;
    private boolean ativo;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getPreco() {
        return preco;
    }

    public int getQuant() {
        return quant;
    }

    public void setQuant(int quant) {
        this.quant = quant;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public String getFoto1() {
        return foto1;
    }

    public void setFoto1(String foto1) {
        this.foto1 = foto1;
    }

    public String getFoto2() {
        return foto2;
    }

    public void setFoto2(String foto2) {
        this.foto2 = foto2;
    }

    public String getFoto3() {
        return foto3;
    }

    public void setFoto3(String foto3) {
        this.foto3 = foto3;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        if (!(object instanceof Produto)) {
            return false;
        }
        Produto other = (Produto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Produto[ id=" + id + " ]";
    }

    private String validarProduto(String preco_prod, String quant) {
        String erros = "";

        if (nome.equals("")) {
            erros += "Campo NOME está em branco.<br>";
        }
        if (descricao.equals("")) {
            erros += "Campo DESCRIÇÃO está em branco.<br>";
        }
        if (preco_prod.equals("")) {
            erros += "Campo PREÇO está em branco.<br>";
        } else {
            try {
                Float.parseFloat(preco_prod);
            } catch (NumberFormatException ex) {
                erros += "Campo PREÇO tem valor inválido.<br>";
            }
        }

        if (quant.equals("")) {
            erros += "Campo QUANTIDADE está em branco.<br>";
        } else {
            try {
                Integer.parseInt(quant);
            } catch (NumberFormatException ex) {
                erros += "Campo QUANTIDADE tem valor inválido.<br>";
            }
        }

        if (foto1.equals("")) {
            erros += "FOTO 1 é obrigatória";
        }

        return erros;
    }

    private String validarEdicao(String preco_prod, String quant) {
        String erros = "";

        if (nome.equals("")) {
            erros += "Campo NOME está em branco.<br>";
        }
        if (descricao.equals("")) {
            erros += "Campo DESCRIÇÃO está em branco.<br>";
        }
        if (preco_prod.equals("")) {
            erros += "Campo PREÇO está em branco.<br>";
        } else {
            try {
                Float.parseFloat(preco_prod);
            } catch (NumberFormatException ex) {
                erros += "Campo PREÇO tem valor inválido.<br>";
            }
        }

        if (quant.equals("")) {
            erros += "Campo QUANTIDADE está em branco.<br>";
        } else {
            try {
                Integer.parseInt(quant);
            } catch (NumberFormatException ex) {
                erros += "Campo QUANTIDADE tem valor inválido.<br>";
            }
        }

        return erros;
    }

    public void validar(String preco, String quant) throws Exception {
        String erros = "";
        erros = validarProduto(preco, quant);
        if (!erros.equals("")) {
            throw new Exception(erros);
        }
    }
    
    public void validarEdit(String preco, String quant) throws Exception {
        String erros = "";
        erros = validarEdicao(preco, quant);
        if (!erros.equals("")) {
            throw new Exception(erros);
        }
    }

}
