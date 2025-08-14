package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Evento;
import repositories.EventRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/events")
public class EventosServlet extends HttpServlet {
    private final EventRepository eventRepository = new EventRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is authenticated
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("auth") == null || 
            !(Boolean) session.getAttribute("auth")) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Get all events
        List<Evento> eventos = eventRepository.findAll();
        request.setAttribute("eventos", eventos);
        request.setAttribute("userRole", session.getAttribute("rol"));
        
        // Forward to events JSP page
        request.getRequestDispatcher("/eventos.jsp").forward(request, response);
    }
}
