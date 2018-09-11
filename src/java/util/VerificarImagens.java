/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import controller.CtrlProduto;
import java.io.File;
import java.util.List;
import model.Produto;

/**
 *
 * @author Casa
 */
public class VerificarImagens {

    public void deletarImagensProduto() throws Exception {
        CtrlProduto ctrlprod = new CtrlProduto();
        List<Produto> produtos = ctrlprod.listarProdutos();
        for (Produto prod : produtos) {
            Arquivo arq = new Arquivo();
            File file = new File(arq.path_foto_produto);
            File[] arquivos = file.listFiles();
            for (File arqu : arquivos) {
                if (prod.getFoto1().equals(arqu.getName())) {
                    arqu.delete();
                }
                if (prod.getFoto2().equals(arqu.getName())) {
                    arqu.delete();
                }
                if (prod.getFoto3().equals(arqu.getName())) {
                    arqu.delete();
                }
            }
        }
    }
}
