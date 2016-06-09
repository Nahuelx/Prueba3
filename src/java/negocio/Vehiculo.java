package negocio;

import accesodato.Conexion;


public class Vehiculo {
    private int vehiculo_id;
    private String tipo;
    private String patente;
    private String fecha_creacion;
    private int modelo_id;
    private String estado;
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

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public int getModelo_id() {
        return modelo_id;
    }

    public void setModelo_id(int modelo_id) {
        this.modelo_id = modelo_id;
    }

    public String getEstadO() {
        return estado;
    }

    public void setEstadO(String estadO) {
        this.estado = estado;
    }

    public String getCreado_por() {
        return creado_por;
    }

    public void setCreado_por(String creado_por) {
        this.creado_por = creado_por;
    }
    
    public void crearV(){
        con.setInsertar("insert into vehiculos(tipo,patente,fecha_creacion,modelo_id,estado,creado_por) values('" + this.getTipo() + "','" + this.getPatente() +"','" + this.getFecha_creacion() +"','" + this.getModelo_id() + "','Activo','" + this.getCreado_por() +"')");
    }
    public void eliminarV(){
        con.setInsertar("update Vehiculos set estado='Pasivo' where vehiculo_id ='" + this.getVehiculo_id() + "';");
    }
    public void actualizarV(){
        con.setInsertar("update Vehiculos set tipo='" + this.getTipo() +"', patente='" + this.getPatente() +"',fecha_creacion='" + this.getFecha_creacion() + "',modelo_id = '" + this.getModelo_id() + "',creado_por='" + this.getCreado_por() + "' where vehiculo_id ='" + this.getVehiculo_id() + "';");
    }
    
}
