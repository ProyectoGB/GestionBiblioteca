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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            if(clave.equals("log")){
                Usuario user = new Usuario();
                user.setIdUsuario(request.getParameter("idUsuario"));
                user.setContra(request.getParameter("contra"));

                UsuarioDAO crl = new UsuarioDAO();
                user = crl.iniciarSesion(user);
                if(user != null){
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("user", user);
                    request.getRequestDispatcher("session/home.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                
            }else {
                HttpSession sesion = request.getSession();
                Usuario user = (Usuario) sesion.getAttribute("user");
                sesion.invalidate();
                request.getRequestDispatcher("session/home.jsp").forward(request, response);
            }
            
        } catch (SQLException ex) {
            request.setAttribute("msj", ex.getMessage());
            request.setAttribute("ex", ex);
            request.getRequestDispatcher("error/error.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("msj", ex.getMessage());
            request.setAttribute("ex", ex);
            request.getRequestDispatcher("error/error.jsp").forward(request, response);
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
