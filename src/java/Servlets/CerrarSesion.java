package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

public class CerrarSesion extends HttpServlet
{
    @Override
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        final HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        out.println("<html><head>"+
        "<script src=\"js/validacion.js\" language=\"javascript\" type=\"text/javascript\"></script>" + 
        "</head><body onload=\"Redirigir();\">");
        out.println("<form action=\"index.jsp\" method=\"POST\" name=\"red\" id=\"red\">\n" +
"                     <input type=\"hidden\" name=\"ok\" value=\"CerrarSesion\">" +
"                 </form></body></html>");
    }
}