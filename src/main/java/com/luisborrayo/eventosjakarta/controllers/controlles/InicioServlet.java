package com.luisborrayo.eventosjakarta.controllers.controlles;

import com.luisborrayo.eventosjakarta.controllers.models.Evento;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.luisborrayo.eventosjakarta.controllers.repositories.EventRepository;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class InicioServlet extends HttpServlet {
    private final EventRepository event = new EventRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Evento> eventos = event.findAll();
        request.setAttribute("contenido", "/views/menu.jsp");
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
    }
}