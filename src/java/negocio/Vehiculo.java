package negocio;

import accesodato.Conexion;


public class Vehiculo {
    private int vehiculo_id;
    private String tipo;
    private String patente;
    private String fechaCrea;
    private int modelo_id;
    private String estadO;
    private String creado_por;
    Conexion con = null;
    
    public Vehiculo(){
        con = new Conexion();
    }

    public int getVehiculo_id() {
        return vehiculo_id;
    }

    public void setVehiculo_id(int vehiculo_id) {
        this.vehiculo_id = vehiculo_id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getFechaCrea() {
        return fechaCrea;
    }

    public void setFechaCrea(String fechaCrea) {
        this.fechaCrea = fechaCrea;
    }

    public int getModelo_id() {
        return modelo_id;
    }

    public void setModelo_id(int modelo_id) {
        this.modelo_id = modelo_id;
    }

    public String getEstadO() {
        return estadO;
    }

    public void setEstadO(String estadO) {
        this.estadO = estadO;
    }

    public String getCreado_por() {
        return creado_por;
    }

    public void setCreado_por(String creado_por) {
        this.creado_por = creado_por;
    }

    public Conexion getCon() {
        return con;
    }

    public void setCon(Conexion con) {
        this.con = con;
    }
    
}
