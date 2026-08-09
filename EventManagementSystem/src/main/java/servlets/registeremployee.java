package servlets;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnections.eventdbconnection;
import models.Event;
import services.Eventservice;

@WebServlet("/addevent")
public class registeremployee extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Auto-generate event ID
        String eventId = "EVT-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        // Get form parameters
        String eventName = req.getParameter("eventname");
        String location = req.getParameter("location");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String contactEmail = req.getParameter("contactemail");
        String contactPhone = req.getParameter("contactphone");

        // Create Event object
        Event event = new Event();
        event.setEventId(eventId);
        event.setEventName(eventName);
        event.setLocation(location);
        event.setDate(date);
        event.setTime(time);
        event.setContactEmail(contactEmail);
        event.setContactPhone(contactPhone);

        // Insert event
        Eventservice service = new Eventservice(eventdbconnection.getconnection());
        boolean success = service.addEvent(event);

        if (success) {
            System.out.println("✅ Event added with ID: " + eventId);
            resp.sendRedirect("addevent.jsp?status=success");
        } else {
            System.out.println("❌ Failed to add event.");
            resp.sendRedirect("addevent.jsp?error=fail");
        }
    }
}
