package com.luisborrayo.eventosjakarta;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Usuarios;
import repositories.UserRepository;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {
    private final UserRepository user = new UserRepository();

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("correo");
        String pass = request.getParameter("contra");
        Optional<Usuarios> u= user.findByEmail(email);
        if (u.isPresent() && u.get().getPass().equals(pass)) {
            HttpSession sessionant = request.getSession(false);
            if (sessionant != null) {
                sessionant.invalidate();
            }
            HttpSession newsession = request.getSession(true);
            newsession.setAttribute("auth", true);
            newsession.setAttribute("usuariorepo", email);
            newsession.setAttribute("rol", u.get().getRol());
            newsession.setMaxInactiveInterval(15*60);

            response.sendRedirect(request.getContextPath()+"/inicio.jsp");
        }else{
            request.setAttribute("contenido", "/login.jsp");
            response.sendRedirect(request.getContextPath()+"/login.jsp?err=1");
        }
    }

}
