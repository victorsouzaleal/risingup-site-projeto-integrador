/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Calendar;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Casa
 */
@Entity
public class Cliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nome;
    @Column(unique = true)
    private String email;
    private String pws;
    private String numero;
    private String complemento;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Calendar dataNasc;
    @OneToOne(cascade = CascadeType.ALL)
    private Endereco endereco = new Endereco();

    private boolean ativo = true;
    private boolean admin = false;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPws() {
        return pws;
    }

    public void setPws(String pws) {
        this.pws = pws;
    }

    public Calendar getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Calendar dataNasc) {
        this.dataNasc = dataNasc;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
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
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Cliente[ id=" + id + " ]";
    }

    private String validarDados() {
        String erros = "";

        if (nome.equals("")) {
            erros += "Nome em branco.\n";
        }

        if (dataNasc == null) {
            erros += "Data de Nascimento em branco.\n";
        }

        if (email.equals("")) {
            erros += "Email em branco.\n";
        }

        if (endereco.getCep().equals("")) {
            erros += "CEP em branco.\n";
        }
        if (endereco.getLogradouro().equals("")) {
            erros += "Endereço em branco.\n";
        }
        if (endereco.getBairro().equals("")) {
            erros += "Bairro em branco.\n";
        }
        if (endereco.getCidade().equals("")) {
            erros += "Cidade em branco.\n";
        }
        if (endereco.getUf().equals("")) {
            erros += "Estado(UF) em branco.\n";
        }

        if (numero.equals("")) {
            erros += "Numero em branco.\n";
        }

        if (complemento.equals("")) {
            erros += "Complemento em branco.\n";
        }

        return erros;
    }

    private String conferirSenha(String confsenha) {
        String erros = "";

        if (pws.equals("")) {
            erros += "Senha em branco.";
        } else if (pws.length() < 8) {
            erros += "Senha não pode ter menos de 8 caracteres.\n";
        }

        if (!(pws.equals(confsenha))) {
            erros += "Senhas não conferem.\n";
        }

        return erros;
    }

    public void validar() throws Exception {
        String erros = "";
        erros = validarDados();
        if (!(erros.equals(""))) {
            throw new Exception(erros);
        }
    }

    public void validar(String confsenha) throws Exception {
        String erros = "";
        erros = validarDados() + conferirSenha(confsenha);
        if (!(erros.equals(""))) {
            throw new Exception(erros);
        }
    }

    public void validarSenha(String confsenha) throws Exception {
        String erros = "";
        erros = conferirSenha(confsenha);
        if (!(erros.equals(""))) {
            throw new Exception(erros);
        }
    }

}
