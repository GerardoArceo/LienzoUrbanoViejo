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
    
    public ArrayList<String> verCategorias() throws SQLException{
        query="select * from catCategorias;";
        ArrayList<String> categorias = new ArrayList<>();
        DB.conectar();
        resultados = DB.consulta(query);
        while (resultados.next()) {
            categorias.add(resultados.getString("idCategoria"));
            categorias.add(resultados.getString("categoria"));
        }
        DB.cierraConexion();
        return categorias;
    }
    
    public ArrayList<String> verArteCategoria(String idCategoria) throws SQLException{
        query="call verArteCategoria("+idCategoria+");";
        ArrayList<String> arte = new ArrayList<>();
        DB.conectar();
        resultados = DB.consulta(query);
        while (resultados.next()) {
            arte.add(resultados.getString("idArte"));
            arte.add(resultados.getString("nombre"));
            arte.add(resultados.getString("costo"));
            arte.add(resultados.getString("tiempo"));
            arte.add(resultados.getString("fecha"));
            arte.add(resultados.getString("descripcion"));
            arte.add(resultados.getString("categoria"));
        }
        DB.cierraConexion();
        return arte;
    }
    
    public ArrayList<String> verArteTop() throws SQLException{
        query="call verArteTop();";
        ArrayList<String> arte = new ArrayList<>();
        DB.conectar();
        resultados = DB.consulta(query);
        while (resultados.next()) {
            arte.add(resultados.getString("idArte"));
            arte.add(resultados.getString("nombre"));
            arte.add(resultados.getString("costo"));
            arte.add(resultados.getString("tiempo"));
            arte.add(resultados.getString("fecha"));
            arte.add(resultados.getString("descripcion"));
            arte.add(resultados.getString("categoria"));
        }
        DB.cierraConexion();
        return arte;
    }
    
    public ArrayList<String> verArtePersona(String idPersona) throws SQLException{
        query="call verArtePersona("+idPersona+");";
        ArrayList<String> arte = new ArrayList<>();
        DB.conectar();
        resultados = DB.consulta(query);
        while (resultados.next()) {
            arte.add(resultados.getString("idArte"));
            arte.add(resultados.getString("nombre"));
            arte.add(resultados.getString("costo"));
            arte.add(resultados.getString("tiempo"));
            arte.add(resultados.getString("fecha"));
            arte.add(resultados.getString("descripcion"));
            arte.add(resultados.getString("categoria"));
        }
        DB.cierraConexion();
        return arte;
    }
    
    public ArrayList<String> verArteFavorito(String idPersona) throws SQLException{
        query="call verArteFavorito("+idPersona+");";
        ArrayList<String> arte = new ArrayList<>();
        DB.conectar();
        resultados = DB.consulta(query);
        while (resultados.next()) {
            arte.add(resultados.getString("idArte"));
            arte.add(resultados.getString("nombre"));
            arte.add(resultados.getString("costo"));
            arte.add(resultados.getString("tiempo"));
            arte.add(resultados.getString("fecha"));
            arte.add(resultados.getString("descripcion"));
            arte.add(resultados.getString("categoria"));
        }
        DB.cierraConexion();
        return arte;
    }
        
    public String[] verArte(String idArte) throws SQLException{
        query="call verArte("+idArte+");";
        String[] arte = new String[9];
        DB.conectar();
        resultados = DB.consulta(query);
        if (resultados.next()) {
            arte[0]=(resultados.getString("idArte"));
            arte[1]=(resultados.getString("nombre"));
            arte[2]=(resultados.getString("costo"));
            arte[3]=(resultados.getString("tiempo"));
            arte[4]=(resultados.getString("fecha"));
            arte[5]=(resultados.getString("descripcion"));
            arte[6]=(resultados.getString("categoria"));
            arte[7]=(resultados.getString("idCategoria"));
            arte[8]=(resultados.getString("idArtista"));
        }
        DB.cierraConexion();
        return arte;
    }
    
    public String[] verDatosId(String idPersona) throws SQLException{
        query="call verDatosId("+idPersona+");";
        String[] arte = new String[10];
        DB.conectar();
        resultados = DB.consulta(query);
        if (resultados.next()) {
            arte[0]=(resultados.getString("nombre"));
            arte[1]=(resultados.getString("aPaterno"));
            arte[2]=(resultados.getString("aMaterno"));
            arte[3]=(resultados.getString("usuario"));
            arte[4]=(resultados.getString("pass"));
            arte[5]=(resultados.getString("contacto"));
            arte[6]=(resultados.getString("idEstado"));
            arte[7]=(resultados.getString("estado"));
            arte[8]=(resultados.getString("idPais"));
            arte[9]=(resultados.getString("pais"));
        }
        DB.cierraConexion();
        return arte;
    }
    
    public String[] verLikes(String idArte) throws SQLException{
        query="call verLikes("+idArte+");";
        String likes[] = new String[2];
        DB.conectar();
        resultados = DB.consulta(query);
        if (resultados.next()) {
            likes[0]=resultados.getString("likes");
            likes[1]=resultados.getString("dislikes");
        }
        DB.cierraConexion();
        return likes;
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
    
    public String registrarPersona(String nombre, String aPaterno, String aMaterno, String usuario, String pass, String idEstado, String contacto) throws SQLException{
            query="call registrarPersona('"+nombre+"','"+aPaterno+"','"+aMaterno+"','"+usuario+"','"+pass+"',"+idEstado+",'"+contacto+"');";
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
        query="call agregarArte(?,?,?,?,?,?,?);";
        DB.conectar();
        Connection con = DB.getCon();
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nombre);
            ps.setBinaryStream(2, foto);
            ps.setString(3, costo);
            ps.setString(4, tiempo);
            ps.setString(5, descripcion);
            ps.setString(6, idCategoria);
            ps.setString(7, idArtista);
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