/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo.beans;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author DanielHernandezReyes
 */
public class Reporte {
    private int idReporte;
    private Date fecha;
    private Date fechaInicio;
    private Date fechaFin;
    private String idUsuario;
    private ArrayList<Carrera> dataCarrera;
    private ArrayList<Servicio> dataServicio;

    public Reporte() {
    }

    public Reporte(int idReporte, Date fecha, Date fechaInicio, Date fechaFin, String idUsuario) {
        this.idReporte = idReporte;
        this.fecha = fecha;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.idUsuario = idUsuario;
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public ArrayList<Carrera> getDataCarrera() {
        return dataCarrera;
    }

    public void setDataCarrera(ArrayList<Carrera> dataCarrera) {
        this.dataCarrera = dataCarrera;
    }

    public ArrayList<Servicio> getDataServicio() {
        return dataServicio;
    }

    public void setDataServicio(ArrayList<Servicio> dataServicio) {
        this.dataServicio = dataServicio;
    }
    
}
