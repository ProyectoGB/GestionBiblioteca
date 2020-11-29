<%-- 
    Document   : career
    Created on : 19/11/2020, 10:09:08 AM
    Author     : DanielHernandezReyes
--%>


<%@page import="mx.com.biblioteca.modelo.beans.Carrera"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/Style-Career.css" rel="stylesheet" type="text/css"/>
        <title>Career</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            //Usuario user = sec.getUser();
        %>
        <header class="content-header">
            <form class="content-header" action="/GestionBiblioteca/ControlCarrera" method="POST">
                <label class="content-header_line" >Identificador:
                    <input id="cl" type="hidden" name="clave" value="b"/>
                    <input type="text" id="buscar" name="idCarrera">
                </label>  
                <input class="content-header_input" id="btnSear" type="submit" value="Buscar"/>
                <input class="content-header_input" id="btnChan" type="submit" value="Modificar"/>
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form action="/GestionBiblioteca/ControlCarrera" method="POST" >
                    <fieldset >
                        <legend>Carrera nueva</legend>
                        <div class="content-center_line">
                            <label for="matricula"> Nombre:</label>
                            <input class="right" type="text" id="matricula" name="idC"  > 
                        </div>
                        <div class="content-center_line">
                            <label for="estado">Estado:</label>
                            <label class="right" for="estado">
                                <input type="checkbox" id="estado" name="eTa" checked value="estado">
                                Activo
                            </label>
                        </div>
                        <div class="content-center_line">
                            <input type="hidden" name="clave" value="addC"/>
                            <input class="button" type="submit" value="Agregar"/>
                        </div>
                    </fieldset> 
                </form>
                <div class="content-center_line"></div>
                <form action="/GestionBiblioteca/ControlCarrera" method="POST" >
                    <fieldset>
                        <legend>Modificar carrera</legend>
                        <%
                            if(sec.getMensaje() != null && sec.getMensaje().equals("Datos obtenidos")){
                                Carrera c = sec.getListaCarrera().get(0);
                        %>
                        <div class="content-center_line"><label for="iden"> Identificador:</label>
                            <input class="right" id="iden" type="text" readonly name="idenT" value="<%= c.getIdCarrera() %>" /></div>
                        <div class="content-center_line"><label for="nom"> Nombre:</label>
                            <input class="right" type="text" id="nom" name="nomT" value="<%= c.getNombre() %>"  ></div>
                        <div class="content-center_line"><label for="es">Estado:</label>
                            <% if(c.getEstado().equals("EX")){ %>
                            <label class="right" for="es"><input type="checkbox" id="estado2" name="std" value="AC">Activo</label>
                            <% } else { %>
                            <label class="right" for="es"><input type="checkbox" id="estado2" name="std" checked value="AC">Activo</label>
                            <% } %>
                        </div>
                        <%
                            } else {
                        %>
                            <div class="content-center_line"><label for="iden"> Identificador:</label><input class="right" id="iden" type="text" readonly name="iden" /></div>
                            <div class="content-center_line"><label for="nom"> Nombre:</label><input class="right" type="text" id="nom" name="nom"  ></div>
                            <div class="content-center_line"><label for="es">Estado:</label>
                                <label class="right" for="es"><input type="checkbox" id="estado2" name="estado" value="AC">Activo</label>
                            </div>
                        <%
                            }
                        %>
                        <div class="content-center_line">
                            <input type="hidden" name="clave" value="mOdi"/>
                            <input class="button" type="submit" value="Actualizar">
                        </div>
                    </fieldset> 
                </form>
            </nav>
            <article>
                <table>
                    <thead>
                            <tr>
                                <th style="width: 2em;">Identificador</th>
                                <th style="width: 2em;">Estado</th>
                                <th style="width: 15em;">Nombre</th>
                            </tr>
                    </thead>
                    <tbody>
                        <%
                            if(sec.getMensaje() != null && sec.getMensaje().equals("Lista generada")){
                            for (Carrera u: sec.getListaCarrera()) {

                        %>

                        <tr>
                            <th onclick="clicF(this)"id="<%=u.getIdCarrera()%>"><%=u.getIdCarrera()%></th>
                            <th><%=u.getEstado() %></th>
                            <th><%=u.getNombre() %></th>
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
                    sec.setListaCarrera(null);
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
