/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.util.ArrayList;
import mx.com.biblioteca.modelo.beans.Carrera;
import mx.com.biblioteca.modelo.beans.Servicio;
import mx.com.biblioteca.modelo.beans.Usuario;

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
    private String errorMsj;
    private String errorExe;
    private String errorUrl;

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
    
}
