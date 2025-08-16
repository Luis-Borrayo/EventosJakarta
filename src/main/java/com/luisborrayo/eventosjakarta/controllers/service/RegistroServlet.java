package com.luisborrayo.eventosjakarta.controllers.service;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.luisborrayo.eventosjakarta.controllers.models.Usuarios;
import com.luisborrayo.eventosjakarta.controllers.repositories.UserRepository;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/auth/registro")
public class RegistroServlet extends HttpServlet {
    private final UserRepository userRepository = new UserRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("correo");
        String pass = request.getParameter("contra");
        String tipo = request.getParameter("rol");

        Optional<Usuarios> existe = userRepository.findByEmail(email);
        if (existe.isPresent()) {
            response.sendRedirect(request.getContextPath()+"/registro.jsp?err=existe");
            return;
        }

        Usuarios nuevo = new Usuarios(nombre, email, pass, "USER");
        userRepository.save(nuevo);

        response.sendRedirect(request.getContextPath()+"/login.jsp?msg=registrado");

    }
}
