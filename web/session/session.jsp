<%-- 
    Document   : session
    Created on : 19/11/2020, 10:13:48 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-Session.css" rel="stylesheet" type="text/css"/>
        <title>Session</title>
    </head>
    <body>
        <header class="content-header"></header>
        <form class="content content-margin">
            <fieldset class="content-field content-margin">
                <legend>Datos personales</legend>
                <div class="content-field_line content-margin">
                    <label>Nombre:</label>
                    <input class="content-field_input_uno" type="text"/>
                </div>
                <div class="content-field_line content-margin">
                    <label>Apellido paterno:</label>
                    <input class="content-field_input_dos" type="text"/>
                </div>
                <div class="content-field_line content-margin">
                    <input class="content-field_input_submit" type="submit" value="Actualizar"/>
                </div>
            </fieldset>
        </form>
        <form class="content content-margin">
            <fieldset class="content-field content-margin">
                <legend>Contraseña</legend>
                <div class="content-field_line content-margin">
                    <label>Contraseña actual:</label>
                    <input class="content-field_uno" type="password"/>
                </div>
                <div class="content-field_line content-margin">
                    <label>Nueva contraseña:</label>
                    <input class="content-field_uno" type="password"/>
                </div>
                <div class="content-field_line content-margin">
                    <input class="content-field_input_submit" type="submit" value="Cambiar"/>
                </div>
            </fieldset>
        </form>
        <footer class="content-footer">
            <a class="content-footer_link" href="home.jsp">Regresar</a>
        </footer>
    </body>
</html>
