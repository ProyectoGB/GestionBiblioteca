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
public class Carrera {
    private int idCarrera;
    private String nombre;
    private String estado;

    public Carrera() {
    }

    public Carrera(int idCarrera, String nombre, String estado) {
        this.idCarrera = idCarrera;
        this.nombre = nombre;
        this.estado = estado;
    }

    public int getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(int idCarrera) {
        this.idCarrera = idCarrera;
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
