package com.luisborrayo.eventosjakarta.controllers.controlles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.luisborrayo.eventosjakarta.controllers.repositories.EventRepository;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

@WebServlet("/admin/events")
public class AdminEventosServlet extends HttpServlet {
    private final EventRepository eventRepository = new EventRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Simplemente muestra el formulario
        request.getRequestDispatcher("/admin/crear-evento.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String fechaStr = request.getParameter("fecha");
        String ubicacion = request.getParameter("ubicacion");

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

            response.sendRedirect(request.getContextPath() + "/events?success=created");

        } catch (DateTimeParseException e) {
            request.setAttribute("error", "Formato de fecha inválido");
            request.getRequestDispatcher("/admin/crear-evento.jsp").forward(request, response);
        }
    }
}
