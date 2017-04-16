<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Funciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Funciones Funcion = new Funciones();
    Usuario h = new Usuario();
    String nombre = null;
    String id = null;
    String error = null;
    error = request.getParameter("error");
    if (error == null) {
        error = "";
    }
    String ok = request.getParameter("ok");
    if (ok == null) {
        ok = "";
    }
    try {
        h = ((Usuario) session.getAttribute("user"));
        nombre = h.getNombre();
        id = h.getId();
    } catch (Exception e) {
        e.printStackTrace();
    }
    ArrayList<String> arte = Funcion.verArteTop();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Categoría</title>

        <script src="js/validacion.js" language="javascript" type="text/javascript"></script>
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/animate/animate.css" />
        <link rel="stylesheet" href="assets/animate/set.css" />
        <link rel="stylesheet" href="assets/gallery/blueimp-gallery.min.css">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="assets/style.css">

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
                            <a class="navbar-brand" href="index.jsp"><img onclick="window.location = 'index.jsp'" src="images/logo.png" alt="Lienzo Urbano"></a>
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
                                    <%if (nombre == null) {%>
                                <li ><a href="inicioSesion.jsp">Ingresar</a></li>
                                    <%} else {%>
                                <li class="active"><a href="menu.jsp">Menú</a></li>
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

        <form method="post" action="arte.jsp" name="formu">
            <input type="hidden" name="idArte" id="idArte" value="1">
        </form>

        <div class="contenido text-center">
            <br><br><br><h1>TOP 10</h1><h3>En esta sección podrás ver las obras de arte que más le han gustado a la comunidad de Lienzo Urbano</h3><br>
            <div class="papaCatalogo">
                <div class="clearfix grid" >
                    <%
                        int x = 0;
                        for (int i = 0; i < arte.size(); i = i + 7) {
                            String[] likes = Funcion.verLikes(arte.get(i));
                            x = x + 1;%>
                    <div class="catalogo">
                        <figure class="effect-oscar  wowload fadeInUp" style="width:100%;">
                            <img src="F?idArte=<%=arte.get(i)%>" style="width:100%;">
                            <figcaption style="width:100%;">
                                <h2><%=x%>º</h2>
                                <p>
                                    <a onclick="document.getElementById('idArte').value = <%=arte.get(i)%>; document.formu.submit();">Ver Ficha<br>
                                        <i class="fa fa-thumbs-up"></i> <%=likes[0]%> <i class="fa fa-thumbs-up"></i><br>
                                        <i class="fa fa-thumbs-down"></i> <%=likes[1]%> <i class="fa fa-thumbs-down"></i>
                                    </a>
                                </p>
                            </figcaption>
                        </figure>
                    </div>
                    <%}%>
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