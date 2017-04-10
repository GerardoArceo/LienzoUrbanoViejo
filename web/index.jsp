<%@page import="Clases.Usuario"%>
<%@page import="Clases.Funciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Funciones Funcion = new Funciones();
String[] info = Funcion.verInformacion();
Usuario h = new Usuario();
String nombre=null;
String id=null;
String ok = request.getParameter("ok");
if (ok==null) ok="";
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
        <title>LienzoUrbano</title>
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
                            <a class="navbar-brand" href="#home"><img src="images/logo.png" alt="Lienzo Urbano"></a>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="navbar-collapse  collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="index.jsp">Inicio</a></li>
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
        
        <%if(ok.equals("ok")){%>
        <script>
            swal(
                'Sesión Iniciada ☺',
                'Ya estás dentro de Lienzo Urbano!!!',
                'success'
            );
        </script>
        <%}else if(ok.equals("CerrarSesion")){%>
            <script>
                swal(
                    'Sesión Cerrada',
                    '',
                    'info'
                );
            </script>
        <%}else if(ok.equals("registro")){%>
            <script>
                swal(
                    'Éxito',
                    'Usuario registrado correctamente',
                    'success'
                );
            </script>
        <%}%>
        <div class="contenido" id="up">
            <div class="highlight-info">
                <div class="overlay spacer">
                    <div class="container">
                        <div class="row text-center  wowload fadeInDownBig">
                            <div class="col-sm-3 col-xs-6">
                                <h2>Gracias a ti, Lienzo Urbano cuenta con:</h2>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <i class="fa fa-smile-o  fa-5x"></i><h4><%=info[0]%> Usuarios</h4>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <i class="fa fa-rocket  fa-5x"></i><h4><%=info[1]%> Obras de Arte</h4>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <i class="fa fa-map-marker fa-5x"></i><h4>Artistas en <%=info[2]%> Estados diferentes</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="text-center text-primary">
                <h1>Tus sueños son nuestro lienzo...</h1>
            </div>
            <div class=" clearfix grid"> 
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/1.jpg" alt="img01"/>
                    <figcaption>
                        <h2>Nature</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/1.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/2.jpg" alt="img01"/>
                    <figcaption>
                        <h2>Events</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/2.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/3.jpg" alt="img01"/>
                    <figcaption>
                        <h2>music</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/3.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/4.jpg" alt="img01"/>
                    <figcaption>
                        <h2>Vintage</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/4.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/5.jpg" alt="img01"/>
                    <figcaption>
                        <h2>Typers</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/5.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>

                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/6.jpg" alt="img01"/>
                    <figcaption>
                        <h2>hotel</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/6.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/7.jpg" alt="img01"/>
                    <figcaption>
                        <h2>Chinese</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/7.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/9.jpg" alt="img01"/>
                    <figcaption>
                        <h2>Coffee</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/9.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
                <figure class="effect-oscar  wowload fadeInUp">
                    <img src="images/portfolio/11.jpg" alt="img01"/>
                    <figcaption>
                        <h2>design</h2>
                        <p>Lily likes to play with crayons and pencils<br>
                            <a href="images/portfolio/11.jpg" title="1" data-gallery>View more</a></p>            
                    </figcaption>
                </figure>
            </div>
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