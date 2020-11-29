<%-- 
    Document   : addUser
    Created on : 19/11/2020, 10:17:25 AM
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
        <link href="../css/Style-AddUser.css" rel="stylesheet" type="text/css"/>
        <title>Add user</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            //Usuario user = sec.getUser();
        %>
        <header class="content-header">
            <form class="content-header" action="/GestionBiblioteca/ControlUsuario" method="POST">
                <label class="content-header_line" >Identificador:
                    <input id="cl" type="hidden" name="clave" value="b"/>
                    <input type="text" id="buscar" name="idUsuario">
                </label>  
                <input id="btnSear" class="content-header_input" type="submit" value="Buscar">
                <input id="btnChan" class="content-header_input" type="submit" value="Modificar">
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
        <nav>
            <form action="/GestionBiblioteca/ControlUsuario" method="POST">
            <fieldset>
                <legend>Usuario</legend>
                <div class="content-item">
                    <label for="us">Username:</label>
                    <input class="right" type="text" id="us" name="username"> 
                </div> 
                <div class="content-item">
                    <label for="no">Nombre:</label>
                    <input class="right" type="text" id="no"  name="nombre"   > 
                </div>
                <div class="content-item">
                    <label for="ap">Apellido paterno:</label>
                    <input class="right" type="text" id="ap" name="apePaterno"  >
                </div>
                <div class="content-item">
                    <label for="ti">Tipo:</label>
                    <select class="right" id="ti" name="tipo">
                        <option value="ADM">Administrador</option>
                        <option value="ENC">Encargado</option>
                    </select>
                </div>
                <div class="content-item">
                    <label for="es">Estado: </label>
                    <label class="right">
                        <input type="checkbox" id="es" name="estado" value="BLO">
                        Bloqueado
                    </label>
                </div>
                <div class="content-item">
                    <input type="hidden" name="clave" value="agre"/>
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
                    <tbody id="bod">
                        <%
                            if(sec.getListaUsuario()!= null){
                            ArrayList<Usuario> lis = sec.getListaUsuario();
                            int i = 0;
                            for (Usuario u : lis) {
                            %>
                            <tr>
                                <th onclick="clicF(this)"id="<%=u.getIdUsuario()%>" ><%=u.getIdUsuario() %></th>
                                <th><%=u.getNombre() %></th>
                                <th><%=u.getApePaterno() %></th>
                                <th><%=u.getEstado() %></th>
                                <th> <%= (u.getTipo().equals("ADM"))?"Administrador":"Encargado"%></th>
                            </tr>
                            <%
                                }}
                            %>
                        
                    </tbody>
                </table>
            </article>
        </section>
        <footer class="content-footer">
            <ul class="content">
                    <%
                        if (sec.getMensaje() != null) {
                    %>
                    <li><a class="content-item_footer" href=""><%= sec.getMensaje() %></a></li>
                    <%
                        sec.setMensaje(null);
                        }
                    %>
            </ul>
        </footer>
        <script>
            document.getElementById('btnChan').addEventListener('click', ()=> {
                let hiden = document.getElementById('cl');
                hiden.value = 'chan';
            });
            document.getElementById('btnSear').addEventListener('click', ()=> {
                let hiden = document.getElementById('cl');
                hiden.value = 'sear';
            });
            function clicF (e) {
               document.getElementById('buscar').value = e.id;
            }
        </script>
    </body>
</html>
