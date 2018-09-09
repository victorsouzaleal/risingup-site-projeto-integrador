package logica;

import controller.CtrlCliente;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

@MultipartConfig
public class User implements Logica {

    public String executa(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("action");
        HttpSession msgs = request.getSession();
        String pagina = "index.jsp";

        if (acao.equals("cad")) {
            // CADASTRO
            try {
                Usuario cli = new Usuario();
                CtrlCliente ctrlcli = new CtrlCliente();
                if (ctrlcli.isPrimeiro()) {
                    cli.setAdmin(true);
                }
                cli.setNome(request.getParameter("nome"));
                if (!request.getParameter("data").equals("")) {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(sdf.parse(request.getParameter("data")));
                    cli.setDataNasc(cal);
                }

                cli.setEmail(request.getParameter("email"));
                cli.setPws(request.getParameter("pws"));
                cli.setComplemento(request.getParameter("comp"));
                cli.setNumero(request.getParameter("num"));
                cli.getEndereco().setCep(request.getParameter("cep"));
                cli.getEndereco().setLogradouro(request.getParameter("rua"));
                cli.getEndereco().setBairro(request.getParameter("bairro"));
                cli.getEndereco().setCidade(request.getParameter("cidade"));
                cli.getEndereco().setUf(request.getParameter("uf"));
                
                cli.validar(request.getParameter("confpws"));
                
                if (!ctrlcli.enderecoExiste(cli.getEndereco().getCep())) {
                    ctrlcli.cadastrar(cli.getEndereco());
                } 

                ctrlcli.cadastrar(cli);
                msgs.setAttribute("avisos", "Cadastrado com sucesso");
                pagina = "index.jsp";
            } catch (Exception ex) {
                msgs.setAttribute("erros", ex.getMessage().replace("\n", "<br>"));
                pagina = "index.jsp?acao=cad_usuario";
            }
        }

        if (acao.equals("login")) {
            //LOGIN
            try {
                CtrlCliente ctrlcli = new CtrlCliente();
                Usuario cli = ctrlcli.login(request.getParameter("email"), request.getParameter("pws"));
                HttpSession user = request.getSession();
                cli.setPws("");
                user.setAttribute("cliente", cli);
                msgs.setAttribute("avisos", "Olá " + cli.getEmail() + "");
            } catch (Exception ex) {
                msgs.setAttribute("erros", "Usuario ou senha invalido");
                pagina = "index.jsp?acao=login_usuario";
            }
        }

        if (acao.equals("edit")) {
            // CADASTRO
            try {
                Usuario cli = new Usuario();
                CtrlCliente ctrlcli = new CtrlCliente();
                cli.setId(Long.parseLong(request.getParameter("iduser")));
                cli.setNome(request.getParameter("nome"));
                if (!request.getParameter("data").equals("")) {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(sdf.parse(request.getParameter("data")));
                    cli.setDataNasc(cal);
                }

                cli.setEmail(request.getParameter("email"));
                cli.setPws(request.getParameter("pws"));
                if (request.getParameter("tipo").equals("1")) {
                    cli.setAdmin(true);
                } else {
                    cli.setAdmin(false);
                }

                if (request.getParameter("ativo").equals("1")) {
                    cli.setAtivo(true);
                } else {
                    cli.setAtivo(false);
                }
                cli.setComplemento(request.getParameter("comp"));
                cli.setNumero(request.getParameter("num"));
                cli.getEndereco().setCep(request.getParameter("cep"));
                cli.getEndereco().setLogradouro(request.getParameter("rua"));
                cli.getEndereco().setBairro(request.getParameter("bairro"));
                cli.getEndereco().setCidade(request.getParameter("cidade"));
                cli.getEndereco().setUf(request.getParameter("uf"));

                cli.validar(request.getParameter("confpws"));
                ctrlcli.editar(cli);
                msgs.setAttribute("avisos", "Editado com sucesso");
                pagina = "admin/admin.jsp?acao=lista_cli";
            } catch (Exception ex) {
                msgs.setAttribute("erros", ex.getMessage().replace("\n", "<br>"));
                pagina = "admin/admin.jsp?acao=edit_user&iduser=" + request.getParameter("iduser");
            }
        }

        if (acao.equals("off")) {
            HttpSession user = request.getSession();
            //Remove um item da session
            //user.removeAttribute("cliente");
            //Apaga a session user
            user.invalidate();
        }

        return pagina;
    }

}
