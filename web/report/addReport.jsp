<%-- 
    Document   : addReport
    Created on : 19/11/2020, 10:11:55 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/Style-AddReport.css" rel="stylesheet" type="text/css"/>
        <title>Add report</title>
    </head>
    <body>
        <header class="content-header">
            <form class="content-header" action="changeReport.jsp">
                <label class="content-header_line" >Identificador:
                    <input type="text" id="buscar" name="buscar">
                </label>  
                <input class="content-header_input" type="submit" value="Modificar">
            </form>
            
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form>
                <fieldset >
                    <legend>Reporte</legend>
                    <div class="content-center_line">
                        <label for="matricula">Fecha:</label>
                        <input class="right" type="date" id="matricula" name="matricula"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="ap">Fecha de inicio:</label>
                        <input class="right" type="date" id="ap"  name="ap"   > 
                    </div>
                    <div class="content-center_line">
                        <label for="am">Fecha de fin:</label>
                        <input class="right" type="date" id="am" name="am"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Usuario:</label>
                        <input class="right" type="text" id="nombreUno" name="nombre" > 
                    </div>
                    <div class="content-center_line">
                        <input class="button" type="submit" value="Generar">
                    </div>

                </fieldset> 
                <form>
            </nav>
            <article> 
                <table>
                    <thead>
                        <tr>
                            <th style="width: 2em;">Identificador</th>
                            <th style="width: 2em;">Fecha</th>
                            <th style="width: 2em;">Fecha inicio</th>
                            <th style="width: 2em;">Fecha fin</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < 5; i++) {

                            %>
                    
                            <tr>
                                <th>123456789012</th>
                                <th><%=i %></th>
                                <th><%=i %></th>
                                <th><%=i %></th>
                                
                            </tr>
                            <%
                                }
                            %>
                        
                    </tbody>
              </table>
            </article>
        </section>
        <footer class="content-footer"></footer>
    </body>
</html>
