<%-- 
    Document   : session
    Created on : 19/11/2020, 10:13:48 AM
    Author     : DanielHernandezReyes
--%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page import="mx.com.biblioteca.modelo.beans.Usuario"%>
<%@page session="true" %>
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
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            Usuario user = sec.getUser();
        %>
        <header class="content-header"></header>
        <form class="content content-margin" action="/GestionBiblioteca/ControlSession" method="POST">
            <fieldset class="content-field content-margin">
                <legend>Datos personales</legend>
                <div class="content-field_line content-margin">
                    <label>Nombre:</label>
                    <input class="content-field_input_uno" type="text" name="nombre" value="<%=user.getNombre() %>"/>
                </div>
                <div class="content-field_line content-margin">
                    <label>Apellido paterno:</label>
                    <input class="content-field_input_dos" type="text" name="apePa" value="<%=user.getApePaterno() %>"/>
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
