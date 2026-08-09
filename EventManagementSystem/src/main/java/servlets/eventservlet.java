package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnections.eventdbconnection;
import models.Event;
import services.Eventservice;

@WebServlet("/register")
public class eventservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Event details submitted by the user
        String eventId = req.getParameter("eventid");
        String eventName = req.getParameter("eventname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Using employee class as event placeholder (field mapping changed)
        Event emp = new Event();
        emp.setEventId(eventId);         // Mapping event ID
        emp.setEventName(eventName);     // Mapping event name
        emp.setContactEmail(email);
        emp.setPassword(password);

        Eventservice service = new Eventservice(eventdbconnection.getconnection());
        boolean f = service.register(emp);

        if (f) {
            System.out.println("✅ Event registered successfully!");
            resp.sendRedirect("login.jsp?status=registered");
        } else {
            System.out.println("❌ Failed to register event.");
            resp.sendRedirect("register.jsp?status=error");
        }
    }
}
