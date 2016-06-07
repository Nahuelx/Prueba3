package negocio;

import accesodato.Conexion;


public class Usuario {
    private int usuario_id;
    private String usuario;
    private String clave;
    private String fechaNac;
    private String estado;
    Conexion con = null;
    
    public Usuario(){
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

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public void insertarUsuario(){
        con.setConsulta("insert into Usuarios(usuario,clave,fecha_nacimiento,estado)" +
                "values('" + this.getUsuario() + "','" + this.getClave() +"','" + this.getFechaNac() +"','" + this.getEstado() + "';");
    }
}
