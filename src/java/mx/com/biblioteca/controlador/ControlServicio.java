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
            Servicio serOper;
            switch(clave){
                case "sear":
                    serOper = new Servicio();
                    int id = Integer.parseInt(request.getParameter("idServicio"));
                    serOper.setIdServicio(id);
                    
                    crl = new ServicioDAO();
                    lis = crl.buscarServicio(serOper);
                    sec.setListaServicio(lis);
                    
                    sec.setMensaje("Lista generada");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("service/service.jsp");
                    break;
                case "addS":
                    serOper = new Servicio();
                    serOper.setNombre(request.getParameter("idC"));
                    serOper.setEstado((request.getParameter("eTa")==null?"EX":"AC"));
                    this.validarData(serOper);
                    
                    crl = new ServicioDAO();
                    crl.nuevoServicio(serOper);
                    sec.setMensaje("Servicio agregado");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("service/service.jsp");
                    break;
                case "chan":
                    serOper = new Servicio();
                    int idD = Integer.parseInt( request.getParameter("idServicio"));
                    serOper.setIdServicio(idD);
                    crl = new ServicioDAO();
                    
                    serOper = crl.buscarNS(serOper);
                    
                    lis = new ArrayList<>();
                    lis.add(serOper);
                    lis.add( new Servicio());
                    
                    sec.setListaServicio(lis);
                    sec.setMensaje("Datos obtenidos");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("service/service.jsp");
                    break;
                case "mOdi":
                    serOper = new Servicio();
                    serOper.setIdServicio(Integer.parseInt(request.getParameter("idenT")));
                    serOper.setNombre(request.getParameter("nomT"));
                    serOper.setEstado((request.getParameter("std"))==null?"EX":"AC" );
                    this.validarData(serOper);
                    
                    crl = new ServicioDAO();
                    crl.modificarServicio(serOper);
                    sec.setMensaje("Cambios registrados");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("service/service.jsp");
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

    private void validarData(Servicio ser) throws Exception {
        if(ser.getNombre() == null)
            throw new Exception("No agrego caracteres a el nombre.");
        if(ser.getNombre().equals(""))
            throw new Exception("El nombre estan vacios.");
        if(ser.getNombre().length() > 250)
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
    }

}
