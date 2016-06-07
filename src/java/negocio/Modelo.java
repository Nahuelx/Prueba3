package negocio;

import accesodato.Conexion;

public class Modelo {
    private int modelo_id;
    private String nombre;
    private int marca_id;
    private String estado;
    Conexion con = null;
    
    public Modelo(){
        con = new Conexion();
    }

    public int getModelo_id() {
        return modelo_id;
    }

    public void setModelo_id(int modelo_id) {
        this.modelo_id = modelo_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getMarca_id() {
        return marca_id;
    }

    public void setMarca_id(int marca_id) {
        this.marca_id = marca_id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Conexion getCon() {
        return con;
    }

    public void setCon(Conexion con) {
        this.con = con;
    }
    
}
