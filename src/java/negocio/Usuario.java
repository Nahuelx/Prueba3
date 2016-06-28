package negocio;

import accesodato.Conexion;

public class Usuario {

    private int usuario_id;
    private String usuario;
    private String clave;
    private String fecha_nacimiento;
    private int ciudad_id;
    private String estado;
    Conexion con;
    
    public Usuario() {
        con = new Conexion();
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    public int getCiudad_id() {
        return ciudad_id;
    }

    public void setCiudad_id(int ciudad_id) {
        this.ciudad_id = ciudad_id;
    }

    public void crearU() {
        con.setInsertar("insert into Usuarios(usuario, clave, fecha_nacimiento, ciudad_id, estado) values ('" + this.getUsuario() + "','" +this.getClave()+"', '"+this.getFecha_nacimiento()+"','" + this.getCiudad_id() + "','Activo')");
    }

    public void eliminarU() {
        con.setInsertar("update Usuarios set estado='pasivo' where usuario_id='" + this.getUsuario_id() + "'");
    }

    public void actualizarU() {
        con.setInsertar("update Usuarios set usuario='" + this.getUsuario() + "',clave='" + this.getClave() + "',fecha_nacimiento='" + this.getFecha_nacimiento() + "',ciudad_id='" + this.getCiudad_id() + "' where usuario_id='" + this.usuario_id + "'");

    }
}