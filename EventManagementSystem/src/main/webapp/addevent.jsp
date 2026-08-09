<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="bootstrap.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Event</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.8)),
                        url('https://static.vecteezy.com/system/resources/previews/003/689/228/non_2x/online-registration-or-sign-up-login-for-account-on-smartphone-app-user-interface-with-secure-password-mobile-application-for-ui-web-banner-access-cartoon-people-illustration-vector.jpg') 
                        no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.6);
            border: 1px solid rgba(255,255,255,0.2);
            animation: fadeInUp 0.8s ease;
        }

        .form-control {
            background-color: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            color: #fff;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .form-control:focus {
            background-color: rgba(255,255,255,0.15);
            border-color: rgba(255,255,255,0.2);
            box-shadow: none;
            outline: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, #00ffe7, #4facfe);
            border: none;
            color: #000;
            font-weight: 600;
            border-radius: 30px;
            transition: all 0.4s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #4facfe, #00ffe7);
            transform: scale(1.03);
            box-shadow: 0 0 15px #00ffe7;
        }

        h1 {
            font-weight: bold;
            color: #00ffe7;
        }

        .btn-secondary {
            border-radius: 30px;
            font-weight: 600;
            margin-top: 20px;
        }

        .alert-success {
            background-color: rgba(40, 167, 69, 0.2);
            border: 1px solid #28a745;
            color: #28a745;
            border-radius: 10px;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center mb-4">Add Event Details</h1>

    <!-- Success message -->
    <%
        String status = request.getParameter("status");
        if ("success".equals(status)) {
    %>
        <div class="alert alert-success text-center">
            ✅ Event added successfully!
        </div>
    <%
        }
    %>

    <div class="row justify-content-center">
        <div class="col-md-8">
            <form action="addevent" method="POST" class="form-container">

                <!-- Event Name -->
                <div class="form-group">
                    <label for="eventname">Event Name</label>
                    <input type="text" id="eventname" name="eventname" class="form-control" placeholder="e.g. Tech Fest 2025" required>
                </div>

                <!-- Location -->
                <div class="form-group">
                    <label for="location">Location</label>
                    <input type="text" id="location" name="location" class="form-control" placeholder="e.g. Auditorium" required>
                </div>

                <!-- Date -->
                <div class="form-group">
                    <label for="date">Date</label>
                    <input type="date" id="date" name="date" class="form-control" required>
                </div>

                <!-- Time -->
                <div class="form-group">
                    <label for="time">Time</label>
                    <input type="time" id="time" name="time" class="form-control" required>
                </div>

                <!-- Contact Email -->
                <div class="form-group">
                    <label for="contactemail">Contact Email</label>
                    <input type="email" id="contactemail" name="contactemail" class="form-control" placeholder="e.g. events@gmail.com" required>
                </div>

                <!-- Contact Phone -->
                <div class="form-group">
                    <label for="contactphone">Contact Phone</label>
                    <input type="tel" id="contactphone" name="contactphone" class="form-control" placeholder="e.g. +91 9876543210" required>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary px-5">Add Event</button>
                </div>
            </form>

            <!-- Back to Home Button -->
            <div class="text-center">
                <a href="home.jsp" class="btn btn-secondary">⬅ Back to Home</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
