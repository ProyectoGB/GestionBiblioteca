/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.sql.SQLException;
import mx.com.biblioteca.modelo.beans.Usuario;

/**
 *
 * @author danielhernandezreyes
 */
public class UsuarioDAO {
    
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
    
}
