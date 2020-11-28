/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
@WebServlet(name = "ControlSession", urlPatterns = {"/ControlSession"})
public class ControlSession extends HttpServlet {

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
        try {
            HttpSession sesion = request.getSession();
            Session sec = (Session)sesion.getAttribute("user");
            Usuario user = sec.getUser();
            
            UsuarioDAO crl = new UsuarioDAO();
            user.setNombre(request.getParameter("nombre"));
            user.setApePaterno(request.getParameter("apePa"));
            int r = crl.cambiarDatosPersonales(user);
            if(r == 1){
                String tex = "Datos personales actualizados";
                sec.setMensaje(tex);
                sesion.setAttribute("user", sec);
                response.sendRedirect("session/home.jsp");
                
            } else {
                request.setAttribute("ex", "Los cambios no se ejecutarón");
                response.sendRedirect("error/error.jsp");
            }
        } catch (SQLException ex) {
            request.setAttribute("msj", ex.getMessage());
            request.setAttribute("ex", ex);
            request.getRequestDispatcher("error/error.jsp");
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
