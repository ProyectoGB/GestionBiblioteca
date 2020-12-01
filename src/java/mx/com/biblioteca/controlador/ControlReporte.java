/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mx.com.biblioteca.modelo.ReporteDAO;
import mx.com.biblioteca.modelo.Session;
import mx.com.biblioteca.modelo.beans.Reporte;

/**
 *
 * @author DanielHernandezReyes
 */
@WebServlet(name = "ControlReporte", urlPatterns = {"/ControlReporte"})
public class ControlReporte extends HttpServlet {
    
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
        Reporte repPro;
        ReporteDAO crl;
        ArrayList<Reporte> lis;
        try {
            switch(clave){
                case "sear":
                    repPro = new Reporte();
                    repPro.setIdReporte(Integer.parseInt(request.getParameter("buscar")));
                    lis = new ArrayList<>();
                    crl = new ReporteDAO();
                    lis = crl.listarReporte(repPro);
                    sec.setListaReporte(lis);
                    sec.setMensaje("Lista generada");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("report/addReport.jsp");
                    break;
                case "chan":
                    repPro = new Reporte();
                    repPro.setIdReporte(Integer.parseInt(request.getParameter("buscar")));
                    crl = new ReporteDAO();
                    repPro = crl.buscarReporte(repPro);
                    repPro = crl.datosReporte(repPro);
                    lis = new ArrayList<>();
                    lis.add(repPro);
                    sec.setListaReporte(lis);
                    sec.setMensaje("Datos obtenidos");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("report/changeReport.jsp");
                    break;
                case "geRep":
                    repPro = new Reporte();
                    repPro.setFecha(this.convDate(request.getParameter("fechH")));
                    repPro.setFechaInicio(this.convDate(request.getParameter("fechI")));
                    repPro.setFechaFin(this.convDate(request.getParameter("fechF")));
                    repPro.setIdUsuario(sec.getUser().getIdUsuario());
                    crl = new ReporteDAO();
                    crl.nuevoReporte(repPro);
                    sec.setMensaje("Reporte generado");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("report/addReport.jsp");
                    break;
                case "gdoC":
                    repPro = new Reporte();
                    repPro.setIdReporte(Integer.parseInt(request.getParameter("idrep")));
                    //ads
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
            sec.setErrorUrl("/GestionBiblioteca/report/addReport.jsp");
            response.sendRedirect("error/error.jsp");
        } catch (Exception ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj(ex.getMessage());
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/session/home.jsp");
            response.sendRedirect("error/error.jsp");
        }
        
    }

    private Date convDate(String tex) throws ParseException{
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaDate = (Date) formato.parse(tex);
        return fechaDate;
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
