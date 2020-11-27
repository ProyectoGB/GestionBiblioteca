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
        <header class="content-header"></header>
        <center>
            <h1>¡Error en el sistema!</h1>
            <h2>Descripción del error:</h2>
            <p>
                <%= request.getAttribute("msjError") %>
            </p>
            <a class="content-link" href="../session/home.jsp" >Regresar</a>
        </center>
        <footer class="content-footer"></footer>
    </body>
</html>
