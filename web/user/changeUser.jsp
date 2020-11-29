<%-- 
    Document   : changeUser
    Created on : 19/11/2020, 10:17:40 AM
    Author     : DanielHernandezReyes
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.biblioteca.modelo.beans.Usuario"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/Style-ChangeUser.css" rel="stylesheet" type="text/css"/>
        <title>Change user</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            Usuario lis = sec.getListaUsuario().get(0);
        %>
        <header class="content-header">
            <a class="content-header_link" href="addUser.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form action="/GestionBiblioteca/ControlUsuario" method="POST">
                <fieldset >
                    <legend>Modificar Usuario</legend>
                    <div class="content-center_line">
                        <label>Usuario:</label>
                        <input class="right" type="text" readonly name="username" value="<%= lis.getIdUsuario() %>" /> 
                    </div>
                    <div class="content-center_line">
                        <label for="nom">Nombre:</label>
                        <input class="right" type="text" id="apP" name="nom" value="<%= lis.getNombre() %>"  /> 
                    </div>
                    <div class="content-center_line">
                        <label for="apP">Apellido paterno:</label>
                        <input class="right" type="text" id="apM" name="apP" value="<%= lis.getApePaterno() %>" > 
                    </div>
                    <div class="content-center_line">
                        <label for="ti">Tipo de usuario:</label>
                        <select class="right" id="ti" name="tipo" s>
                        <%
                            if(lis.getTipo().equals("ADM")) {
                        %>
                            <option value="ADM" selected="true">Administrador</option>
                            <option value="ENC">Encargado</option>
                        <%
                            } else {
                        %>
                            <option value="ADM">Administrador</option>
                            <option value="ENC" selected="true">Encargado</option>
                        <%
                            }
                        %>
                        </select>
                    </div>
                    
                    <div class="content-center_line">
                        <label for="est">Estado:</label>
                        <label class="right" for="estado">
                        <% 
                            String es = lis.getEstado();
                            if(es.equals("BLO")) {
                        %>
                        <input type="checkbox" id="est" name="estado" value="estado" checked >
                            Bloqueado
                        </label>
                        <%
                            } else {
                        %>
                        <input type="checkbox" id="est" name="estado" value="estado">
                            Bloqueado
                        </label>
                        <%
                            }
                        %>
                    </div>
                    <div class="content-center_line">
                        <input type="hidden" name="clave" value="actu"/>
                        <input class="button" type="submit" value="Actualizar"/>
                    </div>
                </fieldset> 
                </form>
            </nav>
            <article> 
                <fieldset >
                    <legend>Actualizado</legend>
                    <%
                        if(sec.getListaUsuario().size() != 2){ 
                    %>
                    <div class="content-center_line"><label>Usuario:</label><label class="right"></label></div>
                    <div class="content-center_line"><label>Nombre:</label><label class="right"></label></div>
                    <div class="content-center_line"><label>Apellido paterno:</label><label class="right"></label></div>
                    <div class="content-center_line"><label>Tipo de usuario:</label><label class="right"></label></div>
                    <div class="content-center_line"><label>Estado:</label><label class="right">asd</label></div>
                    <%
                        } else {
                            Usuario u = sec.getListaUsuario().get(1);
                    %>
                    <div class="content-center_line"><label>Usuario:</label><label class="right"><%= u.getIdUsuario() %></label></div>
                    <div class="content-center_line"><label>Nombre:</label><label class="right"><%= u.getNombre() %></label></div>
                    <div class="content-center_line"><label>Apellido paterno:</label><label class="right"><%= u.getApePaterno() %></label></div>
                    <div class="content-center_line"><label>Tipo de usuario:</label><label class="right"><%= u.getTipo() %></label></div>
                    <div class="content-center_line"><label>Estado:</label><label class="right">asd</label><%= u.getEstado() %></div>
                    <%
                        }
                        sec.setListaUsuario(null);
                    %>
                </fieldset>                
            </article>
        </section>
        <footer class="content-footer">

        </footer>
    </body>
</html>
