/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Logica;

@WebServlet("/sys")
@MultipartConfig( // fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
	//  maxFileSize = 1024 * 1024 * 10, // 10 MB
	//  maxRequestSize = 1024 * 1024 * 15, // 15 MB 
	//  location = "/"//para uso do glassfish. Retirar no Tomcat
	)

public class FrontController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");

	String caminho = "logica.";
	String parametro = caminho + request.getParameter("logica");
	String nomeDaClasse = parametro;
	try {
	    Class<?> classe = Class.forName(nomeDaClasse);
	    Logica logica = (Logica) classe.newInstance();
	    // Recebe o String após a execução da lógica
	    String pagina = logica.executa(request, response);
	    // Faz o forward para a página JSP
	    // request.getRequestDispatcher(pagina).forward(request, response);
            response.sendRedirect(pagina);
	} catch (Exception e) {
	    System.err.println("Erro na logica: " + e.toString());
	    throw new ServletException("A lógica de negócios causou uma exceção.", e);
	}

    }

//Codido doGET e doPOST
//<editor-fold>
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}