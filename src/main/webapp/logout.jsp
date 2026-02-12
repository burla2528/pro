<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("userName", null);
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out | KartikeyaSoft</title>
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

        /* Logout Card */
        .logout-container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 50px 45px;
            width: 440px;
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
            margin-bottom: 30px;
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

        /* Logout Icon */
        .logout-icon {
            width: 90px; height: 90px;
            background: linear-gradient(135deg, #74b9ff, #0984e3);
            border-radius: 50%;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 30px rgba(9, 132, 227, 0.35);
            animation: wave 3s ease-in-out infinite;
        }

        @keyframes wave {
            0%, 100% { transform: rotate(0deg); }
            25%      { transform: rotate(15deg); }
            75%      { transform: rotate(-15deg); }
        }

        .logout-icon i {
            font-size: 40px;
            color: #fff;
        }

        .logout-container h2 {
            color: #fff;
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .logout-container .message {
            color: rgba(255,255,255,0.5);
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        /* Countdown */
        .countdown {
            display: inline-block;
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 12px;
            padding: 12px 24px;
            margin-bottom: 25px;
        }

        .countdown .label {
            color: rgba(255,255,255,0.4);
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .countdown .timer {
            color: #74b9ff;
            font-size: 24px;
            font-weight: 700;
        }

        /* Login Button */
        .btn-login {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 15px 40px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            border-radius: 14px;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.35);
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.5);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .footer-text {
            margin-top: 28px;
            color: rgba(255,255,255,0.25);
            font-size: 12px;
        }

        @media (max-width: 480px) {
            .logout-container { width: 94%; padding: 35px 20px; }
        }
    </style>
</head>
<body>

    <!-- Animated Background -->
    <ul class="bg-circles">
        <li></li><li></li><li></li><li></li><li></li>
        <li></li><li></li><li></li><li></li><li></li>
    </ul>

    <!-- Logout Card -->
    <div class="logout-container">

        <!-- Logo -->
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-code"></i>
            </div>
            <h1><span>Kartikeya</span>Soft</h1>
        </div>

        <!-- Logout Wave Icon -->
        <div class="logout-icon">
            <i class="fas fa-hand-wave fa-hand"></i>
        </div>

        <h2>See You Soon! 👋</h2>
        <p class="message">
            You have been successfully logged out.<br>
            Your session has been securely terminated.
        </p>

        <!-- Auto-redirect Countdown -->
        <div class="countdown">
            <div class="label">Redirecting to login in</div>
            <div class="timer" id="countdown">10</div>
        </div>

        <br><br>

        <!-- Login Button -->
        <a href="index.jsp" class="btn-login">
            <i class="fas fa-sign-in-alt"></i> Login Again
        </a>

        <p class="footer-text">&copy; 2025 KartikeyaSoft. All rights reserved.</p>
    </div>

    <!-- Auto Redirect Script -->
    <script>
        let seconds = 10;
        const countdownEl = document.getElementById('countdown');

        const interval = setInterval(() => {
            seconds--;
            countdownEl.textContent = seconds;

            if (seconds <= 0) {
                clearInterval(interval);
                window.location.href = 'index.jsp';
            }
        }, 1000);
    </script>

</body>
</html>

