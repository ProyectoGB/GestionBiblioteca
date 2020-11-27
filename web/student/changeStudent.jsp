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
            <a class="content-header_link" href="addStudent.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form>
                <fieldset >
                    <legend>Modificar estudiante</legend>
                    <div class="content-center_line">
                        <label for="matricula">Matricula:</label>
                        <input class="right" type="text" id="matricula" name="matricula"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="apP">Apellido Paterno:</label>
                        <input class="right" type="text" id="aP"  name="ap"   > 
                    </div>
                    <div class="content-center_line">
                        <label for="apM">Apellido Materno:</label>
                        <input class="right" type="text" id="apM" name="am"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="n1">Nombre 1:</label>
                        <input class="right" type="text" id="n1" name="nombre" > 
                    </div>
                    <div class="content-center_line">
                        <label for="n2">Nombre 2:</label>
                        <input class="right" type="text" id="n2" name="nombre"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="n3">Nombre 3:</label>
                        <input class="right" type="text" id="n3" name="nombre"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="n4">Nombre 4:</label>
                        <input class="right" type="text" id="n4" name="nombre"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="car">Carrera:</label>
                        <select class="right" id="car" name="carrera">
                            <option value="sistemas">Sistemas Computacionales</option>
                        </select>
                    </div>
                    
                    <div class="content-center_line">
                        <label for="est">Estado:</label>
                        <label class="right" for="estado">
                            <input type="checkbox" id="est" name="estado" value="estado">
                            Activo
                        </label>
                    </div>
                    <div class="content-center_line">
                        <input class="button" type="submit" value="Actualizar">
                    </div>

                </fieldset> 
                <form>
            </nav>
            <article> 
                <fieldset >
                    <legend>Actualizado</legend>
                    <div class="content-center_line">
                        <label> Matricula:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label> Apellido paterno:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label> Apellido materno:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label>Nombre 1:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label>Nombre 2:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label>Nombre 3:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label>Nombre 4:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label>Carrera:</label>
                        <label class="right">dasdas das dasdassda asdasd dasds</label>
                    </div>
                    
                    <div class="content-center_line">
                        <label>Estado:</label>
                        <label class="right">asd</label>
                    </div>

                </fieldset>
                
            </article>
        </section>
        <footer class="content-footer"></footer>
    </body>
</html>
