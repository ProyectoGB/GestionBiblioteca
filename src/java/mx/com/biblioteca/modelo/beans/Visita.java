/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo.beans;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author DanielHernandezReyes
 */
public class Visita {
    private int idVisita;
    private Date fecha;
    private Time horaEntrada;
    private Time horaSalida;
    private String estado;
    private Alumno alumno;
    private ArrayList<Servicio> servicios;

    public Visita() {
    }

    public Visita(int idVisita, Date fecha, Time horaEntrada, Time horaSalida, String estado, Alumno matricula) {
        this.idVisita = idVisita;
        this.fecha = fecha;
        this.horaEntrada = horaEntrada;
        this.horaSalida = horaSalida;
        this.estado = estado;
        this.alumno = matricula;
    }

    public int getIdVisita() {
        return idVisita;
    }

    public void setIdVisita(int idVisita) {
        this.idVisita = idVisita;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(Time horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public Time getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Time horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public ArrayList<Servicio> getServicios() {
        return servicios;
    }

    public void setServicios(ArrayList<Servicio> servicios) {
        this.servicios = servicios;
    }

    public void dataInicio(){
        java.util.Date d = new java.util.Date();  
        //SimpleDateFormat plantilla = new java.text.SimpleDateFormat("dd/MM/yyyy H:mm:ss");
        //String tiempo = plantilla.format(d);
        this.fecha = new Date(d.getTime());
        this.horaEntrada = new Time(d.getTime());
    }
    public void dataFin(){
        java.util.Date d = new java.util.Date();
        
        SimpleDateFormat plantilla = new java.text.SimpleDateFormat("dd/MM/yyyy H:mm:ss");
        String tiempo = plantilla.format(d);
        this.horaSalida = new Time(d.getTime());
    }
}
