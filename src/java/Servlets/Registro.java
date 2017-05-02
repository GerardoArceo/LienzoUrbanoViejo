package Servlets;

import Clases.Funciones;
import java.io.IOException;
import javax.servlet.ServletException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Part;

public class Registro extends HttpServlet
{
    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String nombre = request.getParameter("usuario");
        String aPaterno = request.getParameter("aPaterno");
        String aMaterno = request.getParameter("aMaterno");
        String idEstado = request.getParameter("ciudad");
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        String contacto = request.getParameter("contacto");
        final Part foto = request.getPart("foto");
        final String tipo = foto.getContentType();
        final long size = foto.getSize();
        final InputStream f = foto.getInputStream();
        Funciones Funcion = new Funciones();
        
        usuario = usuario.replace("#", "");
        pass = pass.replace("#", "");
        String msj = "";
        try {
            msj=Funcion.registrarPersona(nombre, aPaterno, aMaterno, usuario, pass, idEstado, contacto);
            if (size < 1500000L) {
                if (tipo.equals("image/jpeg") || tipo.equals("image/png") || tipo.equals("image/jpg")) {
                    Funcion.guardaImagen(usuario, f);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        out.println("<html><head>"+
        "<script src=\"js/validacion.js\" language=\"javascript\" type=\"text/javascript\"></script>" + 
        "</head><body onload=\"Redirigir();\">");
        if (msj.equals("ok")) {
            out.println("<form action=\"index.jsp\" method=\"POST\" name=\"red\" id=\"red\">\n" +
"                     <input type=\"hidden\" name=\"ok\" value=\"registro\">" +
"                 </form>");
        }else {
            out.println("<form action=\"registro.jsp\" method=\"POST\" name=\"red\" id=\"red\">\n" +
"                     <input type=\"hidden\" name=\"error\" value=\"usuario\">" +
"                 </form>");
        }
        out.println("</body></html>");
    }
}