package Servlets;

import Clases.Funciones;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import Clases.Usuario;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

public class InicioSesion extends HttpServlet
{
    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        Funciones Funcion = new Funciones();
        
        usuario = usuario.replace("#", "");
        pass = pass.replace("#", "");
        
        Usuario user = null;
        try {
            user = Funcion.iniciarSesion(usuario, pass);
        } catch (SQLException ex) {
            Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        out.println("<html><head>"+
        "<script src=\"js/validacion.js\" language=\"javascript\" type=\"text/javascript\"></script>" + 
        "</head><body onload=\"Redirigir();\">");
        if (user.getId() == null) {
            out.println("<form action=\"inicioSesion.jsp\" method=\"POST\" name=\"red\" id=\"red\">\n" +
"                     <input type=\"hidden\" name=\"error\" value=\"error\">" +
"                 </form>");
        }else {
            final HttpSession session = request.getSession();
            session.setAttribute("user", (Object)user);
            out.println("<form action=\"index.jsp\" method=\"POST\" name=\"red\" id=\"red\">\n" +
"                     <input type=\"hidden\" name=\"ok\" value=\"ok\">" +
"                 </form>");
        }
        out.println("</body></html>");
    }
}