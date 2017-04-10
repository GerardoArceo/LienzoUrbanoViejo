package DB;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DB
{
    private final String url = "jdbc:mysql://localhost:3306/LienzoUrbano";
    private final String user = "root";
    private final String pass = "n0m3l0";
    private final String driverClassName = "com.mysql.jdbc.Driver";
    private Connection con;
    private Statement estancia;

    public void conectar() throws SQLException {
        try {
            Class.forName(this.driverClassName).newInstance();
            this.con = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException err) {
            System.out.println("Error " + err.getMessage());
        }
    }
    
    public Connection getCon() { //Para usar el PreparedStatement
        return con;
    }
    
    public void cierraConexion() throws SQLException {
        this.con.close();
    }
    
    public ResultSet consulta(String query) throws SQLException {
        this.estancia = (Statement) con.createStatement();
        ResultSet res = estancia.executeQuery(query);
        return res;
    }
    
}
