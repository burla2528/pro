<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | MyApp</title>
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

        /* Login Card */
        .login-container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 50px 40px;
            width: 420px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5);
            animation: slideIn 0.6s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(40px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .login-container .avatar {
            width: 80px; height: 80px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .avatar i {
            font-size: 36px;
            color: #fff;
        }

        .login-container h2 {
            text-align: center;
            color: #fff;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 26px;
        }

        .login-container .subtitle {
            text-align: center;
            color: rgba(255,255,255,0.5);
            font-size: 14px;
            margin-bottom: 35px;
        }

        .input-group {
            position: relative;
            margin-bottom: 22px;
        }

        .input-group i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255,255,255,0.4);
            font-size: 16px;
            transition: color 0.3s;
        }

        .input-group input {
            width: 100%;
            padding: 15px 20px 15px 48px;
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px;
            color: #fff;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
            outline: none;
            transition: all 0.3s ease;
        }

        .input-group input::placeholder {
            color: rgba(255,255,255,0.35);
        }

        .input-group input:focus {
            border-color: #667eea;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.15);
        }

        .input-group input:focus + i,
        .input-group input:focus ~ i {
            color: #667eea;
        }

        .options-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .options-row label {
            color: rgba(255,255,255,0.5);
            font-size: 13px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .options-row label input[type="checkbox"] {
            accent-color: #667eea;
        }

        .options-row a {
            color: #667eea;
            font-size: 13px;
            text-decoration: none;
            transition: color 0.3s;
        }

        .options-row a:hover {
            color: #a78bfa;
        }

        .btn-login {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            border-radius: 14px;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
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

        .register-link {
            text-align: center;
            margin-top: 28px;
            color: rgba(255,255,255,0.45);
            font-size: 14px;
        }

        .register-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .register-link a:hover {
            color: #a78bfa;
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .login-container {
                width: 92%;
                padding: 35px 25px;
            }
        }
    </style>
</head>
<body>

    <!-- Animated Background -->
    <ul class="bg-circles">
        <li></li><li></li><li></li><li></li><li></li>
        <li></li><li></li><li></li><li></li><li></li>
    </ul>

    <!-- Login Card -->
    <div class="login-container">
        <div class="avatar">
            <i class="fas fa-user-lock"></i>
        </div>
        <h2>Welcome Back</h2>
        <p class="subtitle">Sign in to continue to your account</p>

        <form method="post" action="login.jsp">
            <div class="input-group">
                <input type="text" name="userName" placeholder="Username" required />
                <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
                <input type="password" name="password" placeholder="Password" required />
                <i class="fas fa-lock"></i>
            </div>

            <div class="options-row">
                <label>
                    <input type="checkbox" /> Remember me
                </label>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="btn-login">
                <i class="fas fa-sign-in-alt"></i>&nbsp; Login
            </button>
        </form>

        <p class="register-link">
            Don't have an account? <a href="register.jsp">Register Here</a>
        </p>
    </div>

</body>
</html>

