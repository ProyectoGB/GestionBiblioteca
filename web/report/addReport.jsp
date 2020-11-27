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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-AddReport.css" rel="stylesheet" type="text/css"/>
        <title>Add report</title>
    </head>
    <body>
        <header class="content-header">
            <form class="content-header" action="" method="POST">
                <label class="content-header_line" >Identificador:
                    <input type="text" id="buscar" name="buscar">
                </label>  
                <input class="content-header_input" type="submit" value="Buscar">
            </form>
            <a class="content-header_link" href="../report/changeReport.jsp">Modificar</a>
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
                        <label class="right"> dasdasd sad</label> 
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
                            <th style="width: 6em;">Usuario</th>
                            <th style="width: 2em;">Doc</th>
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
                                <th><%=i %></th>
                                <th>
                                    <form>
                                        <input class="button" style="margin: 0;" type="submit" value="D">
                                    </form>
                                </th>
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
