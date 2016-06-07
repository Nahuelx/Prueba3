package negocio;

import accesodato.Conexion;

public class Marca {
    private int marca_id;
    private String nombre;
    private String estado;
    Conexion con = null;
    
    public Marca(){
        con = new Conexion();
    }

    public int getMarca_id() {
        return marca_id;
    }

    public void setMarca_id(int marca_id) {
        this.marca_id = marca_id;
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
    public void crearMa(){
        con.setConsulta("insert into Marca(nombre,estado)" +
                "values('" + this.getNombre() + "','Activo')");
    }
    public void eliminarMa(){
        con.setConsulta("update Marca set estado='Pasivo' where marca_id='" + this.getMarca_id() + "'");
    }
    public void actualizarMa(){
        con.setConsulta("update Marca set nombre='" + this.getNombre() +"' where marca_id ='" + this.getMarca_id() + "'");
    }
}
