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
        <header class="content-header">
            <form class="content-header">
                <label class="content-header_line" >Identificador:
                    <input type="text" id="buscar" name="buscar">
                </label>  
                <input class="content-header_input" type="submit" value="Buscar">
                <input class="content-header_input" type="button" value="Modificar">
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form method="POST" >
                    <fieldset >
                        <legend>Servicio nuevo</legend>
                        <div class="content-center_line">
                            <label for="matricula"> Nombre:</label>
                            <input class="right" type="text" id="matricula" name="matricula"  > 
                        </div>
                        <div class="content-center_line">
                            <label for="estado">Estado:</label>
                            <label class="right" for="estado">
                                <input type="checkbox" id="estado" name="estado" value="estado">
                                Activo
                            </label>
                        </div>
                        <div class="content-center_line">
                            <input class="button" type="submit" value="Agregar">
                        </div>
                    </fieldset> 
                </form>
                <div class="content-center_line"></div>
                <form method="POST" >
                    <fieldset>
                        <legend>Modificar servicio</legend>
                        <div class="content-center_line">
                            <label for="matricula"> Nombre:</label>
                            <input class="right" type="text" id="matricula" name="matricula"  > 
                        </div>
                        <div class="content-center_line">
                            <label for="estado2">Estado:</label>
                            <label class="right" for="estado2">
                                <input type="checkbox" id="estado2" name="estado" value="estado">
                                Activo
                            </label>
                        </div>
                        <div class="content-center_line">
                            <input class="button" type="submit" value="Actualizar">
                        </div>
                    </fieldset> 
                <form>
            </nav>
            <article>
                <table>
                    <thead>
                            <tr>
                                <th style="width: 6em;">Identificador</th>
                                <th style="width: 2em;">Estado</th>
                                <th style="width: 15em;">Nombre</th>
                            </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < 5; i++) {

                            %>

                            <tr>
                                <th>123456789012</th>
                                <th><%=i %></th>
                                <th><%=i %></th>
                            </tr>
                            <%
                                }
                            %>

                    </tbody>
                </table>
            </article>
        </section>
        <footer class="content-footer"></footer>
    </body>
</html>

