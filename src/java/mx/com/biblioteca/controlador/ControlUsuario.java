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
            UsuarioDAO crl;
            ArrayList<Usuario> lu;
            Usuario userOper = new Usuario();
            switch(clave){
                case "sear":
                    userOper.setIdUsuario(request.getParameter("idUsuario"));
                    crl = new UsuarioDAO();

                    ArrayList<Usuario> list = crl.buscar(userOper);
                    sec.setListaUsuario(list);
                    sec.setMensaje("Lista generada");

                    sesion.setAttribute("user", sec);
                    response.sendRedirect("user/addUser.jsp");
                    break;
                case "agre":
                    userOper.setIdUsuario(request.getParameter("username"));
                    userOper.setApePaterno(request.getParameter("apePaterno"));
                    userOper.setNombre(request.getParameter("nombre"));
                    userOper.setContra("itsoeh2020");
                    userOper.setEstado( (request.getParameter("estado")==null)?"IAC":"BLO");
                    userOper.setTipo(request.getParameter("tipo"));
                    
                    crl = new UsuarioDAO();
                    boolean es = crl.nuevoUsuario(userOper);
                    sec.setMensaje((es)?"Usuario agregado":"Usuario no agregado");
                    
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("user/addUser.jsp");
                    break;
                case "chan":
                    userOper.setIdUsuario(request.getParameter("idUsuario"));
                    crl = new UsuarioDAO();
                    userOper = crl.buscarU(userOper);
                    
                    lu = new ArrayList<>();
                    lu.add(userOper);
                    
                    sec.setListaUsuario(lu);
                    sec.setMensaje("Datos obtenidos");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("user/changeUser.jsp");
                    break;
                case "actu":
                    userOper.setIdUsuario(request.getParameter("username"));
                    userOper.setApePaterno(request.getParameter("apP"));
                    userOper.setNombre(request.getParameter("nom"));
                    userOper.setEstado( (request.getParameter("estado")==null)?"IAC":"BLO");
                    userOper.setTipo(request.getParameter("tipo"));
                    
                    crl = new UsuarioDAO();
                    crl.modificarUsuario(userOper);
                    Usuario mod = new Usuario("--","--","--","BLO",null,"ENC");
                    lu = new ArrayList<>();
                    lu.add(mod);
                    lu.add(userOper);
                    sec.setListaUsuario(lu);
                    sec.setMensaje("A");
                    
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("user/changeUser.jsp");
                    break;
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
