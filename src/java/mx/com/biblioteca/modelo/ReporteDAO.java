/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import mx.com.biblioteca.modelo.beans.Carrera;
import mx.com.biblioteca.modelo.beans.Reporte;
import mx.com.biblioteca.modelo.beans.Servicio;

/**
 *
 * @author DanielHernandezReyes
 */
public class ReporteDAO {
    
    public ArrayList<Reporte> listarReporte(Reporte rep) throws SQLException, Exception{
        String sql = "SELECT idReporte, idUsuario, fecha, fechaInicio, fechaFin FROM reporte WHERE idReporte >= ? LIMIT 10;";
        Conexion cr = new Conexion();
        cr.conexionUsuarioEn();
        cr.prepareStatement(sql);
        cr.getEstado().setInt(1, rep.getIdReporte());
        cr.setResultado(cr.getEstado().executeQuery());
        ArrayList<Reporte> ls = new ArrayList<>();
        while(cr.getResultado().next()){
            Reporte r = new Reporte();
            r.setIdReporte(cr.getResultado().getInt("idReporte"));
            r.setFecha(cr.getResultado().getDate("fecha"));
            r.setFechaInicio(cr.getResultado().getDate("fechaInicio"));
            r.setFechaFin(cr.getResultado().getDate("fechaFin"));
            r.setIdUsuario(cr.getResultado().getString("idUsuario"));
        }
        cr.getEstado().close();
        cr.getConexion().close();
        return ls;
    }
    
    public void nuevoReporte(Reporte rep) throws SQLException, Exception{
        String sql = "CALL proce_reporte(?, ?, ?, ?);";
        Conexion cr = new Conexion();
        cr.conexionUsuarioEn();
        cr.prepareStatement(sql);
        cr.getEstado().setString(1, rep.getFecha().toString());
        cr.getEstado().setString(2, rep.getFechaInicio().toString());
        cr.getEstado().setString(3, rep.getFechaFin().toString());
        cr.getEstado().setString(4, rep.getIdUsuario());
        cr.getEstado().executeUpdate();
        cr.getEstado().close();
        cr.getConexion().close();
    }
    
    private ArrayList<Carrera> dataC(Conexion cn) throws SQLException, Exception{
        String sql = "SELECT idCarrera, nombre FROM carrera;";
        cn.prepareStatement(sql);
        cn.setResultado(cn.getEstado().executeQuery());
        ArrayList<Carrera> list = new ArrayList<>();
        while(cn.getResultado().next()){
            Carrera c = new Carrera();
            c.setIdCarrera(cn.getResultado().getInt("idCarrera"));
            c.setNombre(cn.getResultado().getString("nombre"));
            list.add(c);
        }
        return list;
    }
    
    private ArrayList<Servicio> dataS(Conexion cn) throws SQLException, Exception{
        String sql = "SELECT idServicio, nombre FROM servicio";
        cn.prepareStatement(sql);
        cn.setResultado(cn.getEstado().executeQuery());
        ArrayList<Servicio> list = new ArrayList<>();
        while(cn.getResultado().next()){
            Servicio c = new Servicio();
            c.setIdServicio(cn.getResultado().getInt("idServicio"));
            c.setNombre(cn.getResultado().getString("nombre"));
            list.add(c);
        }
        return list;
    }
    
    public Reporte datosReporte(Reporte rep) throws SQLException, Exception{
        String sql_3 = "SELECT * FROM datacarrera WHERE idReporte = ?;";
        String sql_4 = "SELECT * FROM dataservicio WHERE idReporte = ?;";
        Conexion cr = new Conexion();
        cr.conexionUsuarioJe();
        rep.setDataCarrera(this.dataC(cr));
        rep.setDataServicio(this.dataS(cr));
        cr.prepareStatement(sql_3);
        cr.getEstado().setInt(1, rep.getIdReporte());
        cr.setResultado(cr.getEstado().executeQuery());
        
        while(cr.getResultado().next()){
            for (int i = 0; i < rep.getDataCarrera().size(); i++) {
                int x = cr.getResultado().getInt("carr"+(i+1));
                rep.getDataCarrera().get(i).setIdCarrera(x);
            }
        }
        cr.prepareStatement(sql_4);
        cr.getEstado().setInt(1, rep.getIdReporte());
        cr.setResultado(cr.getEstado().executeQuery());
        
        boolean estado = false;
        while(cr.getResultado().next()){
            for (int i = 0; i < rep.getDataServicio().size(); i++) {
                int x = cr.getResultado().getInt("serv"+(i+1));
                rep.getDataServicio().get(i).setIdServicio(x);
            }
            estado = true;
        }
        cr.getEstado().close();
        cr.getConexion().close();
        if(estado)
            return rep;
        else
            return null;
    }
    
    public Reporte buscarReporte(Reporte r) throws SQLException, Exception{
        String sql = "SELECT idUsuario, fecha, fechaInicio, fechaFin FROM reporte WHERE idReporte = ?;";
        Conexion cr = new Conexion();
        cr.conexionUsuarioEn();
        cr.prepareStatement(sql);
        cr.setResultado(cr.getEstado().executeQuery());
        while(cr.getResultado().next()){
            r.setFecha(cr.getResultado().getDate("fecha"));
            r.setFechaInicio(cr.getResultado().getDate("fechaInicio"));
            r.setFechaFin(cr.getResultado().getDate("fechaFin"));
            r.setIdUsuario(cr.getResultado().getString("idUsuario"));
        }
        cr.getEstado().close();
        cr.getConexion().close();
        return r;
    }
    
}
