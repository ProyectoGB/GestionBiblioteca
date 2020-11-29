<%-- 
    Document   : service
    Created on : 19/11/2020, 10:12:58 AM
    Author     : DanielHernandezReyes
--%>
<%@page import="mx.com.biblioteca.modelo.beans.Servicio"%>
<%@page import="mx.com.biblioteca.modelo.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service</title>
        <link href="../css/Style-Servicios.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Session sec = (Session) sesion.getAttribute("user");
            //Usuario user = sec.getUser();
        %>
        <header class="content-header">
            <form class="content-header" action="/GestionBiblioteca/ControlServicio" method="POST">
                <label class="content-header_line" >Identificador:
                    <input id="cl" type="hidden" name="clave" value="b"/>
                    <input type="text" id="buscar" name="idServicio">
                </label>  
                <input class="content-header_input" id="btnSear" type="submit" value="Buscar">
                <input class="content-header_input" id="btnChan" type="submit" value="Modificar">
            </form>
            <a class="content-header_link" href="../session/home.jsp">Regresar</a>
        </header>
        <section>
            <nav>
                <form action="/GestionBiblioteca/ControlServicio" method="POST" >
                    <fieldset >
                        <legend>Servicio nuevo</legend>
                        <div class="content-center_line">
                            <label for="noBr"> Nombre:</label>
                            <input class="right" type="text" id="noBr"  name="idC"  > 
                        </div>
                        <div class="content-center_line">
                            <label for="estado">Estado:</label>
                            <label class="right" for="estado">
                                <input type="checkbox" id="estado" name="eTa" checked value="estado">
                                Activo
                            </label>
                        </div>
                        <div class="content-center_line">
                            <input type="hidden" name="clave" value="addS"/>
                            <input class="button" type="submit" value="Agregar">
                        </div>
                    </fieldset> 
                </form>
                <div class="content-center_line"></div>
                <form action="/GestionBiblioteca/ControlServicio" method="POST" >
                    <fieldset>
                        <legend>Modificar servicio</legend>
                        <%
                            if(sec.getMensaje() != null && sec.getMensaje().equals("Datos obtenidos")){
                                Servicio c = sec.getListaServicio().get(0);
                        %>
                        <div class="content-center_line"><label for="iden"> Identificador:</label>
                            <input class="right" id="iden" type="text" readonly name="idenT" value="<%= c.getIdServicio()%>" /></div>
                        <div class="content-center_line">
                            <label for="nom">Nombre:</label><input class="right" type="text" id="nom" name="nomT" value="<%= c.getNombre() %>"    > 
                        </div>
                        <div class="content-center_line">
                            <label for="estado2">Estado:</label>
                        <% if(c.getEstado().equals("EX")){ %>
                            <label class="right" for="esT2"><input type="checkbox" id="esT2" name="std" value="AC">Activo</label>
                        <% } else { %>
                            <label class="right" for="esT2"><input type="checkbox" id="esT2" name="std" checked value="AC">Activo</label>
                        <% } %>
                        </div>
                        <%
                            } else {
                        %>
                            <div class="content-center_line">
                                <label for="iden">Identificador:</label><input class="right" id="iden" type="text" readonly name="idenT" value="" /></div>
                            <div class="content-center_line">
                                <label for="nom">Nombre:</label><input class="right" type="text" id="nom" name="nomT" value="">
                            </div>
                            <div class="content-center_line">
                                <label for="estado2">Estado:</label>
                                <label class="right" for="esT2"><input type="checkbox" id="esT2" name="std" value="AC">Activo</label>
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
                            for (Servicio u: sec.getListaServicio()) {
                        %>

                            <tr>
                                <th onclick="clicF(this)"id="<%=u.getIdServicio()%>"><%=u.getIdServicio()%></th>
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
                    sec.setListaServicio(null);
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

