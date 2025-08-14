package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.EventRepository;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

@WebServlet("/admin/events")
public class AdminEventosServlet extends HttpServlet {
    private final EventRepository eventRepository = new EventRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is authenticated and has ADMIN role
        if (!isAdminAuthenticated(request, response)) {
            return;
        }

        // Forward to admin events form
        request.getRequestDispatcher("/admin/crear-evento.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is authenticated and has ADMIN role
        if (!isAdminAuthenticated(request, response)) {
            return;
        }

        String nombre = request.getParameter("nombre");
        String fechaStr = request.getParameter("fecha");
        String ubicacion = request.getParameter("ubicacion");

        // Validate input
        if (nombre == null || nombre.trim().isEmpty() || 
            fechaStr == null || fechaStr.trim().isEmpty() ||
            ubicacion == null || ubicacion.trim().isEmpty()) {
            
            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher("/admin/crear-evento.jsp").forward(request, response);
            return;
        }

        try {
            LocalDate fecha = LocalDate.parse(fechaStr);
            eventRepository.save(nombre.trim(), fecha, ubicacion.trim());
            
            // Redirect to events list with success message
            response.sendRedirect(request.getContextPath() + "/events?success=created");
            
        } catch (DateTimeParseException e) {
            request.setAttribute("error", "Formato de fecha inválido");
            request.getRequestDispatcher("/admin/crear-evento.jsp").forward(request, response);
        }
    }

    private boolean isAdminAuthenticated(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("auth") == null || 
            !(Boolean) session.getAttribute("auth")) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return false;
        }

        String rol = (String) session.getAttribute("rol");
        if (!"ADMIN".equals(rol)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Acceso denegado. Solo administradores.");
            return false;
        }

        return true;
    }
}
