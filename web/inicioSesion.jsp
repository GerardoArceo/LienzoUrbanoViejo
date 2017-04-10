<%@page import="Clases.Usuario"%>
<%@page import="Clases.Funciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Funciones Funcion = new Funciones();
Usuario h = new Usuario();
String nombre=null;
String id=null;
String error=null;
error = request.getParameter("error");
if(error==null)error="";
try {
    h = ((Usuario) session.getAttribute("user"));
    nombre = h.getNombre();
    id= h.getId();
} catch (Exception e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Iniciar Sesión</title>
        <!-- Google fonts -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
        <!-- font awesome -->
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
        <!-- animate.css -->
        <link rel="stylesheet" href="assets/animate/animate.css" />
        <link rel="stylesheet" href="assets/animate/set.css" />
        <!-- gallery -->
        <link rel="stylesheet" href="assets/gallery/blueimp-gallery.min.css">
        <!-- favicon -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="assets/style.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css"/>

        <script src="js/validacion.js" language="javascript" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.css">
        
    </head>
    <body>
        <div class="topbar animated fadeInLeftBig"></div>
        <div class="navbar-wrapper">
            <div class="container">
                <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="top-nav">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="_blank"><img src="images/logo.png" alt="Lienzo Urbano" onclick="window.location='index.jsp'"></a>
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
                                    <li class="active"><a href="inicioSesion.jsp">Ingresar</a></li>
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
        
        <%if(error.equals("error")){%>
        <script>
            swal(
                'Error',
                'Usuario y/o Contraseña incorrectos',
                'error'
            );
        </script>
        <%}%>
        
        <div class="contenido" id="up">
            
        <%if(nombre==null){%>
            
        <div class="container text-center">
            <br><br><br><br>
            <h2>Inicio de Sesión</h2><br>
            <p class="lead">Para poder comentar, puntuar, compartir tu arte y ponerte en contacto con más artistas, inicia sesión <i class="fa fa-smile-o"></i></p><br><br>
            <form action="InicioSesion" method="POST" name="formu">
                <label>Usuario</label>
                <input type="text" class="form-control" style="background-color: #FFE4E1;" name="usuario" placeholder="Usuario" size="20">
                <br><br><br><br>
                <label>Contraseña</label>
                <input type="password" class="form-control" style="background-color: #FFE4E1;" name="pass" placeholder="Contraseña" size="20">
                <br><br><br><br>
                <button type="button" class="btn btn-primary btn-lg" onclick="validacionIS()" style="background-color: #DC143C">Iniciar Sesión</button>
            </form>
            <br><br><br><hr><br><br><br>
            <div class="bg-info">
                <h3>¿No tienes cuenta?</h3><br>
                <strong><a class="btn btn-primary btn-lg" title="Registro" href="registro.jsp">Regístrate</a></strong>   
            </div>
            <br>
        </div>
            
        <%}else{%>
            <br><br><br><br>
            <h2>Error</h2><br>
            <h3>Para iniciar una nueva sesión primero cierra la que ya tienes iniciada</h3>

        <%}%>
        </div> 
        
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