<%-- 
    Document   : addStudent
    Created on : 19/11/2020, 10:15:11 AM
    Author     : DanielHernandezReyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar Alumno</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}


nav {
  float: left;
  width: 30%;
  height: 300px; 

  padding: 20px;
}



article {
  float: left;
  padding: 20px;
  width: 70%;
}


section:after {
  content: "";
  display: table;
  clear: both;
}



@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
legend { 
                margin-left: calc(50% - 150px - 1px); 
            }
form { 
                width: 40%; 
            } 
.right {
  float: right;

}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 2px solid #dddddd;
  text-align: left;
  padding: 10px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
.button {
   border-top: 1px solid #96d1f8;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#65a9d7));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   padding: 5px 10px;
   -webkit-border-radius: 8px;
   -moz-border-radius: 8px;
   border-radius: 8px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 14px;
   font-family: Helvetica, Arial, Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border-top-color: #28597a;
   background: #28597a;
   color: #ccc;
   }
.button:active {
   border-top-color: #1b435e;
   background: #1b435e;
   }

    </style>
    </head>
    <body>
        <section>
            <nav>
                <fieldset >
                    <legend>Estudaintes</legend>

                    <label for="matricula"> Matricula </label>
                    <input class="right" type="text" id="matricula" name="matricula"  > 

                    <br><br>

                    <label for="ap"> Apellido paterno: </label>
                    <input class="right" type="text" id="ap"  name="ap"   > 

                    <br><br>

                    <label for="am"> Apellido Materno </label>
                    <input class="right" type="text" id="am" name="am"  > 
                    
                    <br><br>
                    
                    <label for="nombre"> Nombre: </label>
                    <input class="right" type="text" id="nombreUno" name="nombre" > 
                    <br><br>
                    <input class="right" type="text" id="nombreDos" name="nombre"  > 
                    <br><br> 
                    <input class="right" type="text" id="nombreTres" name="nombre"  > 
                    <br><br> 
                    <input class="right" type="text" id="nombreCuatro" name="nombre"  > 
                    <br><br>
                    <label for="carrera">Carrera: </label>
                    <select class="right" id="carrera" name="carrera">
                        <option value="sistemas">Sistemas Computacionales</option>
                        <option value="logistica">Logistica</option>
                        <option value="gestion">Gestion Empresarial</option>
                        <option value="arqui">Arquitectura</option>
                        <option value="electro">Electromecanica</option>
                        <option value="tics">TIC's</option>
                    </select>
                    <br><br>
                    <label for="estado">Estado: </label>
                    <input type="radio" id="estado" name="estado" value="estado">
                    <label for="estado">Estado</label>
                    <br><br>
                    <center><input class="button" type="submit" value="Agregar"></center>
                </fieldset> 
            </nav>
            <article>
               <center><input class="button" type="submit" value="Modificar">
               <input class="button" type="submit" value="Regresar"></center> 
                <br><br>
                <table>
                <tr>
                <th>Matricula</th>
                <th>Estado</th>
                <th>Apellido P</th>
                <th>Apellido M</th>
                <th>Nombre</th>
                <th>Nombre</th>
                <th>Nombre</th>
                <th>Nombre</th>
                <th>Carrera</th>
                </tr>
              </table>
            </article>
        </section>
    </body>
</html>
