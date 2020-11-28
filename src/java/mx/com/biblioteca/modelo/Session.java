/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import mx.com.biblioteca.modelo.beans.Usuario;

/**
 *
 * @author DanielHernandezReyes
 */
public class Session {
    
    private Usuario user;
    private String mensaje;

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
    
    
    
}
