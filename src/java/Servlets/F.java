package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import java.io.OutputStream;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import DB.DB;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

public class F extends HttpServlet //Servlet desplegador de fotos
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String idPersona = request.getParameter("idAlumno");
        String idArte = request.getParameter("idArte");
        DB DB = new DB();
        DB.conectar();
        String query="";
        if(idArte!=null){
            query="call verArte("+idArte+");";
        }else{
            query="call verDatos("+idPersona+");";
        }        
        ResultSet resultados = DB.consulta(query);
        if (resultados.next()) {
            try {
                response.setContentType("image/jpg");
                final InputStream in = resultados.getBinaryStream("foto");
                final OutputStream out = (OutputStream)response.getOutputStream();
                final byte[] buffer = new byte[4096];
                while (true) {
                    final int nBytes = in.read(buffer);
                    if (nBytes == -1) {
                        break;
                    }
                    out.write(buffer, 0, nBytes);
                }
                in.close();
                out.flush();
                out.close();
            }
            catch (SQLException | IOException e) {
                System.out.println(e);
            }
        }
    }
    
    @Override
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        try {
            this.processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(F.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        try {
            this.processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(F.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
