/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo.beans;

/**
 *
 * @author DanielHernandezReyes
 */
public class Servicio {
    private int idServicio;
    private String nombre;
    private String estado;

    public Servicio() {
    }

    public Servicio(int idServicio, String nombre, String estado) {
        this.idServicio = idServicio;
        this.nombre = nombre;
        this.estado = estado;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
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
    
    
}
