package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnections.eventdbconnection;
import services.Eventservice;

@WebServlet("/login")
public class loginemployee extends HttpServlet {

    // ✅ Default fallback credentials
    private static final String DEFAULT_EMAIL = "masesh@gmail.com";
    private static final String DEFAULT_PASSWORD = "1234567890";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Login using event organizer's email & password
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // ✅ Check for default hardcoded credentials first
        if (DEFAULT_EMAIL.equals(email) && DEFAULT_PASSWORD.equals(password)) {
            System.out.println("✅ Default event login successful.");
            req.getSession().setAttribute("userEmail", email);
            resp.sendRedirect("home.jsp");
            return;
        }

        // 🔁 Otherwise, proceed with DB login
        Eventservice service = new Eventservice(eventdbconnection.getconnection());
        boolean isValid = service.login(email, password);

        if (isValid) {
            System.out.println("✅ Event login successful.");
            req.getSession().setAttribute("userEmail", email);
            resp.sendRedirect("home.jsp");
        } else {
            System.out.println("❌ Invalid login credentials.");
            resp.sendRedirect("login.jsp?error=invalid");
        }
    }
}
