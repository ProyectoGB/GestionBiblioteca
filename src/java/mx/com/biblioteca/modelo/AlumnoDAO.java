/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.biblioteca.modelo;

import mx.com.biblioteca.modelo.beans.Alumno;

/**
 *
 * @author danielhernandezreyes
 */
public class AlumnoDAO {
    
    public void nuevoAlumno(Alumno nueva ){
        Conexion cn = new Conexion();
    }
    
    public Alumno buscarAlumno(Alumno buscar) throws Exception {
        Conexion cn = new Conexion();
        cn.conexionAlumno();
        String sql = "select * from where matricula="+buscar.getMatricula();
        cn.consultarBD(sql);
        Alumno a = new Alumno();
        
        return a;
    }
}
