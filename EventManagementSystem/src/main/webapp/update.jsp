<%@ page import="models.Event" %>
<%@ page import="services.Eventservice" %>
<%@ page import="dbconnections.eventdbconnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Event</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.75), rgba(0,0,0,0.85)),
                        url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        .container {
            margin-top: 60px;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.6);
            border: 1px solid rgba(255,255,255,0.15);
        }

        label {
            color: #00ffe7;
            font-weight: 500;
        }

        .form-control {
            background-color: rgba(255,255,255,0.08);
            color: #fff;
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 10px;
        }

        .form-control:focus {
            background-color: rgba(255,255,255,0.15);
            border-color: #00ffe7;
            box-shadow: 0 0 8px #00ffe7;
        }

        .btn-primary {
            background-color: #00ffe7;
            border: none;
            font-weight: bold;
            color: #000;
        }

        .btn-success {
            background-color: #00d28a;
            border: none;
            font-weight: bold;
        }

        .btn-secondary {
            border-radius: 30px;
            font-weight: bold;
            margin-top: 20px;
            padding: 10px 25px;
        }

        .btn-secondary:hover {
            background-color: #777;
        }

        .text-title {
            color: #00ffe7;
            text-shadow: 0 0 8px #00ffe7;
        }

        .alert {
            border-radius: 10px;
        }

        .back-home {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center text-title mb-4">Update Event by ID</h2>

    <!-- Step 1: Input Event ID -->
    <form method="get" action="update.jsp" class="mb-4 glass-card">
        <div class="form-group row justify-content-center align-items-center">
            <label class="col-sm-3 col-form-label">Enter Event ID:</label>
            <div class="col-sm-5">
                <input type="text" name="eventid" class="form-control" placeholder="e.g., E101" required>
            </div>
            <div class="col-sm-2">
                <button type="submit" class="btn btn-primary">Fetch</button>
            </div>
        </div>
    </form>

<%
    String eventid = request.getParameter("eventid");
    Event e = null;

    if (eventid != null && !eventid.trim().isEmpty()) {
        Eventservice service = new Eventservice(eventdbconnection.getconnection());
        e = service.getByEventId(eventid);

        if (e == null) {
%>
    <div class="alert alert-danger text-center">❌ No event found with ID: <strong><%= eventid %></strong></div>
<%
        } else {
%>

    <!-- Step 2: Show Form -->
    <form action="updateEvent" method="post" class="glass-card">
        <input type="hidden" name="eventid" value="<%= e.getEventId() %>">

        <div class="form-group">
            <label>Event Name</label>
            <input type="text" name="eventname" class="form-control" value="<%= e.getEventName() %>" required>
        </div>

        <div class="form-group">
            <label>Location</label>
            <input type="text" name="location" class="form-control" value="<%= e.getLocation() %>" required>
        </div>

        <div class="form-group">
            <label>Date</label>
            <input type="date" name="date" class="form-control" value="<%= e.getDate() %>" required>
        </div>

        <div class="form-group">
            <label>Time</label>
            <input type="time" name="time" class="form-control" value="<%= e.getTime() %>" required>
        </div>

        <div class="form-group">
            <label>Contact Email</label>
            <input type="email" name="contactemail" class="form-control" value="<%= e.getContactEmail() %>" required>
        </div>

        <div class="form-group">
            <label>Contact Phone</label>
            <input type="text" name="contactphone" class="form-control" value="<%= e.getContactPhone() %>" required>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-success">Update Event</button>
        </div>
    </form>

<%
        }
    }
%>

    <!-- Back to Home Button -->
    <div class="back-home mt-4">
        <a href="home.jsp" class="btn btn-secondary">⬅ Back to Home</a>
    </div>

</div>
</body>
</html>
