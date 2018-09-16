package logica;

import controller.CtrlCliente;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Endereco;
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
                pagina = "index.jsp";
            }
        }

        if (acao.equals("login")) {
            //LOGIN
            try {
                CtrlCliente ctrlcli = new CtrlCliente();
                Usuario cli = ctrlcli.login(request.getParameter("email"), request.getParameter("pws"));
                if (cli.isAtivo()) {
                    HttpSession user = request.getSession();
                    cli.setPws("");
                    user.setAttribute("cliente", cli);
                    msgs.setAttribute("avisos", "Olá " + cli.getEmail() + "");
                } else {
                    msgs.setAttribute("erros", "Usuario ou senha invalido");
                }
            } catch (Exception ex) {
                msgs.setAttribute("erros", "Usuario ou senha invalido");
                pagina = "index.jsp";
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

                if (!ctrlcli.enderecoExiste(cli.getEndereco().getCep())) {
                    ctrlcli.cadastrar(cli.getEndereco());
                }

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

        if (acao.equals("editar_perfil")) {
            CtrlCliente ctrl = new CtrlCliente();
            HttpSession user = request.getSession();
            Usuario dados_user = (Usuario) user.getAttribute("cliente");
            dados_user = ctrl.buscaCliente(dados_user.getId());

            String tipo = request.getParameter("tipo");
            if (tipo.equals("alt_dados")) {
                try {
                    String nome = request.getParameter("nome");
                    if (nome.equals("")) {
                        throw new Exception("Campo NOME está vazio");
                    }
                    dados_user.setNome(nome);
                    ctrl.editar(dados_user);
                    msgs.setAttribute("avisos", "Dados alterados com sucesso");
                    request.getSession().setAttribute("cliente", dados_user);
                    pagina = "index.jsp";
                } catch (Exception ex) {
                    msgs.setAttribute("erros", ex.getMessage());
                    pagina = "index.jsp?acao=alterar";
                }
            }

            if (tipo.equals("alt_senha")) {
                try {
                    String antigapws = request.getParameter("ant_senha");
                    String novapws = request.getParameter("nova_senha");
                    String erros = "";
                    //VALIDAÇÃO
                    if (antigapws.equals("")) {
                        erros += "Campo Senha Antiga está em branco.\n";
                    } else if (!dados_user.getPws().equals(antigapws)) {
                        erros += "Senha antiga inválida";
                    }
                    if (novapws.equals("")) {
                        erros += "Campo Senha Nova está em branco.\n";
                    } else if (novapws.length() < 8) {
                        erros += "Nova senha deve ter no mínimo 8 caracteres.\n";
                    }

                    if (!erros.equals("")) {
                        throw new Exception(erros);
                    }

                    dados_user.setPws(novapws);
                    ctrl.editar(dados_user);
                    msgs.setAttribute("avisos", "Sua senha foi alterada com sucesso.");
                    pagina = "index.jsp";
                } catch (Exception ex) {
                    msgs.setAttribute("erros", ex.getMessage().replace("\n", "<br>"));
                    pagina = "index.jsp?acao=alterar";
                }

            }

            if (tipo.equals("alt_endereco")) {
                try {
                    Usuario cli = (Usuario) request.getSession().getAttribute("cliente");
                    cli = ctrl.buscaCliente(dados_user.getId());
                    CtrlCliente ctrlcli = new CtrlCliente();
                    cli.setComplemento(request.getParameter("comp"));
                    cli.setNumero(request.getParameter("num"));
                    cli.getEndereco().setCep(request.getParameter("cep"));
                    cli.getEndereco().setLogradouro(request.getParameter("rua"));
                    cli.getEndereco().setBairro(request.getParameter("bairro"));
                    cli.getEndereco().setCidade(request.getParameter("cidade"));
                    cli.getEndereco().setUf(request.getParameter("uf"));
                    cli.validarEndereco();

                    if (!ctrlcli.enderecoExiste(cli.getEndereco().getCep())) {
                        ctrlcli.cadastrar(cli.getEndereco());
                    }
                    ctrlcli.editar(cli);
                    user.setAttribute("cliente", cli);
                    msgs.setAttribute("avisos", "Seu endereço foi alterado com sucesso.");
                    pagina = "index.jsp";
                } catch (Exception ex) {
                    msgs.setAttribute("erros", ex.getMessage().replace("\n", "<br>"));
                    pagina = "index.jsp?acao=alterar";
                }

            }
        }

        return pagina;
    }

}
