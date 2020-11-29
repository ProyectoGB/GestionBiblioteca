/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import mx.com.biblioteca.modelo.beans.Servicio;

/**
 *
 * @author DanielHernandezReyes
 */
public class ServicioDAO {
    
    public void nuevoServicio(Servicio nueva) throws SQLException, Exception{
        String sql = "CALL proce_nuevo_servicio(?,?)";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, nueva.getNombre());
        cn.getEstado().setString(2, nueva.getEstado());
        cn.setResultado(cn.getEstado().executeQuery());
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
    public void modificarServicio(Servicio nuevo) throws SQLException, Exception{
        String sql = "UPDATE servicio SET nombre = ?, estado = ? WHERE (idServicio = ?)";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, nuevo.getNombre());
        cn.getEstado().setString(2, nuevo.getEstado());
        cn.getEstado().setInt(3, nuevo.getIdServicio());
        cn.getEstado().executeUpdate();
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
    public ArrayList<Servicio> buscarServicio(Servicio bus) throws SQLException, Exception{
        String sql = "SELECT idServicio, nombre, estado FROM servicio WHERE idServicio >= ? LIMIT 10";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, bus.getIdServicio());
        cn.setResultado(cn.getEstado().executeQuery());
        ArrayList<Servicio> list = new ArrayList<>();
        while(cn.getResultado().next()){
            Servicio c = new Servicio();
            c.setIdServicio(cn.getResultado().getInt("idServicio"));
            c.setNombre(cn.getResultado().getString("nombre"));
            c.setEstado(cn.getResultado().getString("estado"));
            list.add(c);
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return list;
    }
    
    public Servicio buscarNS(Servicio bus) throws SQLException, Exception{
        String sql = "SELECT nombre, estado FROM servicio WHERE idServicio = ?";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, bus.getIdServicio());
        cn.setResultado(cn.getEstado().executeQuery());
        while(cn.getResultado().next()){    
            bus.setNombre(cn.getResultado().getString("nombre"));
            bus.setEstado(cn.getResultado().getString("estado"));
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return bus;
    }
    
}
