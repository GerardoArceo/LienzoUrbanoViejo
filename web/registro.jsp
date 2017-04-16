<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Funciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Funciones Funcion = new Funciones();
Usuario h = new Usuario();
String nombre=null;
String id=null;
String error=request.getParameter("error");
if(error==null)error="";
try {
    h = ((Usuario) session.getAttribute("user"));
    nombre = h.getNombre();
    id= h.getId();
} catch (Exception e) {
    e.printStackTrace();
}

ArrayList<ArrayList<String>> estados = new ArrayList();
estados.add(Funcion.verEstados(1));
estados.add(Funcion.verEstados(2));
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Únete a Lienzo Urbano</title>
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/animate/animate.css" />
        <link rel="stylesheet" href="assets/animate/set.css" />
        <link rel="stylesheet" href="assets/gallery/blueimp-gallery.min.css">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="assets/style.css">

        <script src="js/validacion.js" language="javascript" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.css">
        
        <%
        out.print("<script>");
        for(int x=0;x<estados.size();x++){
            out.println("var ciudades"+(x+1)+" = new Array();");
            for (int i = 0; i < estados.get(x).size(); i=i+2) {
                out.print("ciudades"+(x+1)+"["+i+"] = '"+estados.get(x).get(i)+"'; "
                        + "ciudades"+(x+1)+"["+(i+1)+"] = '"+estados.get(x).get(i+1)+"';");
            }
        }
        out.print("</script>");
        %>
        
        <script type="text/javascript">
            
            function cargarCiudades() {
                y=document.getElementById('ciudades');
                z=document.getElementById('paises');
                for(i=0;i<y.childElementCount;i=0){
                    y.remove(i);
                }

                if (z.value==="1") { 
                   for(var i=0; i< ciudades1.length; i=i+2) {
                       var option = document.createElement("option");
                       option.textContent=ciudades1[i+1];
                       option.value=ciudades1[i];
                       y.add(option);
                   }
                }else if (z.value==="2") {
                    for(var i=0; i< ciudades2.length; i=i+2) {
                      var option = document.createElement("option");
                      option.textContent=ciudades2[i+1];
                      option.value=ciudades2[i];
                      y.add(option);
                    }
                }
            }
        </script>
    
    </head>
    <body>
        <div class="topbar animated fadeInLeftBig"></div>
        <div class="navbar-wrapper">
            <div class="container">
                <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="top-nav">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.jsp"><img onclick="window.location='index.jsp'" src="images/logo.png" alt="Lienzo Urbano"></a>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="navbar-collapse  collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li ><a href="index.jsp">Inicio</a></li>
                                <li ><a href="top.jsp">Top</a></li>
                                <li ><a href="lienzoUrbano.jsp">¿Lienzo Urbano?</a></li>
                                <li ><a href="patrocinadores.jsp">Patrocinadores</a></li>
                                <%if(nombre==null){%>
                                <li ><a href="inicioSesion.jsp">Ingresar</a></li>
                                <%}else{%>
                                    <li ><a href="menu.jsp">Menú</a></li>
                                    <li>
                                        <form action="Menu" method="post" name="red"><input type="hidden" name="opc" value="1"></form>
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%out.print("Hola " + nombre);%> <i class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown-menu">
                                           <li><a onclick="Redirigir();">Ver mis datos</a></li>
                                           <li><a href="CerrarSesion">Cerrar Sesión</a></li>
                                        </ul>
                                    </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%if(error.equals("usuario")){%>
        <script>
            swal(
                'Error',
                'El usuario escogido ya está en uso, por favor elige otro',
                'error'
            );
        </script>
        <%}%>

        <%if(nombre==null){%>               
        
        <div class="contenido" id="up">
            <div class="text-center">
                <br><br><br><br>
                <h2>Únete a Lienzo Urbano!!!</h2><br>
                <p class="lead">Para ser parte de la comunidad solo tienes que llenar el siguiente formulario <i class="fa fa-smile-o"></i></p><br><br>
                <form action="Registro" method="POST" name="formu" enctype="multipart/form-data">
                    <div class="container">
                        <label>Nombre</label>
                        <input type="text" class="form-control" style="background-color: #FFE4E1;" name="nombre" placeholder="Nombre" size="30">
                        <br>
                        <label>Apellido Paterno</label>
                        <input type="text" class="form-control" style="background-color: #FFE4E1;" name="aPaterno" placeholder="Apellido Paterno" size="30">
                        <br>
                        <label>Apellido Materno</label>
                        <input type="text" class="form-control" style="background-color: #FFE4E1;" name="aMaterno" placeholder="Apellido Materno" size="30">
                        <br>
                        <label>Usuario</label>
                        <input type="text" class="form-control" style="background-color: #FFE4E1;" name="usuario" placeholder="Usuario" size="20">
                        <br>
                        <label>Contraseña</label>
                        <input type="password" class="form-control" style="background-color: #FFE4E1;" name="pass" placeholder="Contraseña" size="20">
                        <br>
                        <table>
                            <tr><th>Pais</th><th>Estado/Provincia</th></tr>
                            <tr>
                                <td>                        
                                    <select name="pais" onchange="cargarCiudades();" id="paises">
                                        <OPTION selected VALUE="">Selecciona un país</OPTION>
                                        <OPTION VALUE="1">México</OPTION>
                                        <OPTION VALUE="2">Argentina</OPTION>
                                    </select>
                                </td>
                                <td>
                                    <select name="ciudad" id="ciudades"></select>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table><tr><th>Fotografía
                        <a onclick="swal('Fotografía','Esta fotografía podrá ser visible por toda la comunidad y aparecerá en tu perfil de usuario.','info');"><i class="fa fa-info-circle"></i></a>         
                        </th></tr><tr><td><input type="file" name="foto" accept="image/*" onchange="loadFile(event)"/></td></tr><tr><td><img id="img"/></td></tr></table>
                        <script>
                        var loadFile = function(event) {
                            var output = document.getElementById('img');
                            output.src = URL.createObjectURL(event.target.files[0]);
                        };
                        </script>
                        <br><label>Contacto</label>
                        <a onclick="swal('Contacto','Especifica algún tipo de información para que las personas se puedan poner en contacto contigo. Por ejemplo:<br><br>Teléfono<br>Correo Electrónico<br>Redes Sociales','info');"><i class="fa fa-info-circle"></i></a>         
                        <br><textarea id="contacto" name="contacto" rows="5" cols="80"></textarea>
                        <br><br>
                        <button type="button" class="btn btn-primary btn-lg" onclick="validacionRU();" style="background-color: #DC143C">Registrarme</button>
                    </div>
                    <br><br><br><br>
                </form> 
            </div>
        </div>
        
        <%}else{%>
            <div class="contenido">
                <br><br><br><br>
                <h2>Error</h2><br>
                <h3>Para crear un nuevo usuario primero cierra tu sesión</h3>
            </div>
        <%}%>
        
        <footer>
            <div class="footer text-center spacer">
                <p class="wowload flipInX"><a href="https://www.facebook.com/Lienzo-Urbano-399847683716963/"><i class="fa fa-facebook fa-3x"></i></a>
                    <a href="https://www.youtube.com/channel/UCZRcqMrsukGeSX9XMEF-oyQ"><i class="fa fa-youtube fa-3x"></i></a></p>
                <a target="_blank" title="By Gerardo Arceo">Lienzo Urbano &copy; 2017 </a>
            </div>
        </footer>
                        
        <a href="#up" class="gototop "><i class="fa fa-angle-up  fa-3x"></i></a>


        <!-- jquery -->
        <script src="assets/jquery.js"></script>
        <!-- wow script -->
        <script src="assets/wow/wow.min.js"></script>
        <!-- boostrap -->
        <script src="assets/bootstrap/js/bootstrap.js" type="text/javascript" ></script>
        <!-- jquery mobile -->
        <script src="assets/mobile/touchSwipe.min.js"></script>
        <script src="assets/respond/respond.js"></script>
        <!-- gallery -->
        <script src="assets/gallery/jquery.blueimp-gallery.min.js"></script>
        <!-- custom script -->
        <script src="assets/script.js"></script>
    </body>
</html>