/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.controlador;

import java.io.IOException;
import java.sql.SQLException;
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
 * @author danielhernandezreyes
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            if(clave.equals("log")) {
                Usuario user = new Usuario();
                user.setIdUsuario(request.getParameter("idUsuario"));
                user.setContra(request.getParameter("contra"));
                UsuarioDAO crl = new UsuarioDAO();
                user = crl.iniciarSesion(user);
                
                if(user != null){
                    HttpSession sesion = request.getSession();
                    Session sec = new Session(user, null);
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("session/home.jsp");
                }else{
                    response.sendRedirect("login.jsp");
                }
                
            } else {
                HttpSession sesion = request.getSession();
                Session sec = (Session)sesion.getAttribute("user");
                
                UsuarioDAO crl = new UsuarioDAO();
                crl.cerrarSesion(sec.getUser());
                sesion.invalidate();
                
                response.sendRedirect("login.jsp");
            }
            
        } catch (SQLException ex) {
            request.setAttribute("msj", ex.getMessage());
            request.setAttribute("ex", ex);
            response.sendRedirect("error/error.jsp");
        } catch (Exception ex) {
            request.setAttribute("msj", ex.getMessage());
            request.setAttribute("ex", ex);
            response.sendRedirect("error/error.jsp");
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
    }// </editor-fold>

}
