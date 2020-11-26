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
        <link href="../css/Style-Session.css" rel="stylesheet" type="text/css"/>
        <title>Session</title>
    </head>
    <body>
        <header class="content-header">
        </header>
        <form class="content">
            <fieldset class="content-field">
                <legend>Datos personales</legend>
                <div class="content-field_line">
                    <label>Nombre:</label>
                    <input class="content-field_input_uno" type="text"/>
                </div>
                <div class="content-field_line">
                    <label>Apellido paterno:</label>
                    <input class="content-field_input_dos" type="text"/>
                </div>
                <div class="content-field_line">
                    <input class="content-field_input_submit" type="submit" value="Actualizar"/>
                </div>
            </fieldset>
            <fieldset class="content-field">
                <legend>Contraseña</legend>
                <div class="content-field_line">
                    <label>Contraseña actual:</label>
                    <input class="content-field_uno" type="password"/>
                </div>
                <div class="content-field_line">
                    <label>Nueva contraseña:</label>
                    <input class="content-field_uno" type="password"/>
                </div>
                <div class="content-field_line">
                    <input class="content-field_input_submit" type="submit" value="Cambiar"/>
                </div>
            </fieldset>
        </form>
        <footer class="content-footer">
            <a class="content-footer_link" href="home.jsp">Regresar</a>
        </footer>
    </body>
</html>
