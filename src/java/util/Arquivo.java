package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class Arquivo {
    private String path_foto_produto = "G:/SENAC/Loja_JavaEE/web/img/produtos";
    private String path_icone_cat = "G:/SENAC/Loja_JavaEE/web/img/icones_cat";

    public String getPath_foto_produto() {
        return path_foto_produto;
    }

    public String getPath_icone_cat() {
        return path_icone_cat;
    }
    
    

    public void upload(String pasta, String nomeDoArquivo,
            InputStream arquivoCarregado) throws FileNotFoundException {
        String caminhoArquivo = pasta + File.separator + nomeDoArquivo;
        File novoArquivo = new File(caminhoArquivo); 
        FileOutputStream saida = new FileOutputStream(novoArquivo);
        copiar(arquivoCarregado, saida);
    }

    private void copiar(InputStream origem, OutputStream destino) {
        int bite = 0;
        byte[] tamanhoMaximo = new byte[1024 * 8]; // 8KB
        try {
            // enquanto bytes forem sendo lidos
            while ((bite = origem.read(tamanhoMaximo)) >= 0) {
                // pegue o byte lido e escreva no destino
                destino.write(tamanhoMaximo, 0, bite);
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public  String getFileExtension(final String path) {
        if (path != null && path.lastIndexOf('.') != -1) {
            return path.substring(path.lastIndexOf('.'));
        }
        return null;
    }

    public String getFileName(String fileName) {
        return fileName.substring(0, fileName.lastIndexOf('.'));
    }

    public String gerarNome(String nome) {
        if (!(nome.equals(""))) {         
                nome = UUID.randomUUID().toString() + getFileExtension(nome);
        } 
        return nome;
    }
}
//form:  enctype="multipart/form-data"
/*
public class ArquivoController {
 
  public void upload(UploadedFile upload) {
    Arquivo arquivo = new Arquivo();
    arquivo.upload("/home/matheus/arquivos", upload.getFileName(),
      upload.getFile());
  }
 
}
 */
