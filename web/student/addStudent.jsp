<%-- 
    Document   : addStudent
    Created on : 19/11/2020, 10:15:11 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="mx.com.biblioteca.modelo.beans.Carrera"%>
<%@page import="mx.com.biblioteca.modelo.beans.Alumno"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add student</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-AddStudent.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            //Usuario user = sec.getUser();
        %>
        <header class="content-header">
            <form class="content-header" action="/GestionBiblioteca/ControlAlumno" method="POST" >
                <label class="content-header_line" >Matricula:
                    <input type="text" id="buscar" name="buscar">
                    <input id="cl" type="hidden" name="clave"/>
                </label>  
                <input class="content-header_input" id="btnSear" type="submit" value="Buscar">
                <input class="content-header_input" id="btnChan" type="submit" value="Modificar">
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
        <nav>
            <form action="/GestionBiblioteca/ControlAlumno" method="POST">
            <fieldset>
                <legend>Estudiante</legend>
                <div class="content-item"><label for="matricula"> Matricula </label>
                    <input class="right" type="text" id="matricula" name="mrt"></div> 
                <div class="content-item"><label for="ap"> Apellido Paterno: </label>
                    <input class="right" type="text" id="ap"  name="appP"></div>
                <div class="content-item"><label for="am"> Apellido Materno </label>
                    <input class="right" type="text" id="am" name="appM"></div>
                <div class="content-item"><label for="nombre">Nombre 1:</label>
                    <input class="right" type="text" id="nombreUno" name="nbr1"></div>
                <div class="content-item"><label for="nombre">Nombre 2:</label>
                    <input class="right" type="text" id="nombreDos" name="nbr2"></div>
                <div class="content-item"><label for="nombre">Nombre 3:</label>
                    <input class="right" type="text" id="nombreTres" name="nbr3"></div>
                <div class="content-item"><label for="nombre">Nombre 4:</label>
                    <input class="right" type="text" id="nombreTres" name="nbr4"></div>
                <div class="content-item">
                    <label for="carrera">Carrera: </label>
                    <select class="right" id="carrera" name="carT">
                        <%
                            if(sec.getListaCarrera()!=null){
                                for(Carrera c : sec.getListaCarrera()){
                        %>
                        <option value="<%=c.getIdCarrera() %>"><%=c.getNombre() %></option>
                        <%
                                }
                                sec.setListaCarrera(null);
                            }
                        %>
                    </select>
                </div>
                <div class="content-item">
                    <label for="estado">Estado: </label>
                    <label class="right"><input type="checkbox" id="estado" name="estado" value="estado">Activo</label>
                </div>
                <div class="content-item">
                    <input type="hidden" name="clave" value="addA"/>
                    <input class="button" type="submit" value="Agregar">
                </div>
            </fieldset>
            </form>
        </nav>
            <article>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 6em;">Matricula</th>
                            <th style="width: 2em;">Estado</th>
                            <th style="width: 8em;">Apellido P</th>
                            <th style="width: 8em;">Apellido M</th>
                            <th style="width: 15em;">Nombre</th>
                            <th style="width: 2em;">Carrera</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(sec.getMensaje() != null && sec.getMensaje().equals("Lista generada")){
                            for (Alumno u: sec.getListaAlumno()) {
                        %>
                    
                            <tr>
                                <th onclick="clicF(this)"id="<%=u.getMatricula() %>"><%=u.getMatricula()%></th>
                                <th><%=u.getEstado() %></th>
                                <th><%=u.getApePaterno() %></th>
                                <th><%=u.getApeMaterno() %></th>
                                <%
                                    String n1 = (u.getNombre()!=null)?u.getNombre():"";
                                    String n2 = (u.getNombre2()!=null)?u.getNombre2():"";
                                    String n3 = (u.getNombre3()!=null)?u.getNombre3():"";
                                    String n4 = (u.getNombre4()!=null)?u.getNombre4():"";
                                %>
                                <th><%= n1+" "+n2+" "+n3+" "+n4 %></th>
                                <th><%=u.getCarrera().getIdCarrera() %></th>
                            </tr>
                            <%
                                }}
                            %>
                        
                    </tbody>
                </table>
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
                    sec.setListaAlumno(null);
                %>
            </ul>
        </footer>
        <script>
            document.getElementById('btnChan').addEventListener('click', ()=> {
                let hiden = document.getElementById('cl');
                hiden.value = 'chan';
            });
            document.getElementById('btnSear').addEventListener('click', ()=> {
                let hiden = document.getElementById('cl');
                hiden.value = 'sear';
            });
            function clicF (e) {
               document.getElementById('buscar').value = e.id;
            }
        </script>
    </body>
</html>
