package Servlets;

import Clases.Funciones;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import Clases.Usuario;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Part;

public class Menu extends HttpServlet {

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
        out.println("<!DOCTYPE html>\n"
                + "<html lang=\"es\">\n"
                + "    <head>\n"
                + "        <meta charset=\"UTF-8\" />\n"
                + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\n"
                + "        <title>Menú | Lienzo Urbano</title>\n"
                + "        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>\n"
                + "        <link href=\"//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n"
                + "        <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap.min.css\" />\n"
                + "        <link rel=\"stylesheet\" href=\"assets/animate/animate.css\" />\n"
                + "        <link rel=\"stylesheet\" href=\"assets/animate/set.css\" />\n"
                + "        <link rel=\"stylesheet\" href=\"assets/gallery/blueimp-gallery.min.css\">\n"
                + "        <link rel=\"shortcut icon\" href=\"images/favicon.ico\" type=\"image/x-icon\">\n"
                + "        <link rel=\"icon\" href=\"images/favicon.ico\" type=\"image/x-icon\">\n"
                + "        <link rel=\"stylesheet\" href=\"assets/style.css\">"
                + "        <script src=\"js/validacion.js\" language=\"javascript\" type=\"text/javascript\"></script>\n"
                + "        <script src=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.js\"></script>\n"
                + "        <script src=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.js\"></script>\n"
                + "        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.min.css\">\n"
                + "        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/sweetalert2/5.3.2/sweetalert2.css\">\n"
                + "        <script>\n"
                + "            function opcion(opcion){\n"
                + "                document.getElementById('opc').value=opcion;\n"
                + "                document.formu.submit();\n"
                + "            }\n"
                + "        </script>\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <div class=\"topbar animated fadeInLeftBig\"></div>\n"
                + "        <div class=\"navbar-wrapper\">\n"
                + "            <div class=\"container\">\n"
                + "                <div class=\"navbar navbar-default navbar-fixed-top\" role=\"navigation\" id=\"top-nav\">\n"
                + "                    <div class=\"container\">\n"
                + "                        <div class=\"navbar-header\">\n"
                + "                            <a class=\"navbar-brand\" href=\"index.jsp\"><img onclick=\"window.location='index.jsp'\" src=\"images/logo.png\" alt=\"Lienzo Urbano\"></a>\n"
                + "                            <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n"
                + "                                <span class=\"sr-only\">Toggle navigation</span>\n"
                + "                                <span class=\"icon-bar\"></span>\n"
                + "                                <span class=\"icon-bar\"></span>\n"
                + "                                <span class=\"icon-bar\"></span>\n"
                + "                            </button>\n"
                + "                        </div>\n"
                + "\n"
                + "                        <div class=\"navbar-collapse  collapse\">\n"
                + "                            <ul class=\"nav navbar-nav navbar-right\">\n"
                + "                                <li ><a href=\"index.jsp\">Inicio</a></li>\n"
                + "                                <li ><a href=\"top.jsp\">Top</a></li>\n"
                + "                                <li ><a href=\"lienzoUrbano.jsp\">¿Lienzo Urbano?</a></li>\n"
                + "                                <li ><a href=\"patrocinadores.jsp\">Patrocinadores</a></li>\n"
                + "                                <li class=\"active\"><a href=\"menu.jsp\">Menú</a></li>\n"
                + "                                    <li>\n"
                + "                                        <form action=\"Menu\" method=\"post\" name=\"red\"><input type=\"hidden\" name=\"opc\" value=\"1\"></form>\n"
                + "                                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Hola " + nombre + "<i class=\"fa fa-angle-down\"></i></a>\n"
                + "                                        <ul class=\"dropdown-menu\">\n"
                + "                                           <li><a onclick=\"Redirigir();\">Ver mis datos</a></li>\n"
                + "                                           <li><a href=\"CerrarSesion\">Cerrar Sesión</a></li>\n"
                + "                                        </ul>\n"
                + "                                    </li>\n"
                + "                            </ul>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "            </div>\n"
                + "        </div>"
                + "       <div class=\"contenido\"><br><br><br><br>");

        switch (opc) {
            case "1": {
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
            case "2": {
                out.println("<div class=\"container text-center\"><form action=\"Menu\" method=\"POST\" name=\"formu\" enctype=\"multipart/form-data\">\n"
                        + "                        <label>Nombre de la obra</label>\n"
                        + "                        <input type=\"text\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"nombreArte\" placeholder=\"Nombre de la obra\">\n"
                        + "                        <br>\n"
                        + "                        <table><tr><th>Fotografía"
                        + "<a onclick=\"swal('Fotografía','Tómale una foto a un boceto que hayas hecho de tu arte<br>Inluso puedes tomarle fotos a obras que ya has realizado en algún lugar de la ciudad<br>Recuerda que entre mejor se vea la foto es más probable que a las personas les atraiga y te contacten.','info');\"><i class=\"fa fa-info-circle\"></i></a>"
                        + "</th></tr><tr><td><input type=\"file\" name=\"foto\" accept=\"image/*\" onchange=\"loadFile(event)\"/></td></tr><tr><td><img style=\"width: 100%\" id=\"img\"/></td></tr></table>\n"
                        + "<script>\n"
                        + "                        var loadFile = function(event) {\n"
                        + "                            var output = document.getElementById('img');\n"
                        + "                            output.src = URL.createObjectURL(event.target.files[0]);\n"
                        + "                        };\n"
                        + "                        </script>"
                        + "                        <br>"
                        + "                        <table><tr>"
                        + "<th style=\"width: 50%\">Costo aproximado"
                        + "<a onclick=\"swal('Costo Aproximado','En este costo incluye el precio de los materiales que necesitarías para pintarlo en una pared. <br>Pon el costo en la moneda de tu país. (Ejemplo: México-Pesos)<br> No pongas el precio con centavos, solo es un aproximado.','info');\"><i class=\"fa fa-info-circle\"></i></a>"
                        + "                        </th>"
                        + "<th style=\"width: 50%\">Tiempo aproximado de pintado"
                        + "<a onclick=\"swal('Tiempo Aproximado','Tiempo aproximado expresado en horas que te tomaría realizar tu obra de arte en una pared.','info');\"><i class=\"fa fa-info-circle\"></i></a>"
                        + "                       </th></tr>"
                        + "<tr><td><input type=\"number\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"costo\" placeholder=\"Costo aprox.\"></td>"
                        + "                        <td><input type=\"number\" class=\"form-control\" style=\"background-color: #FFE4E1;\" name=\"tiempo\" placeholder=\"Horas aprox.\"></td>"
                        + "                        </tr><tr><th colspan=\"2\">Descripción"
                        + "<a onclick=\"swal('Descripción','Pequeña descripción acerca de tu obra de arte, tu inspiración, lo que representa, el estilo y técnica utilizados, etc.','info');\"><i class=\"fa fa-info-circle\"></i></a>"
                        + "</th></tr><tr><td colspan=\"2\"><textarea id=\"descripcion\" name=\"descripcion\" rows=\"5\" cols=\"80\"></textarea></td></tr>"
                        + "                        </table><br><label>Categoría"
                        + "<a onclick=\"swal('Categoría','Selecciona la categoría a la que pertenece tu arte, si crees que encaja en más de 1 categoría, solo selecciona la que más representativa.','info');\"><i class=\"fa fa-info-circle\"></i></a>"
                        + "</label><br><select name=\"idCategoria\">");
                ArrayList<String> categorias = null;
                try {
                    categorias = Funcion.verCategorias();
                } catch (SQLException ex) {
                    Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                }
                for (int i = 0; i < categorias.size(); i = i + 2) {
                    out.println("<option value=\"" + categorias.get(i) + "\">" + categorias.get(i + 1) + "</option>");
                }
                out.println("</select><br><br>"
                        + "                        <button type=\"button\" class=\"btn btn-primary btn-lg\" onclick=\"validacionNA();\" style=\"background-color: #DC143C\">Agregar</button>\n"
                        + "                    <input type=\"hidden\" name=\"opc\" id=\"opc\" value=\"2.1\"><br><br><br><br>\n"
                        + "                </form></div>");
                break;
            }
            case "2.1": {
                String nombreArte = request.getParameter("nombreArte");
                String costo = request.getParameter("costo");
                String tiempo = request.getParameter("tiempo");
                String descripcion = request.getParameter("descripcion");
                String idCategoria = request.getParameter("idCategoria");

                final Part foto = request.getPart("foto");
                final String tipo = foto.getContentType();
                final long size = foto.getSize();
                final InputStream f = foto.getInputStream();

                try {
                    Funcion.agregarArte(nombreArte, f, costo, tiempo, descripcion, idCategoria, idPersona);
                    out.println("<form action=\"menu.jsp\" method=\"POST\" name=\"red\" id=\"red\">\n"
                            + "                     <input type=\"hidden\" name=\"ok\" value=\"ok\">"
                            + "                 </form><script>Redirigir();</script>");
                } catch (SQLException ex) {
                    Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                    out.println("<form action=\"menu.jsp\" method=\"POST\" name=\"red\" id=\"red\">\n"
                            + "                     <input type=\"hidden\" name=\"ok\" value=\"error\">"
                            + "                 </form><script>Redirigir();</script>");
                }
                break;
            }
            case "3": {
ArrayList<String> arte = null;
                try {
                    arte = Funcion.verArtePersona(idPersona);
                } catch (SQLException ex) {
                    Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                }
                out.println("<div class=\"contenido text-center\"><h1>Arte Favorita</h1><h3>En esta sección podrás ver todas las obras de arte que has marcado como tus favoritas</h3><br>");
                out.println("<form method=\"post\" action=\"arte.jsp\" name=\"formu\">\n"
                        + "            <input type=\"hidden\" name=\"idArte\" id=\"idArte\" value=\"1\">\n"
                        + "        </form>");
                if (arte != null) {
                    out.println("<br><br><br><br>"
                            + "            <div class=\"papaCatalogo\">\n"
                            + "                <div class=\"clearfix grid\" >");

                    for (int i = 0; i < arte.size(); i = i + 7) {
                        String[] likes = null;
                        try {
                            likes = Funcion.verLikes(arte.get(i));
                        } catch (SQLException ex) {
                            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        out.println("<div class=\"catalogo\">\n"
                                + "                        <figure class=\"effect-oscar  wowload fadeInUp\" style=\"width:100%;\">\n"
                                + "                            <img src=\"F?idArte=" + arte.get(i) + "\" width=\"100%\">\n"
                                + "                            <figcaption style=\"width:100%;\">\n"
                                + "                                <p>\n"
                                + "                                    <a onclick=\"document.getElementById('idArte').value = " + arte.get(i) + "; document.formu.submit();\">Ver Ficha<br>\n"
                                + "                                        <i class=\"fa fa-thumbs-up\"></i> " + likes[0] + " <i class=\"fa fa-thumbs-up\"></i><br>\n"
                                + "                                        <i class=\"fa fa-thumbs-down\"></i> " + likes[1] + " <i class=\"fa fa-thumbs-down\"></i>\n"
                                + "                                    </a>\n"
                                + "                                </p>\n"
                                + "                            </figcaption>\n"
                                + "                        </figure>\n"
                                + "                    </div>");
                    }
                    out.println("</div>\n"
                            + "            </div>\n"
                            + "        </div>");
                }else{
                    out.println("<h1>Aún no has agregado ninguna obra a tus favoritos...</h1></div>");
                }
                    
                break;
            }
            case "4": {
                ArrayList<String> arte = null;
                try {
                    arte = Funcion.verArtePersona(idPersona);
                } catch (SQLException ex) {
                    Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                }
                out.println("<div class=\"contenido text-center\"><h1>Arte de " + nombre + "</h1><h3>En esta sección podrás ver todas las obras de arte que has compartido con la comunidad de Lienzo Urbano</h3><br>");
                out.println("<form method=\"post\" action=\"arte.jsp\" name=\"formu\">\n"
                        + "            <input type=\"hidden\" name=\"idArte\" id=\"idArte\" value=\"1\">\n"
                        + "        </form>");
                if (arte != null) {
                    out.println("<br><br><br><br>"
                            + "            <div class=\"papaCatalogo\">\n"
                            + "                <div class=\"clearfix grid\" >");

                    for (int i = 0; i < arte.size(); i = i + 7) {
                        String[] likes = null;
                        try {
                            likes = Funcion.verLikes(arte.get(i));
                        } catch (SQLException ex) {
                            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        out.println("<div class=\"catalogo\">\n"
                                + "                        <figure class=\"effect-oscar  wowload fadeInUp\" style=\"width:100%;\">\n"
                                + "                            <img src=\"F?idArte=" + arte.get(i) + "\" width=\"100%\">\n"
                                + "                            <figcaption style=\"width:100%;\">\n"
                                + "                                <p>\n"
                                + "                                    <a onclick=\"document.getElementById('idArte').value = " + arte.get(i) + "; document.formu.submit();\">Ver Ficha<br>\n"
                                + "                                        <i class=\"fa fa-thumbs-up\"></i> " + likes[0] + " <i class=\"fa fa-thumbs-up\"></i><br>\n"
                                + "                                        <i class=\"fa fa-thumbs-down\"></i> " + likes[1] + " <i class=\"fa fa-thumbs-down\"></i>\n"
                                + "                                    </a>\n"
                                + "                                </p>\n"
                                + "                            </figcaption>\n"
                                + "                        </figure>\n"
                                + "                    </div>");
                    }
                    out.println("</div>\n"
                            + "            </div>\n"
                            + "        </div>");
                }else{
                    out.println("<h1>Aún no has compartido tu arte con la comunidad de Lienzo Urbano...</h1></div>");
                }
                    
                break;
            }
            default: {
                response.sendRedirect("error.jsp");
                break;
            }
        }

        out.println(
                "</div>"
                + "        <footer>\n"
                + "            <div class=\"footer text-center spacer\">\n"
                + "                <p class=\"wowload flipInX\"><a href=\"https://www.facebook.com/Lienzo-Urbano-399847683716963/\"><i class=\"fa fa-facebook fa-3x\"></i></a>\n"
                + "                    <a href=\"https://www.youtube.com/channel/UCZRcqMrsukGeSX9XMEF-oyQ\"><i class=\"fa fa-youtube fa-3x\"></i></a></p>\n"
                + "                <a target=\"_blank\" title=\"By Gerardo Arceo\">Lienzo Urbano &copy; 2017 </a>\n"
                + "            </div>\n"
                + "        </footer>\n"
                + "                        \n"
                + "        <a href=\"#up\" class=\"gototop \"><i class=\"fa fa-angle-up  fa-3x\"></i></a>\n"
                + "\n"
                + "\n"
                + "        <!-- jquery -->\n"
                + "        <script src=\"assets/jquery.js\"></script>\n"
                + "        <!-- wow script -->\n"
                + "        <script src=\"assets/wow/wow.min.js\"></script>\n"
                + "        <!-- boostrap -->\n"
                + "        <script src=\"assets/bootstrap/js/bootstrap.js\" type=\"text/javascript\" ></script>\n"
                + "        <!-- jquery mobile -->\n"
                + "        <script src=\"assets/mobile/touchSwipe.min.js\"></script>\n"
                + "        <script src=\"assets/respond/respond.js\"></script>\n"
                + "        <!-- gallery -->\n"
                + "        <script src=\"assets/gallery/jquery.blueimp-gallery.min.js\"></script>\n"
                + "        <!-- custom script -->\n"
                + "        <script src=\"assets/script.js\"></script>\n"
                + "    </body>\n"
                + "</html>");
    }
}
