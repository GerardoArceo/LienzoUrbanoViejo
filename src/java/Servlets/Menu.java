package Servlets;

import Clases.Funciones;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import Clases.Usuario;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

public class Menu extends HttpServlet
{
    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String opc = request.getParameter("opc");
        HttpSession session = request.getSession();
        Usuario h = ((Usuario) session.getAttribute("user"));
        String idPersona = h.getId();
        String nombre = h.getNombre();
        Funciones Funcion = new Funciones();
        out.println("<!DOCTYPE html>\n" +
"<html lang=\"es\">\n" +
"    <head>\n" +
"        <meta charset=\"UTF-8\" />\n" +
"        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
"        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\n" +
"        <title>Menú | Lienzo Urbano</title>\n" +
"        <!-- Google fonts -->\n" +
"        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>\n" +
"        <!-- font awesome -->\n" +
"        <link href=\"//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n" +
"        <!-- bootstrap -->\n" +
"        <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap.min.css\" />\n" +
"        <!-- animate.css -->\n" +
"        <link rel=\"stylesheet\" href=\"assets/animate/animate.css\" />\n" +
"        <link rel=\"stylesheet\" href=\"assets/animate/set.css\" />\n" +
"        <!-- gallery -->\n" +
"        <link rel=\"stylesheet\" href=\"assets/gallery/blueimp-gallery.min.css\">\n" +
"        <!-- favicon -->\n" +
"        <link rel=\"shortcut icon\" href=\"images/favicon.ico\" type=\"image/x-icon\">\n" +
"        <link rel=\"icon\" href=\"images/favicon.ico\" type=\"image/x-icon\">\n" +
"        <link rel=\"stylesheet\" href=\"assets/style.css\">\n" +
"        <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap.css\" type=\"text/css\"/>\n" +
"\n" +
"        <script src=\"js/validacion.js\" language=\"javascript\" type=\"text/javascript\"></script>\n" +
"        <script src=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.js\"></script>\n" +
"        <script src=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.js\"></script>\n" +
"        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.css\">\n" +
"        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.css\">\n" +
"        <script>\n" +
"            function opcion(opcion){\n" +
"                document.getElementById('opc').value=opcion;\n" +
"                document.formu.submit();\n" +
"            }\n" +
"        </script>\n" +
"    </head>\n" +
"    <body>\n" +
"        <div class=\"topbar animated fadeInLeftBig\"></div>\n" +
"        <div class=\"navbar-wrapper\">\n" +
"            <div class=\"container\">\n" +
"                <div class=\"navbar navbar-default navbar-fixed-top\" role=\"navigation\" id=\"top-nav\">\n" +
"                    <div class=\"container\">\n" +
"                        <div class=\"navbar-header\">\n" +
"                            <a class=\"navbar-brand\" href=\"index.jsp\"><img onclick=\"window.location='index.jsp'\" src=\"images/logo.png\" alt=\"Lienzo Urbano\"></a>\n" +
"                            <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n" +
"                                <span class=\"sr-only\">Toggle navigation</span>\n" +
"                                <span class=\"icon-bar\"></span>\n" +
"                                <span class=\"icon-bar\"></span>\n" +
"                                <span class=\"icon-bar\"></span>\n" +
"                            </button>\n" +
"                        </div>\n" +
"\n" +
"                        <div class=\"navbar-collapse  collapse\">\n" +
"                            <ul class=\"nav navbar-nav navbar-right\">\n" +
"                                <li ><a href=\"index.jsp\">Inicio</a></li>\n" +
"                                <li ><a href=\"top.jsp\">Top</a></li>\n" +
"                                <li ><a href=\"lienzoUrbano.jsp\">¿Lienzo Urbano?</a></li>\n" +
"                                <li ><a href=\"patrocinadores.jsp\">Patrocinadores</a></li>\n" +
"                                <li class=\"active\"><a href=\"menu.jsp\">Menú</a></li>\n" +
"                                    <li>\n" +
"                                        <form action=\"Menu\" method=\"post\" name=\"red\"><input type=\"hidden\" name=\"opc\" value=\"1\"></form>\n" +
"                                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Hola "+nombre+"<i class=\"fa fa-angle-down\"></i></a>\n" +
"                                        <ul class=\"dropdown-menu\">\n" +
"                                           <li><a onclick=\"Redirigir();\">Ver mis datos</a></li>\n" +
"                                           <li><a href=\"CerrarSesion\">Cerrar Sesión</a></li>\n" +
"                                        </ul>\n" +
"                                    </li>\n" +
"                            </ul>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>"+
"       <div class=\"contenido\"><br><br><br><br>");
        
        switch(opc){
            case "1":{
                String aPaterno = h.getPaterno();
                String aMaterno = h.getMaterno();
                out.println("<div class=\"container text-center\">");
                out.println("<h1>Datos</h1><table>");
                out.println("<tr><th>Nombre</th><td>" + nombre + "</td></tr>");
                out.println("<tr><th>Apellido Paterno</th><td>" + aPaterno + "</td></tr>");
                out.println("<tr><th>Apellido Materno</th><td>" + aMaterno + "</td></tr>");
                out.println("<tr><th>Fotografía</th><td><img src=\"F?idPersona=" + idPersona + "\" width=\"87\" height=\"105\"></td></tr>");
                out.println("</table>");
                out.println("</div>");
                break;
            }
            case "2":{
                out.println("<form action=\"Registro\" method=\"POST\" name=\"formu\" enctype=\"multipart/form-data\">\n" +
"                    <div class=\"container\">\n" +
"                        <label>Nombre de la obra:</label>\n" +
"                        <input type=\"text\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"nombreArte\" placeholder=\"Nombre de la obra\" size=\"30\">\n" +
"                        <br>\n" +
"                        <table><tr><th>Fotografía</th></tr><tr><td><input type=\"file\" name=\"foto\"/></td></tr></table>\n" +
"                        <br>"+
"                        <label>Costo aproximado</label>\n"
                        + "<a onclick=\"swal('Costo Aproximado','En este costo incluye el precio de los materiales que necesitarías para pintarlo en una pared. <br>Pon el costo en la moneda de tu país. (Ejemplo: México-Pesos)<br> No pongas el precio con centavos, solo es un aproximado.','info');\"><i class=\"fa fa-info-circle\"></i></a>" +
"                        <br><input type=\"number\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"costo\" placeholder=\"Costo aprox.\" size=\"30\">\n" +
"                        <br>\n" +
"                        <label>Tiempo aproximado de pintado</label>\n"
                        + "<a onclick=\"swal('Costo Aproximado','En este costo incluye el precio de los materiales que necesitarías para pintarlo en una pared. <br>Pon el costo en la moneda de tu país. (Ejemplo: México-Pesos)<br> No pongas el precio con centavos, solo es un aproximado.','info');\"><i class=\"fa fa-info-circle\"></i></a>" +
"                        <br><input type=\"number\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"costo\" placeholder=\"Costo aprox.\" size=\"30\">\n" +
"                        <label>Usuario</label>\n" +
"                        <input type=\"text\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"usuario\" placeholder=\"Usuario\" size=\"20\">\n" +
"                        <br>\n" +
"                        <label>Contraseña</label>\n" +
"                        <input type=\"password\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"pass\" placeholder=\"Contraseña\" size=\"20\">\n" +
"                        <br>\n" +
"                        <div class=\"text-center container active\"><br> </div>\n" +
"                        <button type=\"button\" class=\"btn btn-primary btn-lg\" onclick=\"validacionRU();\" style=\"background-color: #DC143C\">Registrarme</button>\n" +
"                    </div>\n" +
"                    <br><br><br><br>\n" +
"                </form>");
                break;
            }
            case "2.1":{
                
                break;
            }
            case "3":{
                
                break;
            }
            case "4":{
                
                break;
            }
            default:{
                response.sendRedirect("error.jsp");
                break;
            }
        }
        
        out.println(
         "</div>"+
"        <footer>\n" +
"            <div class=\"footer text-center spacer\">\n" +
"                <p class=\"wowload flipInX\"><a href=\"https://www.facebook.com/Lienzo-Urbano-399847683716963/\"><i class=\"fa fa-facebook fa-3x\"></i></a>\n" +
"                    <a href=\"https://www.youtube.com/channel/UCZRcqMrsukGeSX9XMEF-oyQ\"><i class=\"fa fa-youtube fa-3x\"></i></a></p>\n" +
"                <a target=\"_blank\" title=\"By Gerardo Arceo\">Lienzo Urbano &copy; 2017 </a>\n" +
"            </div>\n" +
"        </footer>\n" +
"                        \n" +
"        <a href=\"#up\" class=\"gototop \"><i class=\"fa fa-angle-up  fa-3x\"></i></a>\n" +
"\n" +
"\n" +
"        <!-- jquery -->\n" +
"        <script src=\"assets/jquery.js\"></script>\n" +
"        <!-- wow script -->\n" +
"        <script src=\"assets/wow/wow.min.js\"></script>\n" +
"        <!-- boostrap -->\n" +
"        <script src=\"assets/bootstrap/js/bootstrap.js\" type=\"text/javascript\" ></script>\n" +
"        <!-- jquery mobile -->\n" +
"        <script src=\"assets/mobile/touchSwipe.min.js\"></script>\n" +
"        <script src=\"assets/respond/respond.js\"></script>\n" +
"        <!-- gallery -->\n" +
"        <script src=\"assets/gallery/jquery.blueimp-gallery.min.js\"></script>\n" +
"        <!-- custom script -->\n" +
"        <script src=\"assets/script.js\"></script>\n" +
"    </body>\n" +
"</html>");
    }
}