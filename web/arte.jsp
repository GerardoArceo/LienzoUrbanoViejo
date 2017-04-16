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
    String idArte = request.getParameter("idArte");
    String[] arte = Funcion.verArte(idArte);
    String[] persona = Funcion.verDatosId(arte[8]);
    String[] likes = Funcion.verLikes(idArte);
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Arte</title>
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
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script language="javascript" type="text/javascript">
            function cambiarLike(likes){
              document.getElementById('Jlike').innerHTML = "<h1><i class=\"fa fa-thumbs-o-up\"></i><br>"+likes+"</h1>";
            }
            function cambiarDislike(dislikes){
              document.getElementById('Jdislike').innerHTML = "<h1><i class=\"fa fa-thumbs-o-down\"></i><br>"+dislikes+"</h1>";
            }
        </script>
        <script>
            $(document).ready(function() {
                $('#like').click(function(event) {
                    var _idPersona = $('#idPersona').val();
                    var _idArte = $('#idArte').val();
                    // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
                    $.post('ActionServlet', {
                        idPersona : _idPersona,
                        idArte : _idArte,
                        peticion : 'like'
                    }, function(responseText) {
                        $('#Jlike').html(responseText);
                    });
                });
            });
            $(document).ready(function() {
                $('#dislike').click(function(event) {
                    var _idPersona = $('#idPersona').val();
                    var _idArte = $('#idArte').val();
                    // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
                    $.post('ActionServlet', {
                        idPersona : _idPersona,
                        idArte : _idArte,
                        peticion : 'dislike'
                    }, function(responseText) {
                        $('#Jdislike').html(responseText);
                    });
                });
            });
            $(document).ready(function() {
                $('#fav').click(function(event) {
                    var _idPersona = $('#idPersona').val();
                    var _idArte = $('#idArte').val();
                    // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
                    $.post('ActionServlet', {
                        idPersona : _idPersona,
                        idArte : _idArte,
                        peticion : 'fav'
                    }, function(responseText) {
                        $('#Jfav').html(responseText);
                    });
                });
            });
        </script>

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

        <br><br><br>
        <div class="contenido text-center container">
            <table>
                <tr>
                    <th colspan="3">
                        <%=arte[1]%>
                    </th>
                    <th colspan="2">
                        <%=persona[0]%> <%=persona[1]%> <%=persona[2]%>
                    </th>
                </tr>
                <tr>
                    <td style="width:70%;" rowspan="5" colspan="3">
                        <img src="F?idArte=<%=arte[0]%>" style="width:100%;" alt="">
                    </td>
                    <td style="width:30%;" colspan="2">
                        <img src="F?idPersona=<%=arte[8]%>" style="width:100%;" alt="">
                    </td>
                </tr>
                <tr>
                    <th>País</th><th>Estado</th>
                </tr>
                <tr>
                    <td><%=persona[9]%></td><td><%=persona[7]%></td>
                </tr>
                <tr>
                    <th colspan="2">Contacto</th>
                </tr>
                <tr>
                    <td colspan="2"><%=persona[5]%></td>
                </tr>
                <tr>
                    <th colspan="3">Descripción</th>
                </tr>
                <tr>
                    <td colspan="3"><%=arte[5]%></td>
                </tr>
                <tr>
                    <th>Costo (MN)</th>
                    <th>Categoría</th>
                    <th>Tiempo (Horas)</th>
                </tr>
                <tr>
                    <td><%=arte[2]%></td>
                    <td><%=arte[6]%></td>
                    <td><%=arte[3]%></td>
                </tr>
            </table>

            <br><br>

            <table>
                <tr>
                    <td id="like">
                        <div id="Jlike">
                            <h1>
                                <%if(Funcion.existeLike(idArte, id) == true){%>
                                    <i class="fa fa-thumbs-up"></i>
                                <%}else{%>
                                    <i class="fa fa-thumbs-o-up"></i>
                                <%}%>
                            <br><%=likes[0]%>
                            </h1>
                        </div>
                    </td>
                    <td id="fav">
                        <div id="Jfav">
                            <h1>
                                <%if(Funcion.existeFav(idArte, id) == true){%>
                                    <i class="fa fa-star"></i>
                                <%}else{%>
                                    <i class="fa fa-star-o"></i>
                                <%}%>
                            </h1>
                        </div>
                    </td>
                    <td id="dislike">
                        <div id="Jdislike">
                            <h1>
                                <%if(Funcion.existeDislike(idArte, id) == true){%>
                                    <i class="fa fa-thumbs-down"></i>
                                <%}else{%>
                                    <i class="fa fa-thumbs-o-down"></i>
                                <%}%>
                            <br><%=likes[1]%>
                            </h1>
                        </div>
                    </td>
                </tr>
            </table>

            <form>
                <input type="hidden" id="idPersona" value="<%=id%>"/>
                <input type="hidden" id="idArte" value="<%=idArte%>"/>
            </form>
            
            <br><br>

            <form action="categoria.jsp" method="post">
                <input type="hidden" name="idCategoria" value="<%=arte[7]%>">
                <button class="btn btn-primary btn-lg" onclick="submit();">Ver Categoría</button>
            </form>

            <br><br>

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