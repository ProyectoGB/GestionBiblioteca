<%-- 
    Document   : home
    Created on : 19/11/2020, 10:13:31 AM
    Author     : DanielHernandezReyes
--%>
<%@page import="mx.com.biblioteca.modelo.beans.Usuario"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-Home.css" rel="stylesheet" type="text/css"/>
        <title>Home</title>
    </head>
    <body>
        <header>
            <nav>
                <ul class="content">
                    
                    <li><a class="content-item" href="../student/addStudent.jsp">Alumnos</a></li>
                    <li><a class="content-item" href="../report/addReport.jsp">Reportes</a></li>
                    <li><a class="content-item" href="../visit/changeVisit.jsp">Visitas</a></li>
                    <li><a class="content-item" href="../service/service.jsp">Servicios</a></li>
                    <li><a class="content-item" href="../career/career.jsp">Carreras</a></li>
                    <li><a class="content-item" href="../visit/addVisit.jsp" target="blank">Control</a></li>
                    <li><a class="content-item" href="../user/addUser.jsp">Usuarios</a></li>
                    <li><a class="content-item" href="../error/error.jsp">Error</a></li>
                </ul>
            </nav>
        </header>
        <div class="content-center">
            <form class="content-center_form" action="Login" method="POST">
                <div class="content-center_line content-margin" >
                    <img class="content-center_line_img" src="../img/usuario.svg" alt="usuario">
                </div>
                <div class="content-center_line content-margin" >
                    <h1 class="content-line_h1 content-margin" >Bienvenido</h1>
                    <%
                        HttpSession sesion = request.getSession();
                        Usuario user = (Usuario) sesion.getAttribute("user");
                    %>
                    <label class="content-line_label" ><%= user.getNombre() %> <%= user.getApePaterno() %></label>
                    
                </div>
                <div class="content-center_line content-margin" >
                    <input type="hidden" name="clave" value="exit"/>
                    <input class="content-line_input" type="submit" value="Cerrar sesión"/>
                </div>
            </form>
        </div>
        <footer class="content-footer" >
            <nav>
                <ul class="content">
                    <li><a class="content-item" href="session.jsp">Cuenta</a></li>
                </ul>
            </nav>
        </footer>
    </body>
</html>
