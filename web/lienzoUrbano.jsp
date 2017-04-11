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
        <title>Lienzo Urbano</title>
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
        <script type="text/javascript">
            function mostrar(num){
                document.getElementById('oculto'+num).style.display = 'block';
                document.getElementById('mostrado'+num).style.display='none';
            }
            function ocultar(num){
                document.getElementById('mostrado'+num).style.display = 'block';
                document.getElementById('oculto'+num).style.display='none';
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
                                <li class="active"><a href="lienzoUrbano.jsp">¿Lienzo Urbano?</a></li>
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
        
        <div class="contenido" id="up">
            <div class="text-center container">
                <br><br><br><br>
                <div id="mostrado1">
                    <p class="lead" onclick="mostrar(1)"><a><strong>¿Qué es Lienzo Urbano? <i class="fa fa-arrow-down"></i></strong></a></p>
                </div>
                <div id="oculto1" style="display:none;">
                    <p onclick="ocultar(1)"><a>¿Qué es Lienzo Urbano? <i class="fa fa-arrow-up"></i></a></p>
                    <p class="lead">
                        Es un proyecto altruista, desarrollado con la finalidad de fomentar e impulsar el talento artístico de las personas.
                    </p>
                    <p onclick="ocultar(1)"><a>Ver menos <i class="fa fa-arrow-up"></i></a></p>
                </div>
                <br><br><br>
                <div id="mostrado2">
                    <p class="lead" onclick="mostrar(2)"><a><strong>¿Cuál es la problemática? <i class="fa fa-arrow-down"></i></strong></a></p>
                </div>
                <div id="oculto2" style="display:none;">
                    <p onclick="ocultar(2)"><a>¿Cuál es la problemática? <i class="fa fa-arrow-up"></i></a></p>
                    <p class="lead">
                        Existen muchas personas con talentos artísticos desperdiciados, sobre todo cuando viven en una ciudad vandalizada que está tan necesitada del arte.
                    </p>
                    <p onclick="ocultar(2)"><a>Ver menos <i class="fa fa-arrow-up"></i></a></p>
                </div>
                <br><br><br>
                <div id="mostrado3">
                    <p class="lead" onclick="mostrar(3)"><a><strong>¿Cómo funciona Lienzo Urbano? <i class="fa fa-arrow-down"></i></strong></a></p>
                </div>
                <div id="oculto3" style="display:none;">
                    <p onclick="ocultar(3)"><a>¿Cómo funciona Lienzo Urbano? <i class="fa fa-arrow-up"></i></a></p>
                    <p class="lead">
                    1. Los artistas urbanos crean bocetos de su arte en papel o en algún otro medio. 
                    <br><br>
                    2. Los artistas le toman una foto a su arte y la suben a la plataforma junto con una pequeña descripción. 
                    <br><br>
                    3. Cualquier persona puede explorar el gran catálogo de arte de Lienzo Urbano, comentar el arte, seleccionar sus obras favoritas o simplemente votar por las mejores obras. 
                    <br><br>
                    4. Si a una persona le interesa plasmar en su propiedad la obra de algún artista, pueden ponerse en contacto para acordar cómo, cuándo y dónde se perpetuará el arte. 
                    </p>
                    <p onclick="ocultar(3)"><a>Ver menos <i class="fa fa-arrow-up"></i></a></p>
                </div>
                <br><hr><br>
                <h2>¿Quiénes se benefician con Lienzo Urbano? </h2>
                <br>
                <div id="mostrado4">
                    <p class="lead" onclick="mostrar(4)"><a><strong>Las Personas <i class="fa fa-arrow-down"></i></strong></a></p>
                </div>
                <div id="oculto4" style="display:none;">
                    <p onclick="ocultar(4)"><a>Las Personas <i class="fa fa-arrow-up"></i></a></p>
                    <p class="lead">
                    ¿Tu propiedad está vandalizada, fea, o simplemente quieres que se vea diferente a las demás? 
                    <br>
                    Con LU tienes la oportunidad de tener fácilmente una obra de arte en la pared de tu casa por un precio muy razonable (mínimo, el precio de la pintura, lo demás queda a consideración del artista) al mismo tiempo que fomentas el arte y la cultura en tu ciudad. 
                    </p>
                    <p onclick="ocultar(4)"><a>Ver menos <i class="fa fa-arrow-up"></i></a></p>
                </div>
                <br><br><br>
                <div id="mostrado5">
                    <p class="lead" onclick="mostrar(5)"><a><strong>Los Artistas <i class="fa fa-arrow-down"></i></strong></a></p>
                </div>
                <div id="oculto5" style="display:none;">
                    <p onclick="ocultar(5)"><a>Los Artistas <i class="fa fa-arrow-up"></i></a></p>
                    <p class="lead">
                        ¿Te gusta expresarte con el arte urbano pero es difícil conseguir un lienzo?
                        <br>
                        ¿Te gustaría utilizar tu talento para algo productivo y poder plasmar tu arte por toda la ciudad mientras ganas un poco de dinero y te das a conocer por tu talento?
                        <br>
                        Con LU las personas interesadas en tu arte se podrán poner en contacto contigo, te proporcionarán el lienzo y los recursos necesarios para que puedas expresar tus ideas. 
                    </p>
                    <p onclick="ocultar(5)"><a>Ver menos <i class="fa fa-arrow-up"></i></a></p>
                </div>
                <br><br><br>
                <div id="mostrado6">
                    <p class="lead" onclick="mostrar(6)"><a><strong>La Ciudad <i class="fa fa-arrow-down"></i></strong></a></p>
                </div>
                <div id="oculto6" style="display:none;">
                    <p onclick="ocultar(6)"><a>La Ciudad <i class="fa fa-arrow-up"></i></a></p>
                    <p class="lead">
                    Actualmente, muchas personas tratan de desahogarse de sus problemas vandalizando la propiedad de otras personas, dándole un mal aspecto e impresión a la ciudad. 
                    <br>
                    Por otro lado, si la ciudad estuviera repleta de arte y cultura, atraería a más turismo y fomentaría a que las personas que se dedican a vandalizar, redirijan su energía a actividades culturales y artísticas.
                    <br>
                    Está comprobado que una pared con algún tipo de arte representada, se mantiene más tiempo sin ser vandalizada que una pared normal, esto sucede por el respeto que la mayoría de las personas tienen hacia algo con atractivo visual. 
                    </p>
                    <p onclick="ocultar(6)"><a>Ver menos <i class="fa fa-arrow-up"></i></a></p>
                </div>

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