<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="bootstrap.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Event</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.9)),
                        url('https://www.avg.com/hs-fs/hubfs/Blog_Content/Avg/Signal/AVG%20Signal%20Images/how_to_deactivate_your_facebook_account_signal/Signal-How-to-Deactivate-or-Delete-Your-Facebook-Account-Hero.jpg?width=1200&name=Signal-How-to-Deactivate-or-Delete-Your-Facebook-Account-Hero.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        .card {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.15);
            color: #fff;
            box-shadow: 0 10px 25px rgba(0,0,0,0.5);
            border-radius: 15px;
            animation: fadeIn 0.8s ease-in-out;
        }

        .form-control {
            background-color: rgba(255,255,255,0.1);
            color: #fff;
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 10px;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .form-control:focus {
            background-color: rgba(255,255,255,0.15);
            box-shadow: 0 0 10px #ff4444;
            border-color: #ff4444;
        }

        .btn-danger {
            background: linear-gradient(135deg, #ff4444, #ff0000);
            border: none;
            border-radius: 30px;
            font-weight: bold;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
            transition: all 0.3s ease-in-out;
        }

        .btn-danger:hover {
            background: linear-gradient(135deg, #ff0000, #ff4444);
            transform: scale(1.03);
            box-shadow: 0 0 15px #ff4444;
        }

        .btn-secondary {
            border-radius: 30px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #888;
        }

        .card-header h4 {
            color: #fff;
            text-shadow: 0 0 5px #ff4444;
        }

        @keyframes fadeIn {
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

    <script>
        function confirmDeletion(event) {
            event.preventDefault();

            const form = event.target;

            Swal.fire({
                title: 'Are you sure?',
                text: "⚠️ This action cannot be undone!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                } else {
                    Swal.fire('Cancelled', 'Your event is safe 😊', 'info');
                }
            });
        }

        // Show success or error alert based on status
        window.onload = function () {
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');

            if (status === 'success') {
                Swal.fire('Deleted!', 'The event has been successfully deleted.', 'success');
            } else if (status === 'failed') {
                Swal.fire('Error!', 'Failed to delete the event. Please try again.', 'error');
            }
        };
    </script>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg">
                <div class="card-header bg-danger text-white text-center py-3">
                    <h4>Delete Event</h4>
                </div>
                <div class="card-body">
                    <form action="delete" method="post" onsubmit="confirmDeletion(event);">
                        <div class="form-group mb-4">
                            <label for="eventid" class="form-label">Enter Event ID to delete</label>
                            <input type="text" id="eventid" name="eventid" class="form-control" placeholder="e.g., EVT123" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-danger btn-block">Delete Event</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="text-center mt-3">
                <a href="home.jsp" class="btn btn-secondary px-4">⬅ Back to Home</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
