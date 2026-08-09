<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="bootstrap.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Management System</title>
    <style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.85)), 
                    url('https://moeindia.com/wp-content/uploads/2024/12/What-is-Event-Management.webp') no-repeat center center fixed;
        background-size: cover;
        color: #ffffff;
    }

    .navbar {
        background-color: rgba(20, 20, 20, 0.8) !important;
        backdrop-filter: blur(8px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
    }

    .navbar-brand, .nav-link {
        color: #ffffff !important;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        color: #00ffe7 !important;
        text-shadow: 0 0 10px #00ffe7;
    }

    .hero {
        text-align: center;
        padding: 100px 20px 60px;
        background: rgba(0, 0, 0, 0.5);
        border-radius: 20px;
        margin-top: 40px;
        box-shadow: 0 0 25px rgba(0, 0, 0, 0.4);
        backdrop-filter: blur(5px);
    }

    .hero h1 {
        font-size: 3rem;
        font-weight: 700;
        color: #00ffe7;
        text-shadow: 0 0 12px #00ffe7;
        margin-bottom: 20px;
    }

    .hero p {
        font-size: 1.1rem;
        max-width: 800px;
        margin: 0 auto;
        color: #e0e0e0;
        line-height: 1.8;
    }

    .card {
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.2);
        border-radius: 18px;
        backdrop-filter: blur(12px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
        color: #fff;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-10px) scale(1.02);
        box-shadow: 0 12px 32px rgba(0, 255, 231, 0.5);
    }

    .card-title {
        font-size: 1.3rem;
        font-weight: bold;
        color: #00ffe7;
        margin-bottom: 10px;
    }

    .card-text {
        font-size: 0.95rem;
        color: #dcdcdc;
    }

    .btn-primary {
        background: linear-gradient(135deg, #00ffe7, #4facfe);
        border: none;
        font-weight: 600;
        border-radius: 30px;
        padding: 10px 20px;
        color: #000;
        box-shadow: 0 0 15px #00ffe7;
        transition: all 0.4s ease;
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #4facfe, #00ffe7);
        box-shadow: 0 0 25px #4facfe;
        transform: scale(1.05);
    }

    .row > .col-md-3 {
        margin-bottom: 30px;
    }

    @media (max-width: 768px) {
        .hero h1 {
            font-size: 2rem;
        }
        .hero p {
            font-size: 1rem;
        }
    }
</style>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTOH3aev8bQ8X7FWx5LEi8kkcnruLjrkxQkA&s" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
            EMS
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="welcome.jsp">Events</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="hero">
        <h1>Welcome to Event Management System</h1>
        <p>Efficiently organize and manage your events. Create, Update,Cancel, and track all your event activities with ease.</p>
    </div>

    <div class="row mt-5">
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Register Event</h5>
                    <p class="card-text">new events with detailed information and scheduling.</p>
                    <a href="addevent.jsp" class="btn btn-primary">Register</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">View Events</h5>
                    <p class="card-text">Browse all scheduled events and their details.</p>
                    <a href="welcome.jsp" class="btn btn-primary">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Update Events</h5>
                    <p class="card-text">Modify existing event details and schedules.</p>
                    <a href="update.jsp" class="btn btn-primary">Update</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Cancel Event</h5>
                    <p class="card-text">Remove or cancel events that are no longer needed</p>
                    <a href="delete.jsp" class="btn btn-primary">Cancel</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
