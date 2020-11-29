<%-- 
    Document   : error
    Created on : 19/11/2020, 10:11:20 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link href="../css/Style-Error.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
        %>
        <header class="content-header"></header>
        <center>
            <h1>¡Error en el sistema!</h1>
            <h2>Descripción:</h2>
            <p>
                <%= sec.getErrorMsj() %>
            </p>
            <p>
                <%= sec.getErrorExe() %>
            </p>
            <%
                sec.setErrorExe(null);
                sec.setErrorMsj(null);
            %>
            <a class="content-link" href="<%= sec.getErrorUrl() %>" >Regresar</a>
            <% sec.setErrorUrl(null); %>
        </center>
        <footer class="content-footer"></footer>
    </body>
</html>
