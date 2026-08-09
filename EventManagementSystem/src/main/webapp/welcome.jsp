<%@page import="models.Event"%>
<%@page import="java.util.List"%>
<%@page import="dbconnections.eventdbconnection"%>
<%@page import="services.Eventservice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="bootstrap.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event List</title>

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.85)),
                        url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        .container {
            margin-top: 60px;
        }

        .table-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(12px);
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            border: 1px solid rgba(255,255,255,0.15);
        }

        table {
            color: #fff;
        }

        table th, table td {
            color: #e8f0fe;
        }

        th {
            background-color: rgba(0, 255, 231, 0.2);
        }

        .btn-primary, .btn-danger {
            font-weight: bold;
            padding: 4px 12px;
            border-radius: 8px;
            transition: none;
        }

        .btn-primary {
            background-color: #00ffe7;
            border: none;
            color: #000;
        }

        .btn-danger {
            background-color: #ff4f4f;
            border: none;
            color: #fff;
        }

        .btn-primary:hover,
        .btn-danger:hover {
            box-shadow: none;
            transform: none;
        }

        h2 {
            color: #00ffe7;
            text-shadow: 0 0 10px #00ffe7;
        }

        .thead-dark th {
            background-color: rgba(0,0,0,0.5);
            color: #00ffe7;
        }

        /* Search box */
        .search-input {
            margin-bottom: 20px;
            border-radius: 8px;
            background-color: rgba(255,255,255,0.1);
            color: #fff;
            border: 1px solid rgba(255,255,255,0.3);
        }

        .search-input::placeholder {
            color: #ccc;
        }

        .search-input:focus {
            border-color: #00ffe7;
            box-shadow: 0 0 10px #00ffe7;
            background-color: rgba(255,255,255,0.15);
        }
    </style>

    <script>
        function filterTable() {
            var input = document.getElementById("searchBox");
            var filter = input.value.toLowerCase();
            var table = document.getElementById("eventTable");
            var tr = table.getElementsByTagName("tr");

            for (var i = 1; i < tr.length; i++) {
                var rowText = tr[i].innerText.toLowerCase();
                tr[i].style.display = rowText.includes(filter) ? "" : "none";
            }
        }
    </script>
</head>
<body>

<div class="container">
    <div class="table-container">
        <h2 class="text-center mb-4">All Scheduled Events</h2>

        <input type="text" id="searchBox" onkeyup="filterTable()" class="form-control search-input mb-4" placeholder="Search events by name, location, date, etc.">

        <table class="table table-bordered " id="eventTable">
            <thead class="thead-dark">
                <tr>
                    <th>Event ID</th>
                    <th>Event Name</th>
                    <th>Location</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Contact Email</th>
                    <th>Contact Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Eventservice service = new Eventservice(eventdbconnection.getconnection());
                    List<Event> list = service.getAllEvents();
                    for(Event e : list){
                %>
                <tr>
                    <td><%= e.getEventId() %></td>
                    <td><%= e.getEventName() %></td>
                    <td><%= e.getLocation() %></td>
                    <td><%= e.getDate() %></td>
                    <td><%= e.getTime() %></td>
                    <td><%= e.getContactEmail() %></td>
                    <td><%= e.getContactPhone() %></td>
                    <td>
                        <a href="update.jsp?eventid=<%= e.getEventId() %>" class="btn btn-sm btn-primary">
                            <i class="bi bi-pencil"></i>
                        </a>
                        <a href="delete.jsp?eventid=<%= e.getEventId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this event?');">
                            <i class="bi bi-trash"></i>
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<div class="text-center mt-4">
    <a href="home.jsp" class="btn btn-secondary px-4 py-2 rounded-pill font-weight-bold">
        ⬅ Back to Home
    </a>
</div>

</body>
</html>
