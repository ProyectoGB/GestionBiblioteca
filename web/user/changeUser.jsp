<%-- 
    Document   : changeUser
    Created on : 19/11/2020, 10:17:40 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/Style-ChangeUser.css" rel="stylesheet" type="text/css"/>
        <title>Change user</title>
    </head>
    <body>
        <header class="content-header">
            <a class="content-header_link" href="addUser.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form>
                <fieldset >
                    <legend>Modificar Usuario</legend>
                    <div class="content-center_line">
                        <label for="matricula">Usuario:</label>
                        <label class="right">sdaads</label> 
                    </div>
                    <div class="content-center_line">
                        <label for="apP">Nombre:</label>
                        <input class="right" type="text" id="aP"  name="ap"   > 
                    </div>
                    <div class="content-center_line">
                        <label for="apM">Apellido paterno:</label>
                        <input class="right" type="text" id="apM" name="am"  > 
                    </div>
                    <div class="content-center_line">
                        <label for="car">Tipo de usuario:</label>
                        <select class="right" id="car" name="carrera">
                            <option value="sistemas">Sistemas Computacionales</option>
                        </select>
                    </div>
                    
                    <div class="content-center_line">
                        <label for="est">Estado:</label>
                        <label class="right" for="estado">
                            <input type="checkbox" id="est" name="estado" value="estado">
                            Bloqueado
                        </label>
                    </div>
                    <div class="content-center_line">
                        <input class="button" type="submit" value="Actualizar">
                    </div>
                </fieldset> 
                <form>
            </nav>
            <article> 
                <fieldset >
                    <legend>Actualizado</legend>
                    <div class="content-center_line">
                        <label> Usuario:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label>Nombre:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label> Apellido paterno:</label>
                        <label class="right">dasdas das</label> 
                    </div>
                    <div class="content-center_line">
                        <label>Tipo de usuario:</label>
                        <label class="right">dasdas das dasdassda asdasd dasds</label>
                    </div>
                    
                    <div class="content-center_line">
                        <label>Estado:</label>
                        <label class="right">asd</label>
                    </div>

                </fieldset>
                
            </article>
        </section>
        <footer class="content-footer"></footer>
    </body>
</html>
