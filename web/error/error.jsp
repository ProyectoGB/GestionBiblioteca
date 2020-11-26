<%-- 
    Document   : error
    Created on : 19/11/2020, 10:11:20 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link href="../css/Style-Error.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <center>
        <h1>¡Error en el sitema!</h1>
        <br><br>
        <h2>Descripción del error:</h2>
        <br>
        <h3><%= request.getAttribute("msjError") %></h3>
        <br>
         <a href="http://localhost:8080/GestionBiblioteca/session/home.jsp"><input id="regresar" type="button" value="Regresar"></a>
    </center>
    </body>
</html>
