/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import mx.com.biblioteca.modelo.beans.Alumno;
import mx.com.biblioteca.modelo.beans.Servicio;
import mx.com.biblioteca.modelo.beans.Visita;

/**
 *
 * @author DanielHernandezReyes
 */
public class VisitaDAO {
    
    public void visitaNueva(Visita v) throws SQLException, Exception{
        int con = contar() + 1;
        v.setIdVisita(con);
        String sql = "INSERT INTO visita (idVisita, fecha, horaEntrada, matricula) VALUES (?, ?, ?, ?);";
        Conexion cn = new Conexion();
        cn.conexionAlumno();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, v.getIdVisita());
        cn.getEstado().setDate(2, v.getFecha());
        cn.getEstado().setString(3, v.getHoraEntrada().toString());
        cn.getEstado().setString(4, v.getAlumno().getMatricula());
        cn.getEstado().executeUpdate();
        for (int i = 0; i < v.getServicios().size(); i++) {
            String sql_2 = "INSERT INTO tienen VALUES (?, ?);";
            cn.prepareStatement(sql_2);
            cn.getEstado().setInt(1, v.getIdVisita());
            cn.getEstado().setInt(2, v.getServicios().get(i).getIdServicio());
            cn.getEstado().executeUpdate();
        }
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
    private int contar() throws SQLException, Exception{
        String sql = "select count(*) AS cont from visita;";
        Conexion cn = new Conexion();
        cn.conexionAlumno();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.setResultado(cn.getEstado().executeQuery());
        int c = 0;
        while(cn.getResultado().next()){
            c = cn.getResultado().getInt("cont");
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return c;
    }
    
    public Visita buscarTer(Visita v) throws Exception{
        String sql = "select idVisita from visita where fecha = ? and horaSalida is null and matricula = ?;";
        Conexion cn = new Conexion();
        cn.conexionAlumno();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setDate(1, v.getFecha());
        cn.getEstado().setString(2, v.getAlumno().getMatricula());
        cn.setResultado(cn.getEstado().executeQuery());
        boolean es = false;
        while(cn.getResultado().next()){
            v.setIdVisita(cn.getResultado().getInt("idVisita"));
            es = true;
        }
        if(es){
            cn.getEstado().close();
            cn.getConexion().close();
            return v;
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return null;
    }
    
    public void terminarVisita(Visita v) throws SQLException, Exception{
        String sql = "UPDATE visita SET horaSalida = ? WHERE idVisita = ?;";
        Conexion cn = new Conexion();
        cn.conexionAlumno();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setString(1, v.getHoraSalida().toString());
        cn.getEstado().setInt(2, v.getIdVisita());
        cn.getEstado().executeUpdate();
        
        cn.getEstado().close();
        cn.getConexion().close();
    }
    
    public ArrayList<Servicio> datosVisita(Visita v) throws SQLException, Exception{
        String sql = "SELECT s.idServicio, s.nombre FROM tienen t join servicio s on(t.idServicio=s.idServicio) WHERE idVisita = ?;";
        Conexion cn = new Conexion();
        cn.conexionAlumno();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, v.getIdVisita());
        cn.setResultado(cn.getEstado().executeQuery());
        ArrayList<Servicio> lser = new ArrayList<>();
        while(cn.getResultado().next()){
            Servicio s = new Servicio();
            s.setIdServicio(cn.getResultado().getInt("idServicio"));
            s.setNombre(cn.getResultado().getString("nombre"));
            lser.add(s);
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return lser;
    }
    
    public ArrayList<Visita> listaVisita(Visita v) throws SQLException, Exception{
        String sql = "select visita.idVisita, fecha, horaEntrada, horaSalida, visita.estado, matricula, count(idServicio) as count " +
                    "from visita join tienen on(visita.idVisita=tienen.idVisita) WHERE visita.idVisita >= ? group by visita.idVisita LIMIT 10;";
        Conexion cn = new Conexion();
        cn.conexionUsuarioEn();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, v.getIdVisita());
        cn.setResultado(cn.getEstado().executeQuery());
        ArrayList<Visita> lser = new ArrayList<>();
        while(cn.getResultado().next()){
            Visita s = new Visita();
            s.setIdVisita(cn.getResultado().getInt("idVisita"));
            s.setFecha(cn.getResultado().getDate("fecha"));
            s.setHoraEntrada(cn.getResultado().getTime("horaEntrada"));
            s.setHoraSalida(cn.getResultado().getTime("horaSalida"));
            s.setEstado(cn.getResultado().getString("estado"));
            Alumno a = new Alumno();
            a.setMatricula(cn.getResultado().getString("matricula"));
            s.setAlumno(a);
            ArrayList<Servicio> lis = new ArrayList<>();
            Servicio ser = new Servicio();
            ser.setIdServicio(cn.getResultado().getInt("count"));
            lis.add(ser);
            s.setServicios(lis);
            lser.add(s);
        }
        cn.getEstado().close();
        cn.getConexion().close();
        return lser;
    }
    
    public Visita buscarVisita(Visita s) throws SQLException, Exception{
        String sql = "SELECT fecha, horaEntrada, horaSalida, estado, matricula FROM visita WHERE idVisita = ?;";
        Conexion cn = new Conexion();
        cn.conexionAlumno();
        cn.conectar();
        cn.prepareStatement(sql);
        cn.getEstado().setInt(1, s.getIdVisita());
        cn.setResultado(cn.getEstado().executeQuery());
        boolean estado = false;
        while(cn.getResultado().next()){
            s.setFecha(cn.getResultado().getDate("fecha"));
            s.setHoraEntrada(cn.getResultado().getTime("horaEntrada"));
            s.setHoraSalida(cn.getResultado().getTime("horaSalida"));
            s.setEstado(cn.getResultado().getString("estado"));
            Alumno a = new Alumno();
            a.setMatricula(cn.getResultado().getString("matricula"));
            s.setAlumno(a);
            estado = true;
        }
        cn.getEstado().close();
        cn.getConexion().close();
        if(estado)
            return s;
        else
            return null;
    }
    
}
