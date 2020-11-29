/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import mx.com.biblioteca.modelo.beans.Carrera;

/**
 *
 * @author danielhernandezreyes
 */
public class CarreraDAO {
    
    public void nuevaCarrera(Carrera nueva) throws SQLException, Exception{
        String sql = "CALL proce_nueva_carrera(?,?)";
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
    
    public void modificarCarrera(Carrera nueva) throws SQLException, Exception{
        String sql = "UPDATE carrera SET nombre = ?, estado = ? WHERE (idCarrera = ?);";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, nueva.getNombre());
        cn.getEstado().setString(2, nueva.getEstado());
        cn.getEstado().executeUpdate();
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
    public ArrayList<Carrera> buscarCarrera(Carrera bus) throws SQLException, Exception{
        String sql = "SELECT idCarrera, nombre, estado FROM carrera WHERE idCarrera >= ? LIMIT 10";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, bus.getIdCarrera());
        cn.setResultado(cn.getEstado().executeQuery());
        ArrayList<Carrera> list = new ArrayList<>();
        while(cn.getResultado().next()){
            Carrera c = new Carrera();
            c.setIdCarrera(cn.getResultado().getInt("idCarrera"));
            c.setNombre(cn.getResultado().getString("nombre"));
            c.setEstado(cn.getResultado().getString("estado"));
            list.add(c);
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return list;
    }
    
    public Carrera buscarNC(Carrera bus) throws SQLException, Exception{
        String sql = "SELECT idCarrera, nombre, estado FROM carrera WHERE idCarrera = ?";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, bus.getIdCarrera());
        cn.setResultado(cn.getEstado().executeQuery());
        Carrera c = new Carrera();
        while(cn.getResultado().next()){    
            c.setIdCarrera(cn.getResultado().getInt("idCarrera"));
            c.setNombre(cn.getResultado().getString("nombre"));
            c.setEstado(cn.getResultado().getString("estado"));
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return c;
    }
    
}
