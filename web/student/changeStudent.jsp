<%-- 
    Document   : changeStudent
    Created on : 19/11/2020, 10:15:34 AM
    Author     : DanielHernandezReyes
--%>

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
        <header class="content-header">
            <form class="content-header">
                <label class="content-header_line" >Matricula:
                    <input type="text" id="buscar" name="buscar">
                </label>  
                <input class="content-header_input" type="submit" value="Buscar">
            </form>
            
            <a class="content-header_link" href="addStudent.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form>
                <fieldset >
                    <legend>Estudiantes</legend>
                    <div class="content-center_line">
                        <label for="matricula"> Matricula:</label>
                        <input class="right" type="text" id="matricula" name="matricula"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="ap"> Apellido Paterno:</label>
                        <input class="right" type="text" id="ap"  name="ap"   > 
                    </div>
                    <div class="content-center_line">
                        <label for="am"> Apellido Materno:</label>
                        <input class="right" type="text" id="am" name="am"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Nombre 1:</label>
                        <input class="right" type="text" id="nombreUno" name="nombre" > 
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Nombre 2:</label>
                        <input class="right" type="text" id="nombreDos" name="nombre"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Nombre 3:</label>
                        <input class="right" type="text" id="nombreTres" name="nombre"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Nombre 4:</label>
                        <input class="right" type="text" id="nombreCuatro" name="nombre"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="carrera">Carrera:</label>
                        <select class="right" id="carrera" name="carrera">
                            <option value="sistemas">Sistemas Computacionales</option>
                        </select>
                    </div>
                    
                    <div class="content-center_line">
                        <label for="estado">Estado:</label>
                        <label class="right" for="estado">
                            <input type="checkbox" id="estado" name="estado" value="estado">
                            Activo
                        </label>
                    </div>
                    <div class="content-center_line">
                        <input class="button" type="submit" value="Modificar">
                    </div>

                </fieldset> 
                <form>
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
