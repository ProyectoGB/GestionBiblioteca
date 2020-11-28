<%-- 
    Document   : login
    Created on : 19/11/2020, 10:19:06 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Style-Login.css" rel="stylesheet" type="text/css"/>
        <title>Login</title>
    </head>
    <body>
        <div class="content-principal" >
            <div class="content content-margin">
                <img class="content-margin content-usuario_img" src="img/usuario.svg">
                <a href="https://www.flaticon.es/autores/chanut" title="Chanut"></a>
                <a href="https://www.flaticon.es/" title="Flaticon"></a>
                <form action="Login?sal=exit" method="POST" >
                    <div class="content-margin content-linea" >
                        <label class="content-linea_label_uno" for="user">Usuario:</label>
                        <input class="content-linea_input" id="user" type="text" name="idUsuario" />
                    </div>
                    <div class="content-margin content-linea" >
                        <label class="content-linea_label_dos" for="pass">Contraseña:</label>
                        <input class="content-linea_input" id="pass" type="password" name="contra" />
                    </div>
                    <div class="content-margin content-linea" >
                        <input type="hidden" name="clave" value="log"/>
                        <input class="content-margin content-padding content-linea_tres" type="submit" value="Ingresar">
                    </div>
                </form>
                <div class="content-margin content-linea"  >
                    <a class="content-margin content-padding content-linea_boton content-linea_cuatro" href="index.html" >Cancelar</a>
                </div>
            </div>
        </div>
    </body>
</html>
