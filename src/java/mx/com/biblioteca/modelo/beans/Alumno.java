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
    private String estado;
    private String apePaterno;
    private String apeMaterno;
    private String nombre;
    private String nombre2;
    private String nombre3;
    private String nombre4;
    private Carrera carrera;

    public Alumno() {
    }

    public Alumno(String matricula, String estado, String apePaterno, String apeMaterno, String nombre, Carrera carrera) {
        this.matricula = matricula;
        this.estado = estado;
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
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

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getNombre3() {
        return nombre3;
    }

    public void setNombre3(String nombre3) {
        this.nombre3 = nombre3;
    }

    public String getNombre4() {
        return nombre4;
    }

    public void setNombre4(String nombre4) {
        this.nombre4 = nombre4;
    }
    
    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }
    
    public int noNombre(){
        int i = 1;
        if(!"".equals(this.nombre2))
            i++;
        if(!"".equals(this.nombre3))
            i++;
        if(!"".equals(this.nombre4))
            i++;
        return i;
    }
}
