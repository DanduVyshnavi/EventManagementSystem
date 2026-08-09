<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="bootstrap.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Event Management</title>

    <!-- Bootstrap CSS & Icons -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.40)),
                        url('https://img.freepik.com/free-vector/cyber-data-security-online-concept-illustration-internet-security-information-privacy-protection_1150-37328.jpg?semt=ais_hybrid&w=740') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 18px;
            backdrop-filter: blur(14px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
            padding: 2rem;
            width: 100%;
            max-width: 380px;
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
            margin-bottom: 1.5rem;
        }

        .form-control {
            background: transparent;
            border: none;
            border-bottom: 2px solid rgba(255, 255, 255, 0.3);
            color: #fff;
            padding-left: 2.5rem;
            transition: all 0.3s ease;
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
            font-size: 1rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #00ffe7, #4facfe);
            border: none;
            font-weight: 600;
            border-radius: 30px;
            padding: 10px 20px;
            color: #000;
            box-shadow: 0 0 12px #00ffe7;
            position: relative;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            transform: scale(1.03);
            box-shadow: 0 0 25px #4facfe;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #aaa;
        }

        a.text-primary:hover {
            text-decoration: underline;
        }
    </style>

    <script>
        function togglePassword() {
            const pwd = document.getElementById("password");
            const toggle = document.getElementById("toggleIcon");
            if (pwd.type === "password") {
                pwd.type = "text";
                toggle.classList.remove("bi-eye-slash");
                toggle.classList.add("bi-eye");
            } else {
                pwd.type = "password";
                toggle.classList.remove("bi-eye");
                toggle.classList.add("bi-eye-slash");
            }
        }
    </script>
</head>

<body>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="login-card">
        <h2 class="text-center mb-4 text-primary">Login</h2>
        <form action="login" method="POST" autocomplete="off">

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
                <i class="bi bi-eye-slash toggle-password" id="toggleIcon" onclick="togglePassword()"></i>
            </div>

            <!-- Remember + Forgot -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">Remember me</label>
                </div>
                <a href="#" class="text-primary">Forgot password?</a>
            </div>

            <!-- Submit -->
            <button type="submit" class="btn btn-primary btn-block w-100">
                <span>Log In</span>
            </button>

            <!-- Register -->
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="register.jsp" class="text-primary">Register</a></p>
            </div>
        </form>
    </div>
</div>

</body>
</html>
