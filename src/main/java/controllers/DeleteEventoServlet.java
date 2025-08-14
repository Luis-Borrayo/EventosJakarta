package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.EventRepository;

import java.io.IOException;

@WebServlet("/admin/delete-event")
public class DeleteEventoServlet extends HttpServlet {
    private final EventRepository eventRepository = new EventRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if user is authenticated and has ADMIN role
        if (!isAdminAuthenticated(request, response)) {
            return;
        }

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
