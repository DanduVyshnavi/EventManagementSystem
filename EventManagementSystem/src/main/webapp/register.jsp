<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="bootstrap.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.55)),
                        url('https://img.freepik.com/premium-vector/modern-login-screen-ui-design-with-rounded-vector-box-web-page-login-form-gradient-background_1326094-1064.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        .register-card {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 18px;
            backdrop-filter: blur(14px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
            animation: fadeInUp 0.9s ease;
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

        .form-group {
            position: relative;
            margin-bottom: 1.8rem;
        }

        .form-control {
            background: transparent;
            border: none;
            border-bottom: 2px solid rgba(255, 255, 255, 0.3);
            color: #fff;
            padding-left: 2.5rem;
            transition: 0.3s ease;
        }

        .form-control:focus {
            border-color: #00ffe7;
            background-color: transparent;
            box-shadow: 0 2px 10px rgba(0, 255, 231, 0.3);
        }

        .form-control::placeholder {
            color: transparent;
        }

        .form-label {
            position: absolute;
            top: 12px;
            left: 2.5rem;
            color: #ccc;
            pointer-events: none;
            transition: 0.2s ease;
        }

        .form-control:focus + .form-label,
        .form-control:not(:placeholder-shown) + .form-label {
            top: -10px;
            left: 2.3rem;
            font-size: 0.8rem;
            color: #00ffe7;
        }

        .input-icon {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #ccc;
        }

        .btn-primary {
            background: linear-gradient(135deg, #00ffe7, #4facfe);
            border: none;
            font-weight: 600;
            border-radius: 30px;
            padding: 10px 20px;
            color: #000;
            box-shadow: 0 0 12px #00ffe7;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            transform: scale(1.03);
            box-shadow: 0 0 25px #4facfe;
        }

        @media (max-width: 768px) {
            .register-card {
                width: 100% !important;
            }
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="register-card">
        <h2 class="text-center mb-4 text-primary">Register</h2>
        <form action="register" method="POST" autocomplete="off">

            <!-- Email -->
            <div class="form-group">
                <i class="bi bi-envelope input-icon"></i>
                <input type="email" id="email" name="email" class="form-control" placeholder=" " required>
                <label for="email" class="form-label">Email</label>
            </div>

            <!-- Password -->
            <div class="form-group">
                <i class="bi bi-lock input-icon"></i>
                <input type="password" id="password" name="password" class="form-control" placeholder=" " required>
                <label for="password" class="form-label">Password</label>
            </div>

            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
    </div>
</div>

</body>
</html>
