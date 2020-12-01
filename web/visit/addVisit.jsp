<%-- 
    Document   : addVisit
    Created on : 19/11/2020, 10:18:20 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="mx.com.biblioteca.modelo.beans.Visita"%>
<%@page import="mx.com.biblioteca.modelo.beans.Alumno"%>
<%@page import="mx.com.biblioteca.modelo.beans.Servicio"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/Style-AddVisit.css" rel="stylesheet" type="text/css"/>
        <title>Add visit</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            //Usuario user = sec.getUser();
        %>
        <header class="content-header">
            <a class="content-header_link" href="../session/home.jsp">Cancelar</a>
        </header>
        <section>
            <nav>
                <form action="/GestionBiblioteca/ControlVisita" method="POST">
                    <fieldset >
                        <legend>Alumno</legend>
                        <div class="content-center_line">
                            <label for="matr">Matricula:</label>
                            <input class="right" type="text" id="matr" name="matricula"></div>
                        <div class="content-center_line">
                            <input type="hidden" name="clave" value="seaV"/>
                            <input class="button" type="submit" value="Buscar"></div>
                    </fieldset> 
                </form>
                <div class="content-center_line"></div>
                <fieldset>
                    <%
                        if(sec.getListaVisita()!= null && sec.getListaVisita().size() == 2){
                            Visita vi = sec.getListaVisita().get(0);
                            Alumno a = vi.getAlumno();
                    %>
                    <div class="content-center_line">
                        <label>Matricula: </label><label><%=a.getMatricula() %></label></div>
                    <div class="content-center_line">
                        <label>Apellido paterno: </label><label><%=a.getApePaterno() %></label></div>
                    <div class="content-center_line">
                        <label>Apellido materno: </label><label><%=a.getApeMaterno() %></label></div>
                    <div class="content-center_line">
                        <%
                            String n1 = (a.getNombre()!=null)?a.getNombre():"";
                            String n2 = (a.getNombre2()!=null)?a.getNombre2():"";
                            String n3 = (a.getNombre3()!=null)?a.getNombre3():"";
                            String n4 = (a.getNombre4()!=null)?a.getNombre4():"";
                        %>
                        <label>Nombre: </label><label><%=n1+" "+n2+" "+n3+" "+n4 %></label></div>
                    <div class="content-center_line">
                        <label>Carrera: </label><label><%=a.getCarrera().getNombre() %></label></div>
                    <%
                        } else {
                            if(sec.getListaAlumno() != null){
                                Alumno a = sec.getListaAlumno().get(0);
                    %>
                    <div class="content-center_line">
                        <label>Matricula: </label><label><%=a.getMatricula() %></label></div>    
                    <div class="content-center_line">
                        <label>Apellido paterno:</label><label><%=a.getApePaterno() %></label></div>
                    <div class="content-center_line">
                        <label>Apellido materno:</label><label><%=a.getApeMaterno() %></label></div>
                    <div class="content-center_line">
                        <%
                            String n1 = (a.getNombre()!=null)?a.getNombre():"";
                            String n2 = (a.getNombre2()!=null)?a.getNombre2():"";
                            String n3 = (a.getNombre3()!=null)?a.getNombre3():"";
                            String n4 = (a.getNombre4()!=null)?a.getNombre4():"";
                        %>
                        <label>Nombre:</label><label><%=n1+" "+n2+" "+n3+" "+n4 %></label></div>
                    <div class="content-center_line">
                        <label>Carrera:</label><label><%=a.getCarrera().getNombre() %></label></div>
                    <%
                            
                            }
                        }
                    %>
                </fieldset>
            </nav>
            <article>
                <form action="/GestionBiblioteca/ControlVisita" method="POST">
                    <fieldset>
                        <legend>Solicitar servicio</legend>
                        <%
                            //if(sec)
                            if(sec.getListaServicio() != null){
                                for (Servicio s : sec.getListaServicio()) {
                        %>
                        <div class="content-center_line">
                            <label for="estado"><%=s.getNombre() %>:</label>
                            <label class="right">
                                <input type="checkbox" id="estado" name="tipSer" value="<%=s.getIdServicio() %>">Solicitar</label>
                        </div>
                        <%
                                }
                                sec.setListaServicio(null);
                            }
                            if(sec.getListaVisita()!= null && sec.getListaVisita().size() == 2){
                                Visita vi = sec.getListaVisita().get(0);
                                for(Servicio s : vi.getServicios()){
                        %>
                            <div class="content-center_line">
                                <label><%=s.getNombre() %>:</label><label class="right">Solicitado</label>
                            </div>
                        <%
                                }
                            }
                        %>
                        <div class="content-center_line">
                            <%
                                if(!sec.isEstadoVisita()){
                                    if(sec.getListaAlumno() != null){
                                        Alumno a = sec.getListaAlumno().get(0);
                            %>
                                <input type="hidden" name="alumV" value="<%=a.getMatricula() %>"/>
                            <%
                                    }
                            %>
                            <input type="hidden" name="clave" value="visNue"/>
                            <input class="button" type="submit" value="Agregar">
                            <%
                                    sec.setListaAlumno(null);
                                } else {
                                    if(sec.getListaVisita() != null){
                                    Visita vi = sec.getListaVisita().get(0);
                            %>
                            <input type="hidden" name="idV" value="<%=vi.getIdVisita() %>"/>
                            <%
                                    }
                            %>
                            <input type="hidden" name="clave" value="visTr"/>
                            <input class="button" type="submit" value="Terminar"/>
                            <%
                                sec.setListaVisita(null);
                                } // limpiar la visita -> null
                            %>
                        </div>

                    </fieldset> 
                </form>
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
