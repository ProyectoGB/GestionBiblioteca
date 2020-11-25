/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

/**
 *
 * @author DanielHernandezReyes
 */
public class Usuario {
    private String idUsuario;
    private String apePaterno;
    private String nombre;
    private String estado;
    private String contra;
    private String tipo;

    public Usuario() {
    }

    public Usuario(String idUsuario, String apePaterno, String nombre, String estado, String contra, String tipo) {
        this.idUsuario = idUsuario;
        this.apePaterno = apePaterno;
        this.nombre = nombre;
        this.estado = estado;
        this.contra = contra;
        this.tipo = tipo;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getApePaterno() {
        return apePaterno;
    }

    public void setApePaterno(String apePaterno) {
        this.apePaterno = apePaterno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
}
