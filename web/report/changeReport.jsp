<%-- 
    Document   : changeReport
    Created on : 19/11/2020, 10:12:17 AM
    Author     : DanielHernandezReyes
--%>

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
        <header class="content-header">
            
            <a class="content-header_link" href="addReport.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form action="" method="POST">
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
                            <label class="right">ads sad</label>
                        </div>
                        <div class="content-center_line">
                            <input class="button" type="submit" value="Actualizar">
                        </div>
                    </fieldset> 
                <form>
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
                            for (int i = 0; i < 5; i++) {

                            %>
                    
                            <tr>
                                <th>123456789012</th>
                                <th><%=i %></th>
                                
                            </tr>
                            <%
                                }
                            %>
                        
                    </tbody>
                </table>
                <table style="margin-top: 1em;">
                    <thead>
                        <tr>
                            <th style="width: 2em;">Motivo</th>
                            <th style="width: 2em;">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < 5; i++) {

                            %>
                    
                            <tr>
                                <th>123456789012</th>
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
