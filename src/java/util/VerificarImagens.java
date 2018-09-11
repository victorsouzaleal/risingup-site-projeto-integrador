/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import controller.CtrlProduto;
import java.io.File;
import java.util.ArrayList;
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
        List<String> fotos = new ArrayList();

        for (Produto prod : produtos) {
            fotos.add(prod.getFoto1());
            if (prod.getFoto2() != null) {
                fotos.add(prod.getFoto2());
            }
            if (prod.getFoto3() != null) {
                fotos.add(prod.getFoto3());
            }
        }

        boolean igual;
        Arquivo arq = new Arquivo();
        File file = new File(arq.getPath_foto_produto());
        File[] arquivos = file.listFiles();
        for (File arqu : arquivos) {
            igual = false;
            for (String foto : fotos) {
                if (arqu.getName().equals(foto)) {
                    igual = true;
                }
            }
            if (!igual) {
                arqu.delete();
            }
        }
    }
}
