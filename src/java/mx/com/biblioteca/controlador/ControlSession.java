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
        String clave = request.getParameter("clave");
        HttpSession sesion = request.getSession();
        Session sec = (Session) sesion.getAttribute("user");
        Usuario user = sec.getUser();
        try {
            UsuarioDAO crl;
            switch(clave){
                case "dataP":
                    Usuario userOper = new Usuario();
                    userOper.setNombre(request.getParameter("nombre"));
                    userOper.setApePaterno(request.getParameter("apePa"));
                    validarData(userOper);
                    user.setNombre(userOper.getNombre());
                    user.setApePaterno(userOper.getApePaterno());
                    
                    crl = new UsuarioDAO();
                    int r = crl.cambiarDatosPersonales(user);
                    if(r == 1)
                        sec.setMensaje("Datos personales actualizados");
                    else
                        sec.setMensaje("Los cambios no se realizarón");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("session/home.jsp");
                    break;
                case "pS":
                    Usuario userAc = new Usuario();
                    Usuario userNu = new Usuario();
                    userAc.setContra(request.getParameter("pasA"));
                    userNu.setContra(request.getParameter("pasN"));
                    
                    this.comparar(userAc, user);
                    this.validarPass(userNu);
                    user.setContra(userNu.getContra());
                    
                    crl = new UsuarioDAO();
                    crl.cambiarPassword(user);
                    sec.setMensaje("La contraseña fue actualizada.");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("session/home.jsp");
                    break;
            }
            
        } catch (SQLException ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj("Error en la conexión con el SGBD:");
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/session/session.jsp");
            response.sendRedirect("error/error.jsp");
        } catch (Exception ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj(ex.getMessage());
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/session/session.jsp");
            response.sendRedirect("error/error.jsp");
        }
        
    }
    
    private void comparar(Usuario userA, Usuario userB) throws Exception{
        if(userA.getContra().length() != userB.getContra().length())
            throw new Exception("La contraseña proporcionada no coincide con la actual.");
        for (int i = 0; i < userA.getContra().length(); i++) {
            if(userA.getContra().charAt(i)!=userB.getContra().charAt(i))
                throw new Exception("La contraseña proporcionada no coincide con la actual.");
        }
    }
    
    private void validarData(Usuario user) throws Exception {
        if(user.getNombre() == null || user.getApePaterno()== null )
            throw new Exception("No agrego caracteres a el nombre y/o apellido.");
        if(user.getNombre().equals("") || user.getApePaterno().equals("") )
            throw new Exception("El nombre y/o apellido estan vacios.");
        if(user.getNombre().length() > 50 && user.getApePaterno().length() > 50)
            throw new Exception("La longitun del nombre y/o apellido son incorrectos.");
    }
    private void validarPass(Usuario user) throws Exception {
        if(user.getContra() == null )
            throw new Exception("No agrego caracteres a la contraseña.");
        if(user.getContra().equals("") )
            throw new Exception("La contraseña esta vacia.");
        if(user.getContra().length() < 8)
            throw new Exception("La longitun de la contraseña es menor de 8 caracteres.");
        if(user.getContra().length() > 20)
            throw new Exception("La longitun del la contraseña excede los caracteres aceptados.");
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
