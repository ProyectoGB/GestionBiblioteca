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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mx.com.biblioteca.modelo.ServicioDAO;
import mx.com.biblioteca.modelo.Session;
import mx.com.biblioteca.modelo.beans.Servicio;

/**
 *
 * @author DanielHernandezReyes
 */
@WebServlet(name = "ControlServicio", urlPatterns = {"/ControlServicio"})
public class ControlServicio extends HttpServlet {

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
        try {
            ArrayList<Servicio> lis;
            ServicioDAO crl;
            Servicio carrOper;
            switch(clave){
                
            }
        } catch (SQLException ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj("Error en la conexión con el SGBD:");
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/session/home.jsp");
            response.sendRedirect("error/error.jsp");
        } catch (Exception ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj(ex.getMessage());
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/session/home.jsp");
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
    }

}
