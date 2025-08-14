package repositories;

import models.Usuarios;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserRepository {
    private static final List<Usuarios> usuarios = new ArrayList<>();
    
    static {
        // Initialize with some default users
        usuarios.add(new Usuarios("Admin", "admin@eventos.com", "admin123", "ADMIN"));
        usuarios.add(new Usuarios("Usuario", "user@eventos.com", "user123", "USER"));
    }
    
    public Optional<Usuarios> findByEmail(String email) {
        return usuarios.stream()
                .filter(user -> user.getCorreo().equals(email))
                .findFirst();
    }
    
    public List<Usuarios> findAll() {
        return new ArrayList<>(usuarios);
    }
    
    public void save(Usuarios usuario) {
        usuarios.add(usuario);
    }
}
