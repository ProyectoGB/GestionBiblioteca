/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.util.ArrayList;
import mx.com.biblioteca.modelo.beans.Alumno;
import mx.com.biblioteca.modelo.beans.Carrera;
import mx.com.biblioteca.modelo.beans.Reporte;
import mx.com.biblioteca.modelo.beans.Servicio;
import mx.com.biblioteca.modelo.beans.Usuario;
import mx.com.biblioteca.modelo.beans.Visita;

/**
 *
 * @author DanielHernandezReyes
 */
public class Session {
    
    private Usuario user;
    private String mensaje;
    private ArrayList<Usuario> listaUsuario;
    private ArrayList<Carrera> listaCarrera;
    private ArrayList<Servicio> listaServicio;
    private ArrayList<Alumno> listaAlumno;
    private ArrayList<Visita> listaVisita;
    private ArrayList<Reporte> listaReporte;
    private String errorMsj;
    private String errorExe;
    private String errorUrl;
    private boolean estadoVisita;

    public Session() {
    }

    public Session(Usuario user, String mensaje) {
        this.user = user;
        this.mensaje = mensaje;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public ArrayList<Usuario> getListaUsuario() {
        return listaUsuario;
    }

    public void setListaUsuario(ArrayList<Usuario> listaUsuario) {
        this.listaUsuario = listaUsuario;
    }

    public ArrayList<Carrera> getListaCarrera() {
        return listaCarrera;
    }

    public void setListaCarrera(ArrayList<Carrera> listaCarrera) {
        this.listaCarrera = listaCarrera;
    }

    public ArrayList<Servicio> getListaServicio() {
        return listaServicio;
    }

    public void setListaServicio(ArrayList<Servicio> listaServicio) {
        this.listaServicio = listaServicio;
    }

    public ArrayList<Alumno> getListaAlumno() {
        return listaAlumno;
    }

    public void setListaAlumno(ArrayList<Alumno> listaAlumno) {
        this.listaAlumno = listaAlumno;
    }

    public ArrayList<Visita> getListaVisita() {
        return listaVisita;
    }

    public void setListaVisita(ArrayList<Visita> listaVisita) {
        this.listaVisita = listaVisita;
    }

    public ArrayList<Reporte> getListaReporte() {
        return listaReporte;
    }

    public void setListaReporte(ArrayList<Reporte> listaReporte) {
        this.listaReporte = listaReporte;
    }
    
    public String getErrorMsj() {
        return errorMsj;
    }

    public void setErrorMsj(String errorMsj) {
        this.errorMsj = errorMsj;
    }

    public String getErrorExe() {
        return errorExe;
    }

    public void setErrorExe(String errorExe) {
        this.errorExe = errorExe;
    }

    public String getErrorUrl() {
        return errorUrl;
    }

    public void setErrorUrl(String errorUrl) {
        this.errorUrl = errorUrl;
    }

    public boolean isEstadoVisita() {
        return estadoVisita;
    }

    public void setEstadoVisita(boolean estadoVisita) {
        this.estadoVisita = estadoVisita;
    }
    
}
