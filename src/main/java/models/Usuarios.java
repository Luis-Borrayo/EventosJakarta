package models;

public class Usuarios {
    private final String nombre;
    private  final String correo;
    private  final String pass;
    private final String rol;

    public Usuarios(String nombre, String correo, String pass, String rol) {
        this.nombre = nombre;
        this.correo = correo;
        this.pass = pass;
        this.rol = rol;
    }
    public String getNombre() {
        return nombre;
    }
    public String getCorreo() {
        return correo;
    }
    public String getPass() {
        return pass;
    }
    public String getRol() {
        return rol;
    }

}
