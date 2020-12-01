<%-- 
    Document   : changeVisit
    Created on : 19/11/2020, 10:18:36 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="mx.com.biblioteca.modelo.beans.Visita"%>
<%@page import="mx.com.biblioteca.modelo.beans.Servicio"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-ChangeVisit.css" rel="stylesheet" type="text/css"/>
        <title>Change visit</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            //Usuario user = sec.getUser();
        %>
        <header class="content-header">
            <form class="content-header" action="/GestionBiblioteca/ControlVisitaCambio" method="POST">
                <label class="content-header_line" >Matricula:
                    <input type="text" id="buscar" name="buscar">
                </label>
                <input type="hidden" value="bust" name="clave">
                <input class="content-header_input" type="submit" value="Buscar">
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
            <article> 
                <table>
                    <thead>
                        <tr>
                            <th style="width: 4em;">Identificador</th>
                            <th style="width: 3em;">Matricula</th>
                            <th style="width: 4em;">Fecha</th>
                            <th style="width: 2em;">Entrada</th>
                            <th style="width: 2em;">Salida</th>
                            <th style="width: 2em;">No. Servicios</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(sec.getListaVisita() != null){
                            for (Visita v: sec.getListaVisita()) {
                        %>
                            <tr>
                                <th><%=v.getIdVisita() %></th>
                                <th><%=v.getAlumno().getMatricula() %></th>
                                <th><%=v.getFecha() %></th>
                                <th><%=v.getHoraEntrada() %></th>
                                <th><%=v.getHoraSalida() %></th>
                                <th><%=v.getServicios().get(0).getIdServicio() %></th>
                            </tr>
                        <%
                            }}
                        %>
                        
                    </tbody>
              </table>
            </article>
        </section>
        <footer class="content-footer"></footer>
    </body>
</html>
