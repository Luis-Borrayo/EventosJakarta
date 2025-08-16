package com.luisborrayo.eventosjakarta.controllers.controlles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.luisborrayo.eventosjakarta.controllers.repositories.EventRepository;

import java.io.IOException;

@WebServlet("/admin/delete-event")
public class DeleteEventoServlet extends HttpServlet {
    private final EventRepository eventRepository = new EventRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/events?error=invalid_id");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            boolean deleted = eventRepository.deleteById(id);

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/events?success=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/events?error=not_found");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/events?error=invalid_id");
        }
    }
}
