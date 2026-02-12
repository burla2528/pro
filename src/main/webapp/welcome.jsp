<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful | KartikeyaSoft</title>
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

        /* Welcome Card */
        .welcome-container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 50px 45px;
            width: 480px;
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
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
            box-shadow: 0 8px 25px rgba(67, 233, 123, 0.35);
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
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Celebration Icon */
        .celebrate-icon {
            width: 100px; height: 100px;
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            border-radius: 50%;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 30px rgba(67, 233, 123, 0.35);
            animation: bounce 2s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50%      { transform: translateY(-10px); }
        }

        .celebrate-icon i {
            font-size: 46px;
            color: #fff;
        }

        .welcome-container h2 {
            color: #fff;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .welcome-container .message {
            color: rgba(255,255,255,0.55);
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 15px;
        }

        /* Steps */
        .steps {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: 25px 0 30px;
        }

        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
        }

        .step .step-num {
            width: 40px; height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 16px;
        }

        .step:nth-child(1) .step-num {
            background: rgba(67, 233, 123, 0.2);
            color: #43e97b;
            border: 2px solid #43e97b;
        }

        .step:nth-child(2) .step-num {
            background: rgba(67, 233, 123, 0.2);
            color: #43e97b;
            border: 2px solid #43e97b;
        }

        .step:nth-child(3) .step-num {
            background: rgba(102, 126, 234, 0.15);
            color: #667eea;
            border: 2px dashed rgba(102, 126, 234, 0.4);
        }

        .step .step-label {
            color: rgba(255,255,255,0.45);
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .step:nth-child(1) .step-label,
        .step:nth-child(2) .step-label {
            color: rgba(67, 233, 123, 0.7);
        }

        /* Divider */
        .divider {
            display: flex;
            align-items: center;
            margin: 5px 0 25px;
            gap: 12px;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(255,255,255,0.1);
        }

        .divider span {
            color: rgba(255,255,255,0.3);
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
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

        /* Confetti animation */
        .confetti {
            position: fixed;
            top: -10px;
            z-index: 0;
            width: 10px; height: 10px;
            border-radius: 2px;
            animation: confettiFall linear infinite;
        }

        @keyframes confettiFall {
            0%   { transform: translateY(-10px) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(720deg); opacity: 0; }
        }

        @media (max-width: 500px) {
            .welcome-container { width: 94%; padding: 35px 20px; }
            .steps { gap: 18px; }
        }
    </style>
</head>
<body>

    <!-- Animated Background -->
    <ul class="bg-circles">
        <li></li><li></li><li></li><li></li><li></li>
        <li></li><li></li><li></li><li></li><li></li>
    </ul>

    <!-- Confetti Pieces -->
    <div class="confetti" style="left:10%; background:#667eea; animation-duration:3s; animation-delay:0s; width:8px; height:8px;"></div>
    <div class="confetti" style="left:20%; background:#43e97b; animation-duration:4s; animation-delay:0.5s; width:6px; height:12px;"></div>
    <div class="confetti" style="left:30%; background:#ffa502; animation-duration:3.5s; animation-delay:1s; width:10px; height:6px;"></div>
    <div class="confetti" style="left:40%; background:#ff6b6b; animation-duration:4.5s; animation-delay:0.2s; width:7px; height:7px;"></div>
    <div class="confetti" style="left:55%; background:#a78bfa; animation-duration:3.2s; animation-delay:0.8s; width:9px; height:5px;"></div>
    <div class="confetti" style="left:65%; background:#38f9d7; animation-duration:4s; animation-delay:1.2s; width:6px; height:10px;"></div>
    <div class="confetti" style="left:75%; background:#ff6b6b; animation-duration:3.8s; animation-delay:0.3s; width:8px; height:8px;"></div>
    <div class="confetti" style="left:85%; background:#667eea; animation-duration:3.5s; animation-delay:0.7s; width:5px; height:11px;"></div>
    <div class="confetti" style="left:50%; background:#ffa502; animation-duration:4.2s; animation-delay:1.5s; width:10px; height:6px;"></div>
    <div class="confetti" style="left:90%; background:#43e97b; animation-duration:3s; animation-delay:0.4s; width:7px; height:9px;"></div>

    <!-- Welcome Card -->
    <div class="welcome-container">

        <!-- Logo -->
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-code"></i>
            </div>
            <h1><span>Kartikeya</span>Soft</h1>
        </div>

        <!-- Celebration Icon -->
        <div class="celebrate-icon">
            <i class="fas fa-party-horn fa-trophy"></i>
        </div>

        <h2>Registration Successful! 🎉</h2>
        <p class="message">
            Your account has been created successfully.<br>
            You're just one step away from getting started!
        </p>

        <!-- Progress Steps -->
        <div class="steps">
            <div class="step">
                <div class="step-num"><i class="fas fa-check" style="font-size:14px;"></i></div>
                <span class="step-label">Register</span>
            </div>
            <div class="step">
                <div class="step-num"><i class="fas fa-check" style="font-size:14px;"></i></div>
                <span class="step-label">Verified</span>
            </div>
            <div class="step">
                <div class="step-num">3</div>
                <span class="step-label">Login</span>
            </div>
        </div>

        <div class="divider">
            <span>continue</span>
        </div>

        <!-- Login Button -->
        <a href="index.jsp" class="btn-login">
            <i class="fas fa-sign-in-alt"></i> Login Now
        </a>

        <p class="footer-text">&copy; 2025 KartikeyaSoft. All rights reserved.</p>
    </div>

</body>
</html>

