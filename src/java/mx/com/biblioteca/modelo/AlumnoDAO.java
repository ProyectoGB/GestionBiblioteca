/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import mx.com.biblioteca.modelo.beans.Alumno;
import mx.com.biblioteca.modelo.beans.Carrera;

/**
 *
 * @author danielhernandezreyes
 */
public class AlumnoDAO {
    
    public ArrayList<Alumno> buscarAlumno(Alumno bus) throws SQLException, Exception{
        String sql = "SELECT * FROM alumno WHERE matricula like ?;";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, bus.getMatricula());
        cn.setResultado(cn.getEstado().executeQuery());
        ArrayList<Alumno> list = new ArrayList<>();
        while(cn.getResultado().next()){
            Alumno u = new Alumno();
            u.setMatricula(cn.getResultado().getString("matricula"));
            u.setApePaterno(cn.getResultado().getString("apePaterno"));
            u.setApeMaterno(cn.getResultado().getString("apeMaterno"));
            u.setNombre(cn.getResultado().getString("nombre1"));
            u.setNombre2(cn.getResultado().getString("nombre2"));
            u.setNombre3(cn.getResultado().getString("nombre3"));
            u.setNombre4(cn.getResultado().getString("nombre4"));
            u.setEstado(cn.getResultado().getString("estado"));
            Carrera cr = new Carrera();
            cr.setIdCarrera(cn.getResultado().getInt("idCarrera"));
            u.setCarrera(cr);
            list.add(u);
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return list;
        
    }
    
    public Alumno buscarUA(Alumno bus) throws SQLException, Exception{
        String sql = "SELECT * FROM alumno WHERE matricula = ?";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, bus.getMatricula());
        cn.setResultado(cn.getEstado().executeQuery());
        while(cn.getResultado().next()){
            bus.setApePaterno(cn.getResultado().getString("apePaterno"));
            bus.setApeMaterno(cn.getResultado().getString("apeMaterno"));
            bus.setNombre(cn.getResultado().getString("nombre1"));
            bus.setNombre2(cn.getResultado().getString("nombre2"));
            bus.setNombre3(cn.getResultado().getString("nombre3"));
            bus.setNombre4(cn.getResultado().getString("nombre4"));
            bus.setEstado(cn.getResultado().getString("estado"));
            Carrera cr = new Carrera();
            cr.setIdCarrera(cn.getResultado().getInt("idCarrera"));
            bus.setCarrera(cr);
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return bus;
        
    }
    
    private boolean buscarV(Alumno bus) throws SQLException, Exception{
        String sql = "select matricula from alumno where matricula like ?;";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, bus.getMatricula());
        cn.setResultado(cn.getEstado().executeQuery());
        boolean estado = false;
        while(cn.getResultado().next()){
            estado = true;
            break;
        }
        if(estado){
            cn.getEstado().close();
            cn.getConexion().close();
            return true;
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return false;
    }
    
    public boolean nuevoAlumno(Alumno user) throws SQLException, Exception{
        boolean estado = buscarV(user);
        if(!estado){
            String sql;
            Conexion cn = new Conexion();
            cn.conexionUsuarioJe();
            cn.conectar();
            switch(user.noNombre()){
                case 1:
                    sql = "INSERT INTO alumno (matricula, estado, apePaterno, apeMaterno, nombre1, idCarrera) VALUES (?, ?, ?, ?, ?, ?);";
                    cn.prepareStatement(sql);
                    cn.getEstado().setString(1, user.getMatricula());
                    cn.getEstado().setString(2, user.getEstado());
                    cn.getEstado().setString(3, user.getApePaterno());
                    cn.getEstado().setString(4, user.getApeMaterno());
                    cn.getEstado().setString(5, user.getNombre());
                    cn.getEstado().setInt(6, user.getCarrera().getIdCarrera());
                    break;
                case 2:
                    sql = "INSERT INTO alumno (matricula, estado, apePaterno, apeMaterno, nombre1, nombre2, idCarrera) VALUES (?, ?, ?, ?, ?, ?, ?);";
                    cn.prepareStatement(sql);
                    cn.getEstado().setString(1, user.getMatricula());
                    cn.getEstado().setString(2, user.getEstado());
                    cn.getEstado().setString(3, user.getApePaterno());
                    cn.getEstado().setString(4, user.getApeMaterno());
                    cn.getEstado().setString(5, user.getNombre());
                    cn.getEstado().setString(6, user.getNombre2());
                    cn.getEstado().setInt(7, user.getCarrera().getIdCarrera());
                    break;
                case 3:
                    sql = "INSERT INTO alumno (matricula, estado, apePaterno, apeMaterno, nombre1, nombre2, nombre3, idCarrera) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
                    cn.prepareStatement(sql);
                    cn.getEstado().setString(1, user.getMatricula());
                    cn.getEstado().setString(2, user.getEstado());
                    cn.getEstado().setString(3, user.getApePaterno());
                    cn.getEstado().setString(4, user.getApeMaterno());
                    cn.getEstado().setString(5, user.getNombre());
                    cn.getEstado().setString(6, user.getNombre2());
                    cn.getEstado().setString(7, user.getNombre3());
                    cn.getEstado().setInt(8, user.getCarrera().getIdCarrera());
                    break;
                case 4:
                    sql = "INSERT INTO alumno (matricula, estado, apePaterno, apeMaterno, nombre1, nombre2, nombre3, nombre4, idCarrera) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
                    cn.prepareStatement(sql);
                    cn.getEstado().setString(1, user.getMatricula());
                    cn.getEstado().setString(2, user.getEstado());
                    cn.getEstado().setString(3, user.getApePaterno());
                    cn.getEstado().setString(4, user.getApeMaterno());
                    cn.getEstado().setString(5, user.getNombre());
                    cn.getEstado().setString(6, user.getNombre2());
                    cn.getEstado().setString(7, user.getNombre3());
                    cn.getEstado().setString(8, user.getNombre4());
                    cn.getEstado().setInt(9, user.getCarrera().getIdCarrera());
                    break;
            }
            cn.getEstado().executeUpdate();
            cn.getEstado().close();
            cn.getConexion().close();
            return true;
        }
        return false;
        
    }
    
    public void modificarAlumno(Alumno user) throws SQLException, Exception{
        String sql;
        Conexion cn = new Conexion();
        cn.conexionUsuarioJe();//Cambiar #######################################
        cn.conectar();
        switch(user.noNombre()){
            case 1:
                sql = "UPDATE alumno SET estado = ?, apePaterno = ?, apeMaterno = ?, nombre1 = ?, idCarrera = ? WHERE matricula = ?;";
                cn.prepareStatement(sql);
                cn.getEstado().setString(1, user.getEstado());
                cn.getEstado().setString(2, user.getApePaterno());
                cn.getEstado().setString(3, user.getApeMaterno());
                cn.getEstado().setString(4, user.getNombre());
                cn.getEstado().setInt(5, user.getCarrera().getIdCarrera());
                cn.getEstado().setString(6, user.getMatricula());
                break;
            case 2:
                sql = "UPDATE alumno SET estado = ?, apePaterno = ?, apeMaterno = ?, nombre1 = ?, nombre2 = ?, idCarrera = ? WHERE matricula = ?;";
                cn.prepareStatement(sql);
                cn.getEstado().setString(1, user.getEstado());
                cn.getEstado().setString(2, user.getApePaterno());
                cn.getEstado().setString(3, user.getApeMaterno());
                cn.getEstado().setString(4, user.getNombre());
                cn.getEstado().setString(5, user.getNombre2());
                cn.getEstado().setInt(6, user.getCarrera().getIdCarrera());
                cn.getEstado().setString(7, user.getMatricula());
                break;
            case 3:
                sql = "UPDATE alumno SET estado = ?, apePaterno = ?, apeMaterno = ?, nombre1 = ?, nombre2 = ?, nombre3 = ?, idCarrera = ? WHERE matricula = ?;";
                cn.prepareStatement(sql);
                cn.getEstado().setString(1, user.getEstado());
                cn.getEstado().setString(2, user.getApePaterno());
                cn.getEstado().setString(3, user.getApeMaterno());
                cn.getEstado().setString(4, user.getNombre());
                cn.getEstado().setString(5, user.getNombre2());
                cn.getEstado().setString(6, user.getNombre3());
                cn.getEstado().setInt(7, user.getCarrera().getIdCarrera());
                cn.getEstado().setString(8, user.getMatricula());
                break;
            case 4:
                sql = "UPDATE alumno SET estado = ?, apePaterno = ?, apeMaterno = ?, nombre1 = ?, nombre2 = ?, nombre3 = ?, nombre4 = ?,idCarrera = ? WHERE matricula = ?;";
                cn.prepareStatement(sql);
                cn.getEstado().setString(1, user.getEstado());
                cn.getEstado().setString(2, user.getApePaterno());
                cn.getEstado().setString(3, user.getApeMaterno());
                cn.getEstado().setString(4, user.getNombre());
                cn.getEstado().setString(5, user.getNombre2());
                cn.getEstado().setString(6, user.getNombre3());
                cn.getEstado().setString(7, user.getNombre4());
                cn.getEstado().setInt(8, user.getCarrera().getIdCarrera());
                cn.getEstado().setString(9, user.getMatricula());
                break;
        }
        cn.getEstado().executeUpdate();
        cn.getEstado().close();
        cn.getConexion().close();
        
    }
    
    public boolean matriculaMA(Alumno user, Alumno userN) throws SQLException, Exception{
        boolean estado = buscarV(userN);
        if(!estado){
            String sql = "UPDATE alumno SET matricula = ? WHERE matricula = ?;";
            Conexion cn = new Conexion();
            cn.conexionUsuarioJe();
            cn.conectar();
            cn.prepareStatement(sql);
            cn.getEstado().setString(1, userN.getMatricula());
            cn.getEstado().setString(2, user.getMatricula());
            cn.getEstado().executeUpdate();
            cn.getEstado().close();
            cn.getConexion().close();
            return true;
        }
        return false;
    }
    
    
}
