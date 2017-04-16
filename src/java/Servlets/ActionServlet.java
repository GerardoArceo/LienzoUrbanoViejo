package Servlets;
import Clases.Funciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
        
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType( "text/html; charset=iso-8859-1" );
		PrintWriter out = response.getWriter();
                
                Funciones Funcion = new Funciones();
                String peticion = request.getParameter("peticion");
                String idPersona = request.getParameter("idPersona");
                String idArte = request.getParameter("idArte");
                
                switch(peticion){
                    case "like":{
                        try {
                            Funcion.nuevoLike(idArte, idPersona, "1");
                        } catch (SQLException ex) {
                            Logger.getLogger(ActionServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                        try {
                            out.println("<h1>");
                            if(Funcion.existeLike(idArte, idPersona)==true){
                                out.println("<i class=\"fa fa-thumbs-up\"></i>");
                            }else{
                                out.println("<i class=\"fa fa-thumbs-o-up\"></i>");
                            }
                            out.println("<br>"+Funcion.verLikes(idArte)[0]+"</h1>");
                            out.println("<script>cambiarDislike('"+Funcion.verLikes(idArte)[1]+"');</script> ");
                        } catch (SQLException ex) {
                            out.println("error");
                            Logger.getLogger(ActionServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        break;
                    }
                    case "dislike":{
                        try {
                            Funcion.nuevoLike(idArte, idPersona, "0");
                        } catch (SQLException ex) {
                            Logger.getLogger(ActionServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                        try {
                            out.println("<h1>");
                            if(Funcion.existeDislike(idArte, idPersona)==true){
                                out.println("<i class=\"fa fa-thumbs-down\"></i>");
                            }else{
                                out.println("<i class=\"fa fa-thumbs-o-down\"></i>");
                            }
                            out.println("<br>"+Funcion.verLikes(idArte)[1]+"</h1>");
                            out.println("<script>cambiarLike('"+Funcion.verLikes(idArte)[0]+"');</script> ");                      
                        } catch (SQLException ex) {
                            out.println("error");
                            Logger.getLogger(ActionServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        break;
                    }
                    case "fav":{
                        try {
                            Funcion.nuevoFavorito(idArte, idPersona);
                        } catch (SQLException ex) {
                            Logger.getLogger(ActionServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                        try {
                            out.println("<h1>");
                            if(Funcion.existeFav(idArte, idPersona)==true){
                                out.println("<i class=\"fa fa-star\"></i>");
                            }else{
                                out.println("<i class=\"fa fa-star-o\"></i>");
                            }
                            out.println("</h1>");
                        } catch (SQLException ex) {
                            out.println("error");
                            Logger.getLogger(ActionServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        break;
                    }
                }
	}
}