package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnections.eventdbconnection;
import services.Eventservice;

@WebServlet("/delete")
public class deleteEvent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String eventId = req.getParameter("eventid");
        if (eventId != null) eventId = eventId.trim();

        Eventservice service = new Eventservice(eventdbconnection.getconnection());
        boolean deleted = service.deleteEvent(eventId);

        if (deleted) {
            resp.sendRedirect("delete.jsp?status=success");
        } else {
            resp.sendRedirect("delete.jsp?status=failed");
        }
    }

    // Optional: Support GET if needed
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
