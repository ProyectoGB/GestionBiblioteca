<%-- 
    Document   : service
    Created on : 19/11/2020, 10:12:58 AM
    Author     : DanielHernandezReyes
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service</title>
        <link href="../css/Style-Servicios.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <center>
        <h1>Bienvenido a la seccion de los servicios</h1>
        <form action="" method="post">
            <fieldset id="Agr">
                <legend>Agregar Servicios</legend>
                <label id="nom" for="usuario">Nombre:</label> 
                <input type="text" name="nombre">
                <br><br>
                <label id="est" for="usuario">Estado:</label> 
                <input type="radio" id="estado" name="estado" value="">Activo
                <br><br>
                <input id="agregar" type="submit" value="Agregar">
                <br><br>
            </fieldset>
            <br><br>
            <fieldset id="Mod">  
                <legend>Modificar Servicios</legend>
                <label id="nomMod" for="usuario">Nombre:</label> 
                <input type="text" name="nombreMod">
                <br><br>
                <label id="estMod" for="usuario">Estado:</label> 
                <input type="radio" id="estadoMod" name="estadoMod" value="">Activo
                <br><br>
                <input id="modificar" type="submit" value="Modificar">
                <br><br>
            </fieldset>
            <br><br>
            <label id="ident" for="usuario">Identificador:</label> 
            <input id="identificador" type="text" name="identificador">      <input id="regresar" type="button" value="Buscar" onclick="">
            <br><br>
            <a href="http://localhost:8080/GestionBiblioteca/session/home.jsp"><input id="regresar" type="button" value="Regresar"></a>
            <br><br>
            <table class="tabla">
                <tbody><tr>
                        <th>Identificador</th>
                        <th>Estado</th>
                        <th>Nombre</th>
                    </tr>
                </tbody></table>
            <br><br>
        </form>
    </center>
</body>
</html>

