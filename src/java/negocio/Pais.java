package negocio;

import accesodato.Conexion;

public class Pais {
    private int pais_id;
    private String nombre;
    private String creado_por;
    private String estado;
    Conexion con = null;

    public String getCreado_por() {
        return creado_por;
    }

    public void setCreado_por(String creado_por) {
        this.creado_por = creado_por;
    }

    public int getPais_id() {
        return pais_id;
    }

    public void setPais_id(int pais_id) {
        this.pais_id = pais_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    public void crearP(){
        con = new Conexion();
        con.setInsertar("insert into Paises(nombre,creado_por,estado) values('" + this.getNombre() + "','" + this.getCreado_por() + "','Activo');");
    }
    public void eliminarP(){
        con = new Conexion();
        con.setInsertar("update Paises set estado='Pasivo' where pais_id='" + this.getPais_id() + "'");
    }
    public void actualizarP(){
        con = new Conexion();
        con.setInsertar("update Paises set nombre='" + this.getNombre() +"' where pais_id ='" + this.getPais_id() + "'");
    }
    
}
