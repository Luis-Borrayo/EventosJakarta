package com.luisborrayo.eventosjakarta.controllers.repositories;

import com.luisborrayo.eventosjakarta.controllers.models.Usuarios;

import java.util.*;

public class UserRepository {
    private static final Map<String, Usuarios> users = new HashMap<>();

    static {
        users.put("admin1@gmail.com", new Usuarios("Luis", "admin1@gmail.com", "admin123", "ADMIN"));
        users.put("admin2@gmail.com", new Usuarios("Oscar", "admin2@gmail.com", "admin123", "ADMIN"));
        users.put("user@gmail.com", new Usuarios("Moises", "user@gmail.com", "user123", "USER"));
    }

    public Optional<Usuarios> findByEmail(String email) {
        return Optional.ofNullable(users.get(email));
    }

    public void save(Usuarios usuario) {
        users.put(usuario.getCorreo(), usuario);
    }
}