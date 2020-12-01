<%-- 
    Document   : changeReport
    Created on : 19/11/2020, 10:12:17 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="mx.com.biblioteca.modelo.beans.Servicio"%>
<%@page import="mx.com.biblioteca.modelo.beans.Carrera"%>
<%@page import="mx.com.biblioteca.modelo.beans.Reporte"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-ChangeReport.css" rel="stylesheet" type="text/css"/>
        <title>Change report</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
        %>
        <header class="content-header">
            
            <a class="content-header_link" href="addReport.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form action="/GestionBiblioteca/ControlReporte" method="POST">
                    <fieldset >
                        <legend>Reporte</legend>
                        <%
                            if(sec.getListaReporte()!=null){
                             Reporte x = sec.getListaReporte().get(0);
                        %>
                        <div class="content-center_line">
                            <label>ID:</label><input class="right" name="idrep" value="<%=x.getIdReporte() %>" readonly </label></div>
                        <div class="content-center_line">
                            <label>Fecha:</label><label class="right"><%=x.getFecha()%></label></div>
                        <div class="content-center_line">
                            <label>Fecha de inicio:</label><label class="right"><%=x.getFechaInicio() %></label></div>
                        <div class="content-center_line">
                            <label>Fecha de fin:</label><label class="right"><%=x.getFechaFin() %></label></div>
                        <div class="content-center_line">
                            <label>Usuario:</label><label class="right"><%=x.getIdUsuario() %></label></div>
                        <div class="content-center_line">
                            <input type="hidden" value="gdoC" name="clave">
                            <input class="button" type="submit" value="Generar DOC">
                        </div>
                        <%
                            }
                        %>
                    </fieldset> 
                </form>
            </nav>
            <article> 
                <table>
                    <thead>
                        <tr>
                            <th style="width: 2em;">Carrera</th>
                            <th style="width: 2em;">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(sec.getListaReporte()!=null){
                                Reporte x = sec.getListaReporte().get(0);
                                for(Carrera c: x.getDataCarrera()){
                        %>
                            <tr>
                                <th><%=c.getNombre() %></th>
                                <th><%=c.getIdCarrera() %></th>
                            </tr>
                            <%
                                }}
                            %>
                        
                    </tbody>
                </table>
                <table style="margin-top: 1em;">
                    <thead>
                        <tr>
                            <th style="width: 2em;">Servicio</th>
                            <th style="width: 2em;">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(sec.getListaReporte()!=null){
                                Reporte x = sec.getListaReporte().get(0);
                                for(Servicio s: x.getDataServicio()){
                        %>
                    
                            <tr>
                                <th><%=s.getNombre() %></th>
                                <th><%=s.getIdServicio() %></th>
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
