package com.luisborrayo.eventosjakarta.controllers.controlles;

import com.luisborrayo.eventosjakarta.controllers.models.Usuarios;
import com.luisborrayo.eventosjakarta.controllers.repositories.UserRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@WebServlet("/auth/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath()+"/login.jsp?bye=1");
    }

    @WebServlet("/auth/login")
    public static class LoginServlet extends HttpServlet {
        private final UserRepository user = new UserRepository();

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String email = request.getParameter("correo");
            String pass = request.getParameter("contra");
            Optional<Usuarios> u = user.findByEmail(email);

            if (u.isPresent() && u.get().getPass().equals(pass)) {
                HttpSession sessionant = request.getSession(false);
                if (sessionant != null) {
                    sessionant.invalidate();
                }

                HttpSession newsession = request.getSession(true);
                newsession.setAttribute("auth", true);
                newsession.setAttribute("usuariorepo", email);
                newsession.setAttribute("rol", u.get().getRol());
                newsession.setMaxInactiveInterval(15 * 60);

                String fechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
                Cookie lastLoginCookie = new Cookie("lastLogin", fechaHora);
                lastLoginCookie.setMaxAge(60 * 60 * 24 * 30);
                lastLoginCookie.setPath("/");
                response.addCookie(lastLoginCookie);

                request.setAttribute("vista", "/views/login.jsp");
                response.sendRedirect(request.getContextPath() + "/menu.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/login.jsp?err=1");
            }
        }
    }
}
