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
            <a class="content-header_link" href="../session/home.jsp">Cancelar</a>
        </header>
        <section>
            <nav>
                <form action="" method="POST">
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
                </form>
                <div class="content-center_line"></div>
                <fieldset>
                    <div class="content-center_line">
                        <label>Apellido Paterno:</label>
                        <label> Apellido Paterno:</label>
                    </div>
                    <div class="content-center_line">
                        <label>Apellido Materno:</label>
                        <label>Apellido Materno: asddasd</label>
                    </div>
                    <div class="content-center_line">
                        <label>Nombre:</label>
                        <label>Nombre: dasdad</label>
                    </div>
                    <div class="content-center_line">
                        <label>Carrera:</label>
                        <label>Carrera dasdas</label>
                    </div>
                </fieldset>
            </nav>
            <article>
                <form>
                    <fieldset>
                        <legend>Solicitar servicio</legend>
                        <%
                            for (int i = 0; i < 5; i++) {
                        %>
                        <div class="content-center_line">
                            <label for="estado">Estado: </label>
                            <label class="right">
                                <input type="checkbox" id="estado" name="estado" value="">
                                Solicitar
                            </label>
                        </div>
                        <%
                            }
                        %>
                        <div class="content-center_line">
                            <input class="button" type="submit" value="Agregar">
                        </div>

                    </fieldset> 
                </form>
            </article>
        </section>
        <footer class="content-footer"></footer>
    </body>
</html>
