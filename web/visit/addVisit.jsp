<%-- 
    Document   : addVisit
    Created on : 19/11/2020, 10:18:20 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/Style-AddVisit.css" rel="stylesheet" type="text/css"/>
        <title>Add visit</title>
    </head>
    <body>
        <header class="content-header">
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form>
                <fieldset >
                    <legend>Alumno</legend>
                    <div class="content-center_line">
                        <label for="matricula">Matricula:</label>
                        <input class="right" type="text" id="matricula" name="matricula"  > 
                    </div>
                    <div class="content-center_line">
                        <input class="button" type="submit" value="Buscar">
                    </div>
                    
                </fieldset> 
                <form>
                <div class="content-center_line"></div>
                <fieldset>
                    <div class="content-center_line">
                        <label for="ap">Apellido Paterno:</label>
                        <label for="ap"> Apellido Paterno:</label>
                    </div>
                    <div class="content-center_line">
                        <label for="am">Apellido Materno:</label>
                        <label for="am">Apellido Materno: asddasd</label>
                    </div>
                    <div class="content-center_line">
                        <label for="am">Nombre:</label>
                        <label for="am">Nombre: dasdad</label>
                    </div>
                    <div class="content-center_line">
                        <label for="nombre">Carrera:</label>
                        <label for="nombre">Carrera dasdas</label>
                    </div>
                </fieldset>
                    
            </nav>
            <article>
                <form>
                <fieldset>
                    <legend>Solicitar servicio</legend>
                    <div class="content-center_line">
                        <label for="estado">Estado: </label>
                        <label class="right">
                            <input type="checkbox" id="estado" name="estado" value="estado">
                            Solicitar
                        </label>
                    </div>
                    
                    <div class="content-center_line">
                        <input class="button" type="submit" value="Generar">
                    </div>

                </fieldset> 
                <form>
            </article>
        </section>
        <footer class="content-footer"></footer>
    </body>
</html>
