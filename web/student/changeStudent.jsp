<%-- 
    Document   : changeStudent
    Created on : 19/11/2020, 10:15:34 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="mx.com.biblioteca.modelo.beans.Alumno"%>
<%@page import="mx.com.biblioteca.modelo.beans.Carrera"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar Alumno</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-Change-Student.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
        %>
        <header class="content-header">
            <form class="content-header" action="/GestionBiblioteca/TempControlCarrera" method="POST">
                <input class="content-line_input" type="submit" value="Regresar"/>
            </form>
        </header>
        <section>
            <nav>
                <form action="/GestionBiblioteca/ControlAlumno" method="POST">
                <fieldset>
                    <legend>Modificar estudiante</legend>
                    <%
                        if( sec.getListaAlumno()!= null && sec.getListaAlumno().size() == 2){
                            Alumno a = sec.getListaAlumno().get(0);
                    %>
                    <div class="content-center_line"><label for="matricula">Matricula:</label>
                        <input class="right" type="text" id="matricula" name="matri" readonly value="<%=a.getMatricula() %>"></div>
                    <div class="content-center_line"><label for="apP">Apellido Paterno:</label>
                        <input class="right" type="text" id="aP"  name="apPP" value="<%=a.getApePaterno() %>"></div>
                    <div class="content-center_line"><label for="apM">Apellido Materno:</label>
                        <input class="right" type="text" id="apM" name="apMM" value="<%=(a.getApeMaterno()==null)?"":a.getApeMaterno() %>"></div>
                    <div class="content-center_line"><label for="n1">Nombre 1:</label>
                        <input class="right" type="text" id="n1" name="nb1" value="<%=(a.getNombre()==null)?"":a.getNombre() %>"></div>
                    <div class="content-center_line"><label for="n2">Nombre 2:</label>
                        <input class="right" type="text" id="n2" name="nb2" value="<%=(a.getNombre2()==null)?"":a.getNombre2() %>"></div>
                    <div class="content-center_line"><label for="n3">Nombre 3:</label>
                        <input class="right" type="text" id="n3" name="nb3" value="<%=(a.getNombre3()==null)?"":a.getNombre3() %>"></div>
                    <div class="content-center_line"><label for="n4">Nombre 4:</label>
                        <input class="right" type="text" id="n4" name="nb4" value="<%=(a.getNombre4()==null)?"":a.getNombre4() %>"></div>
                    <div class="content-center_line"><label for="car">Carrera:</label>
                        <select class="right" id="car" name="ca">
                        <%
                            if(sec.getListaCarrera()!=null){
                                for(Carrera c : sec.getListaCarrera()){
                                    if(c.getIdCarrera() == a.getCarrera().getIdCarrera()){
                        %>
                        <option value="<%=c.getIdCarrera() %>" selected><%=c.getNombre() %></option>
                        <%
                                    } else {
                        %>
                            <option value="<%=c.getIdCarrera() %>"><%=c.getNombre() %></option>
                        <%
                                    }
                                }
                                
                            }
                        %>
                        </select></div>
                    <div class="content-center_line">
                        <label for="est">Estado:</label>
                        <label class="right" for="estado">
                            <%
                                if(a.getEstado().equals("AC") ){
                            %>
                                <input type="checkbox" id="est" name="esta" checked value="estado">Activo</label>
                            <%
                                } else {
                            %>
                                <input type="checkbox" id="est" name="esta" value="estado">Activo</label>
                    </div>
                    <%
                                }
                            sec.setListaCarrera(null);
                            sec.setListaAlumno(null);
                        } else {
                    %>
                    <div class="content-center_line"><label for="matricula">Matricula:</label>
                        <input class="right" type="text" id="matricula" name="matri"></div>
                    <div class="content-center_line"><label for="apP">Apellido Paterno:</label>
                        <input class="right" type="text" id="aP"  name="apPP"></div>
                    <div class="content-center_line"><label for="apM">Apellido Materno:</label>
                        <input class="right" type="text" id="apM" name="apMM"></div>
                    <div class="content-center_line"><label for="n1">Nombre 1:</label>
                        <input class="right" type="text" id="n1" name="nb1"></div>
                    <div class="content-center_line"><label for="n2">Nombre 2:</label>
                        <input class="right" type="text" id="n2" name="nb2"></div>
                    <div class="content-center_line"><label for="n3">Nombre 3:</label>
                        <input class="right" type="text" id="n3" name="nb3"></div>
                    <div class="content-center_line"><label for="n4">Nombre 4:</label>
                        <input class="right" type="text" id="n4" name="nb4"></div>
                    <div class="content-center_line"><label for="car">Carrera:</label>
                        <select class="right" id="car" name="ca"></select></div>
                    <div class="content-center_line">
                        <label for="est">Estado:</label>
                        <label class="right" for="estado">
                            <input type="checkbox" id="est" name="esta" value="estado">Activo</label>
                    </div>
                    <%
                        }
                    %>
                    <div class="content-center_line">
                        <input type="hidden" name="clave" value="modA"/>
                        <input class="button" type="submit" value="Actualizar">
                    </div>
                </fieldset> 
                <form>
            </nav>
            <article> 
                <fieldset >
                    <legend>Actualizado</legend>
                    <%
                        if(sec.getListaAlumno()!= null && sec.getListaAlumno().size() == 1){
                            Alumno a = sec.getListaAlumno().get(0);
                    %>
                    <div class="content-center_line"><label> Matricula:</label>
                        <label class="right"><%=(a.getMatricula()==null)?"":a.getMatricula()%></label></div>
                    <div class="content-center_line"><label> Apellido paterno:</label>
                        <label class="right"><%=(a.getApePaterno()==null)?"":a.getApePaterno()%></label></div>
                    <div class="content-center_line"><label> Apellido materno:</label>
                        <label class="right"><%=(a.getApeMaterno()==null)?"":a.getApeMaterno()%></label></div>
                    <div class="content-center_line"><label>Nombre 1:</label>
                        <label class="right"><%=(a.getNombre()==null)?"":a.getNombre() %></label></div>
                    <div class="content-center_line"><label>Nombre 2:</label>
                        <label class="right"><%=(a.getNombre2()==null)?"":a.getNombre2()%></label></div>
                    <div class="content-center_line"><label>Nombre 3:</label>
                        <label class="right"><%=(a.getNombre3()==null)?"":a.getNombre3() %></label></div>
                    <div class="content-center_line"><label>Nombre 4:</label>
                        <label class="right"><%=(a.getNombre4()==null)?"":a.getNombre4() %></label></div>
                    <div class="content-center_line"><label>Carrera:</label>
                        <label class="right"><%=(a.getNombre()==null)?"":a.getCarrera().getIdCarrera() %></label></div>
                    <div class="content-center_line"><label>Estado:</label>
                        <label class="right"><%=(a.getEstado()==null)?"":a.getEstado() %></label></div>
                    <%
                        sec.setListaAlumno(null);
                        } else {
                    %>
                    <div class="content-center_line"><label>Matricula:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Apellido paterno:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Apellido materno:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Nombre 1:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Nombre 2:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Nombre 3:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Nombre 4:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Carrera:</label>
                        <label class="right"></label></div>
                    <div class="content-center_line"><label>Estado:</label>
                        <label class="right"></label></div>
                    <%
                        }
                    %>

                </fieldset>
            </article>
        </section>
        <footer class="content-footer">
            <ul class="content">
                <%
                    if (sec.getMensaje() != null) {
                %>
                <li><a class="content-item_footer" href=""><%= sec.getMensaje() %></a></li>
                <%
                        sec.setMensaje(null);
                    }
                    
                %>
            </ul>
        </footer>
    </body>
</html>
