<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | KartikeyaSoft</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            overflow: hidden;
        }

        /* Animated background circles */
        .bg-circles {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            overflow: hidden;
            z-index: 0;
        }

        .bg-circles li {
            position: absolute;
            list-style: none;
            width: 20px; height: 20px;
            background: rgba(255, 255, 255, 0.06);
            border-radius: 50%;
            animation: floatUp 25s infinite;
            bottom: -150px;
        }

        .bg-circles li:nth-child(1)  { left: 10%;  width: 80px;  height: 80px;  animation-delay: 0s;    animation-duration: 20s; }
        .bg-circles li:nth-child(2)  { left: 20%;  width: 20px;  height: 20px;  animation-delay: 2s;    animation-duration: 25s; }
        .bg-circles li:nth-child(3)  { left: 35%;  width: 60px;  height: 60px;  animation-delay: 4s;    animation-duration: 22s; }
        .bg-circles li:nth-child(4)  { left: 50%;  width: 40px;  height: 40px;  animation-delay: 0s;    animation-duration: 18s; }
        .bg-circles li:nth-child(5)  { left: 65%;  width: 25px;  height: 25px;  animation-delay: 3s;    animation-duration: 30s; }
        .bg-circles li:nth-child(6)  { left: 75%;  width: 90px;  height: 90px;  animation-delay: 5s;    animation-duration: 20s; }
        .bg-circles li:nth-child(7)  { left: 85%;  width: 50px;  height: 50px;  animation-delay: 7s;    animation-duration: 28s; }
        .bg-circles li:nth-child(8)  { left: 45%;  width: 35px;  height: 35px;  animation-delay: 10s;   animation-duration: 35s; }
        .bg-circles li:nth-child(9)  { left: 5%;   width: 15px;  height: 15px;  animation-delay: 1s;    animation-duration: 15s; }
        .bg-circles li:nth-child(10) { left: 90%;  width: 70px;  height: 70px;  animation-delay: 8s;    animation-duration: 22s; }

        @keyframes floatUp {
            0%   { transform: translateY(0) rotate(0deg);   opacity: 1; }
            100% { transform: translateY(-1200px) rotate(720deg); opacity: 0; }
        }

        /* Success Card */
        .success-container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 50px 45px;
            width: 500px;
            text-align: center;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5);
            animation: slideIn 0.6s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(40px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* Logo */
        .logo {
            margin-bottom: 25px;
        }

        .logo .logo-icon {
            width: 55px; height: 55px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.35);
        }

        .logo .logo-icon i {
            font-size: 26px;
            color: #fff;
        }

        .logo h1 {
            color: #fff;
            font-size: 22px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .logo h1 span {
            background: linear-gradient(135deg, #667eea, #a78bfa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Success Icon */
        .success-icon {
            width: 90px; height: 90px;
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            border-radius: 50%;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 30px rgba(67, 233, 123, 0.35);
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { box-shadow: 0 10px 30px rgba(67, 233, 123, 0.35); }
            50%      { box-shadow: 0 10px 50px rgba(67, 233, 123, 0.55); }
        }

        .success-icon i {
            font-size: 42px;
            color: #fff;
        }

        .success-container h2 {
            color: #fff;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .success-container .greeting {
            color: rgba(255,255,255,0.55);
            font-size: 15px;
            margin-bottom: 10px;
        }

        .success-container .username-badge {
            display: inline-block;
            background: rgba(102, 126, 234, 0.15);
            border: 1px solid rgba(102, 126, 234, 0.3);
            color: #a78bfa;
            padding: 6px 20px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .username-badge i {
            margin-right: 6px;
        }

        /* Info Cards */
        .info-row {
            display: flex;
            gap: 12px;
            margin-bottom: 28px;
        }

        .info-card {
            flex: 1;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 14px;
            padding: 18px 12px;
            transition: all 0.3s;
        }

        .info-card:hover {
            background: rgba(255,255,255,0.08);
            transform: translateY(-2px);
        }

        .info-card i {
            font-size: 22px;
            margin-bottom: 8px;
        }

        .info-card:nth-child(1) i { color: #667eea; }
        .info-card:nth-child(2) i { color: #43e97b; }
        .info-card:nth-child(3) i { color: #ffa502; }

        .info-card .card-label {
            color: rgba(255,255,255,0.4);
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .info-card .card-value {
            color: #fff;
            font-size: 14px;
            font-weight: 500;
        }

        /* Logout Button */
        .btn-logout {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 14px 35px;
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            border: none;
            border-radius: 14px;
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(238, 90, 36, 0.3);
        }

        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(238, 90, 36, 0.5);
        }

        .btn-logout:active {
            transform: translateY(0);
        }

        /* Footer */
        .footer-text {
            margin-top: 25px;
            color: rgba(255,255,255,0.25);
            font-size: 12px;
        }

        @media (max-width: 520px) {
            .success-container { width: 94%; padding: 35px 20px; }
            .info-row { flex-direction: column; }
        }
    </style>
</head>
<body>

    <!-- Animated Background -->
    <ul class="bg-circles">
        <li></li><li></li><li></li><li></li><li></li>
        <li></li><li></li><li></li><li></li><li></li>
    </ul>

    <!-- Success Card -->
    <div class="success-container">

        <!-- Logo -->
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-code"></i>
            </div>
            <h1><span>Kartikeya</span>Soft</h1>
        </div>

        <!-- Success Icon -->
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>

        <h2>Welcome Back!</h2>
        <p class="greeting">You have successfully logged in</p>

        <div class="username-badge">
            <i class="fas fa-user-circle"></i> <%= userName %>
        </div>

        <!-- Info Cards -->
        <div class="info-row">
            <div class="info-card">
                <i class="fas fa-shield-halved"></i>
                <div class="card-label">Status</div>
                <div class="card-value">Active</div>
            </div>
            <div class="info-card">
                <i class="fas fa-clock"></i>
                <div class="card-label">Session</div>
                <div class="card-value">Online</div>
            </div>
            <div class="info-card">
                <i class="fas fa-star"></i>
                <div class="card-label">Role</div>
                <div class="card-value">Member</div>
            </div>
        </div>

        <!-- Logout -->
        <a href="logout.jsp" class="btn-logout">
            <i class="fas fa-right-from-bracket"></i> Logout
        </a>

        <p class="footer-text">&copy; 2025 KartikeyaSoft. All rights reserved.</p>
    </div>

</body>
</html>

