package Clases;

public class Usuario
{
    private String nombre;
    private String paterno;
    private String materno;
    private String id;
    private String estado;
    
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(final String nombre) {
        this.nombre = nombre;
    }
    
    public String getPaterno() {
        return this.paterno;
    }
    
    public void setPaterno(final String paterno) {
        this.paterno = paterno;
    }
    
    public String getMaterno() {
        return this.materno;
    }
    
    public void setMaterno(final String materno) {
        this.materno = materno;
    }
    
    public String getId() {
        return this.id;
    }
    
    public void setId(final String id) {
        this.id = id;
    }
    
    public String capitalizar(final String palabra) {
        if (palabra.length() == 0) {
            return palabra;
        }
        return palabra.substring(0, 1).toUpperCase() + palabra.substring(1).toLowerCase();
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
