<%-- 
    Document   : addUser
    Created on : 19/11/2020, 10:17:25 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/Style-AddUser.css" rel="stylesheet" type="text/css"/>
        <title>Add user</title>
    </head>
    <body>
        <header class="content-header">
            <form class="content-header">
                <label class="content-header_line" >Identificador:
                    <input type="text" id="buscar" name="buscar">
                </label>  
                <input class="content-header_input" type="submit" value="Buscar">
            </form>
            <a class="content-header_link" href="changeUser.jsp">Modificar</a>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
        <nav>
            <form>
            <fieldset>
                <legend>Estudiante</legend>
                <div class="content-item">
                    <label for="matricula">Usuario:</label>
                    <input class="right" type="text" id="matricula" name="matricula"> 
                </div> 
                <div class="content-item">
                    <label for="ap">Nombre:</label>
                    <input class="right" type="text" id="ap"  name="ap"   > 
                </div>
                <div class="content-item">
                    <label for="am">Apellido paterno:</label>
                    <input class="right" type="text" id="am" name="am"  >
                </div>
                <div class="content-item">
                    <label for="nombre">Tipo:</label>
                    <input class="right" type="text" id="nombreUno" name="nombre" >
                </div>
                <div class="content-item">
                    <label for="estado">Estado: </label>
                    <label class="right">
                        <input type="checkbox" id="estado" name="estado" value="estado">
                        Bloqueado
                    </label>
                </div>
                <div class="content-item">
                    <input class="button" type="submit" value="Agregar">
                </div>
            </fieldset>
            </form>
        </nav>
            <article>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 2em;">Usuario</th>
                            <th style="width: 2em;">Nombre</th>
                            <th style="width: 8em;">Apellido paterno</th>
                            <th style="width: 2em;">Estado</th>
                            <th style="width: 4em;">Tipo</th>
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
        <footer class="content-footer">
            
        </footer>
    </body>
</html>
