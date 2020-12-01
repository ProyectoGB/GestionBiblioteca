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
import mx.com.biblioteca.modelo.AlumnoDAO;
import mx.com.biblioteca.modelo.ServicioDAO;
import mx.com.biblioteca.modelo.Session;
import mx.com.biblioteca.modelo.VisitaDAO;
import mx.com.biblioteca.modelo.beans.Alumno;
import mx.com.biblioteca.modelo.beans.Servicio;
import mx.com.biblioteca.modelo.beans.Visita;

/**
 *
 * @author DanielHernandezReyes
 */
@WebServlet(name = "ControlVisita", urlPatterns = {"/ControlVisita"})
public class ControlVisita extends HttpServlet {

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
        Alumno aluPro;
        Visita visPro;
        VisitaDAO crl;
        try {
            switch(clave){
                case "seaV":
                    aluPro = new Alumno();
                    aluPro.setMatricula(request.getParameter("matricula"));
                    visPro = new Visita();
                    
                    AlumnoDAO al = new AlumnoDAO();
                    aluPro = al.dataAlumnoVisita(aluPro);
                    
                    visPro.setAlumno(aluPro);
                    visPro.dataInicio();
                    
                    crl = new VisitaDAO();
                    Visita visTe = crl.buscarTer(visPro);
                    if(visTe != null){ // terminar una visita
                        ArrayList<Servicio> liS = crl.datosVisita(visPro);
                        visPro.setServicios(liS);
                        //crl.terminarVisita(visPro);
                        sec.setEstadoVisita(true);// #########################3 cambiar a true
                        ArrayList<Visita> li = new ArrayList<>();
                        li.add(visPro);
                        li.add(new Visita());
                        sec.setListaVisita(li);
                        sec.setMensaje("Datos obtenidos de visita");
                        sesion.setAttribute("user", sec);
                        response.sendRedirect("/GestionBiblioteca/visit/addVisit.jsp");
                    } else {
                        ArrayList<Alumno> ali = new ArrayList<>();
                        ali.add(aluPro);
                        sec.setListaAlumno(ali);
                        sec.setMensaje("Datos obtenidos");
                        sesion.setAttribute("user", sec);
                        response.sendRedirect("/GestionBiblioteca/TempControlServicio");
                    }
                    break;
                case "visNue":
                    visPro = new Visita();
                    visPro.dataInicio();
                    Alumno alu = new Alumno();
                    alu.setMatricula(request.getParameter("alumV"));
                    if(alu.getMatricula() == null)
                        throw new NumberFormatException("La matricula del alumno no esta espesificada.");
                    visPro.setAlumno(alu);
                    
                    ArrayList<Servicio> serL = new ArrayList<>();
                    String[] serLis = (String[])request.getParameterValues("tipSer");
                    if(serLis == null)
                        throw new NumberFormatException("No hay servicios seleccionados.");
                    for(String x : serLis){
                        if(x!=null){
                            Servicio s = new Servicio();
                            s.setIdServicio(Integer.parseInt(x));
                            serL.add(s);
                        }
                    }
                    visPro.setServicios(serL);
                    VisitaDAO cr = new VisitaDAO();
                    cr.visitaNueva(visPro);
                    sec.setMensaje("Visita registrada");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("/GestionBiblioteca/TempControlServicio");
                    break;
                case "visTr":
                    visPro = new Visita();
                    visPro.dataFin();
                    visPro.setIdVisita(Integer.parseInt(request.getParameter("idV")));
                    crl = new VisitaDAO();
                    crl.terminarVisita(visPro);
                    sec.setMensaje("Visita terminada");
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("/GestionBiblioteca/TempControlServicio");
                    break;
                    //VisitaDAO crlll = new VisitaDAO();
                    //crlll.visitaNueva(visPro);
                    //    ArrayList<Visita> li = new ArrayList<>();
                    //    li.add(visPro);
                    //    sec.setListaVisita(li);
            }
            
        } catch (SQLException ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj("Error en la conexión con el SGBD:");
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/session/home.jsp");
            response.sendRedirect("error/error.jsp");
        } catch (NumberFormatException ex) {
            sesion.setAttribute("user", sec);
            sec.setErrorMsj("El alumno:"); // cambiar el alumno
            sec.setErrorExe(ex.toString());
            sec.setErrorUrl("/GestionBiblioteca/TempControlServicio");
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
    }// </editor-fold>

}
