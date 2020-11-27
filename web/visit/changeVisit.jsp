<%-- 
    Document   : changeVisit
    Created on : 19/11/2020, 10:18:36 AM
    Author     : DanielHernandezReyes
--%>

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
        <header class="content-header">
            <form class="content-header" action="" method="POST">
                <label class="content-header_line" >Matricula:
                    <input type="text" id="buscar" name="buscar">
                </label>  
                <input class="content-header_input" type="submit" value="Buscar">
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form action="" method="POST">
                <fieldset>
                    <legend>Visita</legend>
                    <div class="content-center_line">
                        <label for="carrera">Estado: </label>
                        <select class="right" id="carrera" name="carrera">
                            <option value="sistemas">ACT</option>
                        </select>
                    </div>
                    <div class="content-center_line">
                        <label for="matricula">Identificador:</label>
                        <input class="right" type="text" id="matricula" name="matricula"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="ap">Alumno:</label>
                        <input class="right" type="text" id="ap"  name="ap"   > 
                    </div>
                    <div class="content-center_line">
                        <label for="am">Fecha:</label>
                        <input class="right" type="date" id="am" name="am"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Hora de entrada:</label>
                        <input class="right" type="time" id="nombreUno" name="nombre" > 
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Hora de salida:</label>
                        <input class="right" type="time" id="nombreUno" name="nombre" > 
                    </div>
                    <fieldset>
                        <legend>Servicio solicitados</legend>
                        <div class="content-center_line">
                        <%
                            for (int i = 0; i < 4; i++) {
                        %>
                            <label class="right">
                                <input type="checkbox" id="estado" name="estado" value="estado">
                                Solicitar
                            </label>
                        <%
                            }
                        %>
                        </div>
                    </fieldset>
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
                            <th style="width: 6em;">Identificador</th>
                            <th style="width: 2em;">Matricula</th>
                            <th style="width: 2em;">Fecha</th>
                            <th style="width: 2em;">Entrada</th>
                            <th style="width: 2em;">Salida</th>
                            <th style="width: 15em;">Motivos</th>
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
