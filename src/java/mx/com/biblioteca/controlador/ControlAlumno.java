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
import mx.com.biblioteca.modelo.AlumnoDAO;
import mx.com.biblioteca.modelo.CarreraDAO;
import mx.com.biblioteca.modelo.Session;
import mx.com.biblioteca.modelo.beans.Alumno;
import mx.com.biblioteca.modelo.beans.Carrera;

/**
 *
 * @author DanielHernandezReyes
 */
@WebServlet(name = "ControlAlumno", urlPatterns = {"/ControlAlumno"})
public class ControlAlumno extends HttpServlet {

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
        HttpSession sesion = request.getSession();
        Session sec = (Session) sesion.getAttribute("user");
        try {
            ArrayList<Alumno> lis;
            AlumnoDAO crl;
            Alumno aluOper;
            Carrera c;
            switch(clave){
                case "sear":
                    aluOper = new Alumno();
                    aluOper.setMatricula(request.getParameter("buscar"));
                    
                    crl = new AlumnoDAO();
                    lis = crl.buscarAlumno(aluOper);
                    sec.setListaAlumno(lis);
                    sec.setMensaje("Lista generada");
                    // ******************
                    this.cargarCarreras(sec);
                    // ******************
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("student/addStudent.jsp");
                    break;
                case "chan":
                    aluOper = new Alumno();
                    aluOper.setMatricula(request.getParameter("buscar"));
                    crl = new AlumnoDAO();
                    aluOper = crl.buscarUA(aluOper);
                    
                    lis = new ArrayList<>();
                    lis.add(aluOper);
                    lis.add( new Alumno());
                    
                    sec.setListaAlumno(lis);
                    sec.setMensaje("Datos obtenidos");
                    // ******************
                    this.cargarCarreras(sec);
                    // ******************
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("student/changeStudent.jsp");
                    break;
                case "addA":
                    aluOper = new Alumno();
                    aluOper.setMatricula(request.getParameter("mrt"));
                    aluOper.setApePaterno(request.getParameter("appP"));
                    aluOper.setApeMaterno(request.getParameter("appM"));
                    aluOper.setNombre(request.getParameter("nbr1"));
                    aluOper.setNombre2(request.getParameter("nbr2"));
                    aluOper.setNombre3(request.getParameter("nbr3"));
                    aluOper.setNombre4(request.getParameter("nbr4"));
                    c = new Carrera();
                    c.setIdCarrera(Integer.parseInt(request.getParameter("carT")));
                    aluOper.setCarrera(c);
                    aluOper.setEstado((request.getParameter("estado")==null?"EX":"AC"));
                    this.validarPar(aluOper);
                    this.validarNombres(aluOper);
                    
                    crl = new AlumnoDAO();
                    crl.nuevoAlumno(aluOper);
                    sec.setMensaje("Alumno agregado");
                    sesion.setAttribute("user", sec);
                    // ******************
                    this.cargarCarreras(sec);
                    // ******************
                    response.sendRedirect("student/addStudent.jsp");
                    break;
                case "modA":
                    aluOper = new Alumno();
                    aluOper.setMatricula(request.getParameter("matri"));
                    aluOper.setApePaterno(request.getParameter("apPP"));
                    aluOper.setApeMaterno(request.getParameter("apMM"));
                    aluOper.setNombre(request.getParameter("nb1"));
                    aluOper.setNombre2(request.getParameter("nb2"));
                    aluOper.setNombre3(request.getParameter("nb3"));
                    aluOper.setNombre4(request.getParameter("nb4"));
                    c = new Carrera();
                    c.setIdCarrera(Integer.parseInt(request.getParameter("ca")));
                    aluOper.setCarrera(c);
                    aluOper.setEstado((request.getParameter("esta")==null?"EX":"AC"));
                    this.validarPar(aluOper);
                    this.validarNombres(aluOper);
                    crl = new AlumnoDAO();
                    crl.modificarAlumno(aluOper);
                    
                    ArrayList<Alumno> oc = new ArrayList<>();
                    oc.add(aluOper);
                    sec.setMensaje("Alumno modificado");
                    sec.setListaAlumno(oc);
                    sesion.setAttribute("user", sec);
                    response.sendRedirect("student/changeStudent.jsp");
                    break;
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
    
    private void validarNombres(Alumno a) throws Exception{
        if(!"".equals(a.getNombre()) && a.getNombre2().equals("") && a.getNombre3().equals("") && a.getNombre4().equals("")){
            validarNombre("primer", a.getNombre());
        } else {
            if(!"".equals(a.getNombre()) && !"".equals(a.getNombre2()) && a.getNombre3().equals("") && a.getNombre4().equals("")){
                validarNombre("primer", a.getNombre());
                validarNombre("segundo", a.getNombre2());
            } else {
                if(!"".equals(a.getNombre()) && !"".equals(a.getNombre2()) && !"".equals(a.getNombre3()) && a.getNombre4().equals("")){
                    validarNombre("primer", a.getNombre());
                    validarNombre("segundo", a.getNombre2());;
                    validarNombre("tercero", a.getNombre());
                } else {
                    if(!"".equals(a.getNombre()) && !"".equals(a.getNombre2()) && !"".equals(a.getNombre3()) && !"".equals(a.getNombre4())){
                        validarNombre("primer", a.getNombre());
                        validarNombre("segundo", a.getNombre2());;
                        validarNombre("tercero", a.getNombre());
                        validarNombre("cuarto", a.getNombre());
                    } else {
                        throw new Exception("El nombre(s) no son validos");
                    }
                }
            }
        }
    }
    
    private void validarNombre(String tex,String ser) throws Exception {
        if(ser == null)
            throw new Exception("No agrego caracteres al "+tex+" nombre.");
        if(ser.equals(""))
            throw new Exception("El "+tex+" nombre esta vacio.");
        if(ser.length() > 50)
            throw new Exception("La longitun del "+tex+" nombre es demaciado grande.");
    }
    
    private void validarPar(Alumno user) throws Exception {
        if(user.getApePaterno()== null )
            throw new Exception("No agrego caracteres al apellido paterno.");
        if(user.getApePaterno().equals("") )
            throw new Exception("El apellido paterno estan vacio.");
        if(user.getApePaterno().length() > 50)
            throw new Exception("La longitun del apellido paterno son incorrectos.");
    }
    
    private void cargarCarreras(Session sec) throws Exception{
        CarreraDAO cl = new CarreraDAO();
        ArrayList<Carrera> ls = cl.listarCarrera();
        sec.setListaCarrera(ls);
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
