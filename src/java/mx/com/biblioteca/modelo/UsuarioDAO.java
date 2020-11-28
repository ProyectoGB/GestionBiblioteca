/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.sql.SQLException;
import java.sql.SQLWarning;
import mx.com.biblioteca.modelo.beans.Usuario;

/**
 *
 * @author danielhernandezreyes
 */
public class UsuarioDAO {
    
    public void nuevoUsuario(Usuario user) throws SQLException, Exception{
        String sql_0 = "insert into usuario values (?, ?, ?, ?, ?, ?);";
        String sql_1 = "CREATE USER ?@'%' IDENTIFIED BY ?";
        String sql_2 = "GRANT ENCARGADO TO ?@'%';";
        String sql_3 = "GRANT JEFE TO ?@'%';";
        String sql_4 = "FLUSH PRIVILEGES";
        Conexion cn = new Conexion();
        cn.conexionAdmin();
        cn.conectar();
        cn.getConexion().setAutoCommit(false);
        cn.prepareStatement(sql_0);
        cn.getEstado().setString(1, user.getIdUsuario());
        cn.getEstado().setString(2, user.getApePaterno());
        cn.getEstado().setString(3, user.getNombre());
        cn.getEstado().setString(4, user.getEstado());
        cn.getEstado().setString(5, user.getContra());
        cn.getEstado().setString(6, user.getTipo());
        cn.getEstado().executeUpdate();
        
        SQLWarning warnings = cn.getEstado().getWarnings();
        if(warnings == null){
            cn.getConexion().rollback();
        }else{
            cn.prepareStatement(sql_1);
            cn.getEstado().setString(1, user.getIdUsuario());
            cn.getEstado().setString(2, user.getContra());
            cn.getEstado().executeUpdate();

            if(user.getTipo().equals("ADM")){
                cn.prepareStatement(sql_2);
                cn.getEstado().setString(1, user.getIdUsuario());
                cn.getEstado().executeUpdate();
                cn.prepareStatement(sql_3);
                cn.getEstado().setString(1, user.getIdUsuario());
                cn.getEstado().executeUpdate();
            } else {
                cn.prepareStatement(sql_2);
                cn.getEstado().setString(1, user.getIdUsuario());
            }
            cn.prepareStatement(sql_4);
            cn.getEstado().executeUpdate();
        }

        warnings = cn.getEstado().getWarnings();
        if(warnings != null){
            cn.getConexion().commit();
        }else{
            cn.getConexion().rollback();
        }
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
    public Usuario buscar(Usuario user){
        return user;
    }
    
    public Usuario iniciarSesion(Usuario user) throws SQLException, Exception{
        String sql = "CALL proce_iniciar_secion(?, ?)";
        Conexion cn = new Conexion();
        cn.conexionNormal();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, user.getIdUsuario());
        cn.getEstado().setString(2, user.getContra());
        cn.setResultado(cn.getEstado().executeQuery());
        if(cn.getResultado().next()){
            if(cn.getResultado().getInt("act") == 1){
                user.setApePaterno(cn.getResultado().getString("apePaterno"));
                user.setNombre(cn.getResultado().getString("nombre"));
                user.setEstado(cn.getResultado().getString("estado"));
                user.setContra(cn.getResultado().getString("contra"));
                user.setTipo(cn.getResultado().getString("tipo"));
                cn.getEstado().close();
                cn.getConexion().close();
                return user;
            } else {
                cn.getEstado().close();
                cn.getConexion().close();
                return null;
            }
        }else{
            cn.getEstado().close();
            cn.getConexion().close();
            return null;
        }
    }
    
    public void cerrarSesion(Usuario user) throws SQLException, Exception{
        String sql = "CALL proce_cerrar_secion(?)";
        Conexion cn = new Conexion();
        cn.conexionUsuarios(user);
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, user.getIdUsuario());
        cn.getEstado().executeUpdate();
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
    public int cambiarDatosPersonales(Usuario user) throws Exception{
        String sql = "UPDATE usuario SET nombre = ?, apePaterno = ? WHERE (idUsuario = ?)";
        Conexion cn = new Conexion();
        cn.conexionUsuarios(user);
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, user.getNombre());
        cn.getEstado().setString(2, user.getApePaterno());
        cn.getEstado().setString(3, user.getIdUsuario());
        cn.getEstado().executeUpdate();
        cn.getEstado().close();
        cn.getConexion().close();
        return 1;
    }
    
    public void cambiarPassword(Usuario user) throws SQLException, Exception{
        String sql_1 = "update usuario set estado = 'BLO' where (idUsuario = ?)";
        String sql_2 = "update usuario set contra = ? where idUsuario = ?";
        String sql_3 = "ALTER USER ?@'%' IDENTIFIED BY ?";
        String sql_4 = "FLUSH PRIVILEGES";
        String sql_5 = "update usuario set estado = 'IAC' where (idUsuario = ?);";
        Conexion cn = new Conexion();
        cn.conexionAdmin();
        cn.conectar();
        cn.getConexion().setAutoCommit(false);
        cn.prepareStatement(sql_1);
        cn.getEstado().setString(1, user.getIdUsuario());
        cn.getEstado().executeUpdate();
        cn.prepareStatement(sql_2);
        cn.getEstado().setString(1, user.getContra());
        cn.getEstado().setString(2, user.getIdUsuario());
        cn.getEstado().executeUpdate();
        cn.prepareStatement(sql_3);
        cn.getEstado().setString(1, user.getIdUsuario());
        cn.getEstado().setString(2, user.getContra());
        cn.getEstado().executeUpdate();
        cn.prepareStatement(sql_4);
        cn.getEstado().executeUpdate();
        cn.prepareStatement(sql_5);
        cn.getEstado().setString(1, user.getIdUsuario());
        cn.getEstado().executeUpdate();
        SQLWarning warnings = cn.getEstado().getWarnings();
        if(warnings != null){
            cn.getConexion().commit();
        }else{
            cn.getConexion().rollback();
        }
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
}
