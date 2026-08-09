package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dbconnections.eventdbconnection;
import models.Event;
import services.Eventservice;

@WebServlet("/updateEvent")
public class updateservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch only required parameters
        String eventId = request.getParameter("eventid");
        String eventName = request.getParameter("eventname");
        String location = request.getParameter("location");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String contactEmail = request.getParameter("contactemail");
        String contactPhone = request.getParameter("contactphone");

        // Populate Event object
        Event event = new Event();
        event.setEventId(eventId);
        event.setEventName(eventName);
        event.setLocation(location);
        event.setDate(date);
        event.setTime(time);
        event.setContactEmail(contactEmail);
        event.setContactPhone(contactPhone);

        // Update in DB
        Eventservice service = new Eventservice(eventdbconnection.getconnection());
        boolean updated = service.updateEvent(event);

        // Redirect with status
        if (updated) {
            response.sendRedirect("update.jsp?status=success");
        } else {
            response.sendRedirect("update.jsp?status=fail");
        }
    }
}
