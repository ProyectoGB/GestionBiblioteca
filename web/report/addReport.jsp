<%-- 
    Document   : addReport
    Created on : 19/11/2020, 10:11:55 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="mx.com.biblioteca.modelo.beans.Reporte"%>
<%@page import="mx.com.biblioteca.modelo.beans.Usuario"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-AddReport.css" rel="stylesheet" type="text/css"/>
        <title>Add report</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            Usuario user = sec.getUser();
        %>
        <header class="content-header">
            <form class="content-header" action="/GestionBiblioteca/ControlReporte" method="POST">
                <label class="content-header_line" >Identificador:
                    <input type="text" id="buscar" name="buscar">
                </label>
                <input type="hidden" id="cl" name="clave" >
                <input class="content-header_input" id="btnSear" type="submit" value="Buscar">
                <input class="content-header_input" id="btnChan" type="submit" value="Mostrar">
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form action="/GestionBiblioteca/ControlReporte" method="POST">
                <fieldset>
                    <legend>Reporte</legend>
                    <div class="content-center_line">
                        <label for="fech">Fecha:</label>
                        <input class="right" type="text" id="fech" name="fechH"></div>
                    <div class="content-center_line">
                        <label for="Ifec">Fecha de inicio:</label>
                        <input class="right" type="date" id="Ifec"  name="fechI"></div>
                    <div class="content-center_line">
                        <label for="Ffec">Fecha de fin:</label>
                        <input class="right" type="date" id="Ffec" name="fechF"></div>
                    <div class="content-center_line">
                        <label for="nombre">Usuario:</label>
                        <label class="right"><%=user.getIdUsuario() %></label></div>
                    <div class="content-center_line">
                        <input class="button" type="hidden" value="geRep" name="clave"></div>
                        <input class="button" type="submit" value="Generar"></div>
                </fieldset> 
                <form>
            </nav>
            <article> 
                <table>
                    <thead>
                        <tr>
                            <th style="width: 3em;">Identificador</th>
                            <th style="width: 3em;">Fecha</th>
                            <th style="width: 3em;">Fecha inicio</th>
                            <th style="width: 3em;">Fecha fin</th>
                            <th style="width: 3em;">Usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(sec.getListaReporte() != null){
                            for (Reporte x : sec.getListaReporte()) {
                            %>
                    
                            <tr>
                                <th onclick="clicF(this)"id="<%=x.getIdReporte()%>"><%=x.getIdReporte() %></th>
                                <th><%=x.getFecha() %></th>
                                <th><%=x.getFechaInicio() %></th>
                                <th><%=x.getFechaFin() %></th>
                                <th><%=x.getIdUsuario() %></th>
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
