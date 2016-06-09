package negocio;

import accesodato.Conexion;

public class Modelo {

    private int modelo_id;
    private String nombre;
    private int marca_id;
    private String estado;
    Conexion con;

    public Modelo() {
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

    public void crearMo() {
        con.setInsertar("insert into Modelos(nombre, marca_id, estado) values ('" + this.getNombre() + "','" + this.getMarca_id() + "','Activo')");
    }

    public void eliminarMo() {
        con.setInsertar("update Modelos set estado = 'pasivo' where modelo_id = '" + this.getModelo_id() + "'");
    }

    public void actualizarMo() {
        con.setInsertar("update Modelos set nombre= '"+ this.getNombre()+"', marca_id= '"+ this.getMarca_id()+"' where modelo_id='" + this.modelo_id + "'");

    }
}