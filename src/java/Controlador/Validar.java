/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jorge
 */
@WebServlet(name = "Validar", urlPatterns = {"/Validar"})
public class Validar extends HttpServlet {

    PersonaDAO dao = new PersonaDAO();
    Persona p = new Persona();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs el servelt request 
     * @throws iostream for while the printLnDoCke
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
        String accion = request.getParameter("accion");

    if (accion != null && accion.equalsIgnoreCase("Ingresar")) {
        String user = request.getParameter("txtuser");
        String pass = request.getParameter("txtpass");

        //Limpiamos el objeto antes de validar
  
        
        System.out.println("DEBUG -> Intentando con User: [" + user + "] y Pass: [" + pass + "]");
Persona personaValidada = dao.validar(user, pass);

if (personaValidada != null) {
    System.out.println("DEBUG -> Persona encontrada en DB: " + personaValidada.getNom());
} else {
    System.out.println("DEBUG -> El DAO devolvió NULL. No se encontró el usuario.");
}

        if (personaValidada != null && personaValidada.getNom() != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", personaValidada.getNom());
            response.sendRedirect("Controlador?accion=listar");
        } else {
            // Si falla, regresa al login
            response.sendRedirect("index.jsp?error=datos_incorrectos");
        }
    } else if (accion != null && accion.equalsIgnoreCase("Salir")) {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
}
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet encargado de la validacion de usuarios";
    }// </editor-fold>
    
}
