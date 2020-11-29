/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mx.com.biblioteca.modelo.Session;
import mx.com.biblioteca.modelo.UsuarioDAO;
import mx.com.biblioteca.modelo.beans.Usuario;

/**
 *
 * @author DanielHernandezReyes
 */
@WebServlet(name = "ControlUsuario", urlPatterns = {"/ControlUsuario"})
public class ControlUsuario extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clave = request.getParameter("clave");
        
        try {
            HttpSession sesion = request.getSession();
            Session sec = (Session)sesion.getAttribute("user");
            Usuario user = sec.getUser();
            Usuario u = new Usuario();
            if(clave.equals("b")){
                u.setIdUsuario(request.getParameter("idUsuario"));
                UsuarioDAO crl = new UsuarioDAO();
                ArrayList<Usuario> list = crl.buscar(user, u);
                sec.setListaUsuario(list);
                sec.setMensaje("Lista generada");

                sesion.setAttribute("user", sec);
                response.sendRedirect("user/addUser.jsp");
            } 
            if(clave.equals("a")) {
                u.setIdUsuario(request.getParameter("username"));
                u.setApePaterno(request.getParameter("apePaterno"));
                u.setNombre(request.getParameter("nombre"));
                u.setContra("itsoeh2020");
                u.setEstado( (request.getParameter("estado")==null)?"IAC":"BLO");
                u.setTipo(request.getParameter("tipo"));
                UsuarioDAO crl = new UsuarioDAO();
                boolean es = crl.nuevoUsuario(u);
                if(es){
                    
                    sec.setMensaje("Usuario agregado");
                }else {
                    sec.setMensaje("Usuario no agregado");
                }
                sesion.setAttribute("user", sec);
                response.sendRedirect("user/addUser.jsp");
            }
            if(clave.equals("c")) {
                u.setIdUsuario(request.getParameter("idUsuario"));
                UsuarioDAO crl = new UsuarioDAO();
                u = crl.buscarU(user, u);
                ArrayList<Usuario> lu = new ArrayList<>();
                lu.add(u);
                sec.setListaUsuario(lu);
                sec.setMensaje("Datos obtenidos");
                sesion.setAttribute("user", sec);
                response.sendRedirect("user/changeUser.jsp");
            }
        } catch (Exception ex) {
            request.setAttribute("msj", ex.getMessage());
            request.setAttribute("ex", ex);
            request.getRequestDispatcher("error/error.jsp");
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
