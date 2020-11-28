/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo.beans;

/**
 *
 * @author Equipo: "Los Bellacosos"
 */
public class Alumno {
    private String matricula;
    private String esstado;
    private String apePaterno;
    private String apeMaterno;
    private String nombre;
    private Carrera carrera;

    public Alumno() {
    }

    public Alumno(String matricula, String esstado, String apePaterno, String apeMaterno, String nombre, Carrera carrera) {
        this.matricula = matricula;
        this.esstado = esstado;
        this.apePaterno = apePaterno;
        this.apeMaterno = apeMaterno;
        this.nombre = nombre;
        this.carrera = carrera;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getEsstado() {
        return esstado;
    }

    public void setEsstado(String esstado) {
        this.esstado = esstado;
    }

    public String getApePaterno() {
        return apePaterno;
    }

    public void setApePaterno(String apePaterno) {
        this.apePaterno = apePaterno;
    }

    public String getApeMaterno() {
        return apeMaterno;
    }

    public void setApeMaterno(String apeMaterno) {
        this.apeMaterno = apeMaterno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }
    
    
}
