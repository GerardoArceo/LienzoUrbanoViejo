package Clases;

import DB.DB;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Funciones
{
    private String query;
    private final DB DB;
    private ResultSet resultados;
    
    public Funciones() {
        DB = new DB();
    }
    
    public String[] verInformacion() throws SQLException{
        query="call verInformacion();";
        String info[] = new String[3];
        DB.conectar();
        resultados = DB.consulta(query);
        if (resultados.next()) {
            info[0] = resultados.getString("numPersonas");
            info[1] = resultados.getString("numArte");
            info[2] = resultados.getString("numEstados");
        }
        DB.cierraConexion();
        return info;
    }
    
    public ArrayList<String> verEstados(int idPais) throws SQLException{
        query="call verEstados("+idPais+");";
        ArrayList<String> estados = new ArrayList<>();
        DB.conectar();
        resultados = DB.consulta(query);
        while (resultados.next()) {
            estados.add(resultados.getString("idEstado"));
            estados.add(resultados.getString("estado"));
        }
        DB.cierraConexion();
        return estados;
    }
    
    public Usuario iniciarSesion(String usuario, String pass) throws SQLException{
        query="call verDatos('"+usuario+"' , '"+pass+"');";
        Usuario p = new Usuario();
        DB.conectar();
        resultados = DB.consulta(query);
        if (resultados.next()) {
            p.setNombre(resultados.getString("nombre"));
            p.setPaterno(resultados.getString("aPaterno"));
            p.setMaterno(resultados.getString("aMaterno"));
            p.setId(resultados.getString("idPersona"));
            p.setEstado(resultados.getString("idEstado"));
        }
        DB.cierraConexion();
        return p;
    }
    
    public String registrarPersona(String nombre, String aPaterno, String aMaterno, String usuario, String pass, String idEstado) throws SQLException{
        query="call registrarPersona('"+nombre+"','"+aPaterno+"','"+aMaterno+"','"+usuario+"','"+pass+"',"+idEstado+");";
        String msj = "";
        DB.conectar();
        resultados = DB.consulta(query);
        if (resultados.next()) {
            msj=resultados.getString("msj");
        }
        DB.cierraConexion();
        return msj;
    }
    
    public void agregarArte(String nombre,InputStream foto,String costo,String tiempo,String descripcion,String idCategoria,String idArtista) throws SQLException{
        query="call registrarPersona(?,?,?,?,?,?,?);";
        DB.conectar();
        Connection con = DB.getCon();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nombre);
            ps.setBinaryStream(2, foto);
            ps.setString(1, costo);
            ps.setString(1, tiempo);
            ps.setString(1, descripcion);
            ps.setString(1, idCategoria);
            ps.setString(1, idArtista);
            ps.executeUpdate();
            ps.close();
        }
        DB.cierraConexion();    
    }
    
    public void guardaImagen(String usuario, InputStream foto) throws SQLException, FileNotFoundException {
        DB.conectar();
        Connection con = DB.getCon();
        try (PreparedStatement ps = con.prepareStatement("call actualizarFoto(?,?);")) {
            ps.setString(1, usuario);
            ps.setBinaryStream(2, foto);
            ps.executeUpdate();
            ps.close();
        }
        DB.cierraConexion();       
    }
}