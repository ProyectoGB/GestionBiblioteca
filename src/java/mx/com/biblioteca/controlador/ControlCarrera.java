/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mx.com.biblioteca.modelo.CarreraDAO;
import mx.com.biblioteca.modelo.Session;
import mx.com.biblioteca.modelo.beans.Carrera;

/**
 *
 * @author DanielHernandezReyes
 */
@WebServlet(name = "ControlCarrera", urlPatterns = {"/ControlCarrera"})
public class ControlCarrera extends HttpServlet {


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
            ArrayList<Carrera> lis;
            CarreraDAO crl;
            Carrera carrOper;
            switch(clave){
                case "sear":
                    carrOper = new Carrera();
                    carrOper.setIdCarrera(Integer.parseInt(request.getParameter("idCarrera")));
                    
                    crl = new CarreraDAO();
                    lis = crl.buscarCarrera(carrOper);
                    sec.setListaCarrera(lis);
                    
                    sec.setMensaje("Lista generada");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("career/career.jsp");
                    break;
                case "addC":
                    carrOper = new Carrera();
                    carrOper.setNombre(request.getParameter("idC"));
                    carrOper.setEstado((request.getParameter("eTa")==null?"EX":"AC"));
                    this.validarData(carrOper);
                    
                    crl = new CarreraDAO();
                    crl.nuevaCarrera(carrOper);
                    sec.setMensaje("Carrera agregada");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("career/career.jsp");
                    break;
                case "chan":
                    carrOper = new Carrera();
                    carrOper.setIdCarrera( Integer.parseInt( request.getParameter("idCarrera")) ) ;
                    crl = new CarreraDAO();
                    
                    carrOper = crl.buscarNC(carrOper);
                    
                    lis = new ArrayList<>();
                    lis.add(carrOper);
                    lis.add( new Carrera());
                    
                    sec.setListaCarrera(lis);
                    sec.setMensaje("Datos obtenidos");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("career/career.jsp");
                    break;
                case "mOdi": //revizar
                    carrOper = new Carrera();
                    carrOper.setIdCarrera(Integer.parseInt(request.getParameter("idenT")));
                    carrOper.setNombre(request.getParameter("nomT"));
                    carrOper.setEstado((request.getParameter("std"))==null?"EX":"AC" );
                    this.validarData(carrOper);
                    
                    crl = new CarreraDAO();
                    crl.modificarCarrera(carrOper);
                    sec.setMensaje("Cambios registrados");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("career/career.jsp");
                    break;
            }
            
        } catch (SQLException ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj("Error en la conexión con el SGBD:");
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/session/home.jsp");
            response.sendRedirect("error/error.jsp");
        } catch (NumberFormatException ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj("El identificador proporcionado no es valido:");
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

    private void validarData(Carrera carr) throws Exception {
        if(carr.getNombre() == null)
            throw new Exception("No agrego caracteres a el nombre.");
        if(carr.getNombre().equals(""))
            throw new Exception("El nombre estan vacios.");
        if(carr.getNombre().length() > 250)
            throw new Exception("La longitun del nombre es demaciado grande.");
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
