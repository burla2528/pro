<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | MyApp</title>
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

        /* Registration Card */
        .register-container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 45px 40px;
            width: 460px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5);
            animation: slideIn 0.6s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(40px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .register-container .avatar {
            width: 80px; height: 80px;
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 25px rgba(67, 233, 123, 0.35);
        }

        .avatar i {
            font-size: 36px;
            color: #fff;
        }

        .register-container h2 {
            text-align: center;
            color: #fff;
            font-weight: 600;
            margin-bottom: 6px;
            font-size: 26px;
        }

        .register-container .subtitle {
            text-align: center;
            color: rgba(255,255,255,0.5);
            font-size: 14px;
            margin-bottom: 30px;
        }

        /* Two-column row */
        .input-row {
            display: flex;
            gap: 14px;
        }

        .input-row .input-group {
            flex: 1;
        }

        .input-group {
            position: relative;
            margin-bottom: 18px;
        }

        .input-group i.field-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255,255,255,0.4);
            font-size: 15px;
            transition: color 0.3s;
            pointer-events: none;
        }

        .input-group input {
            width: 100%;
            padding: 14px 18px 14px 46px;
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px;
            color: #fff;
            font-size: 14px;
            font-family: 'Poppins', sans-serif;
            outline: none;
            transition: all 0.3s ease;
        }

        .input-group input::placeholder {
            color: rgba(255,255,255,0.35);
        }

        .input-group input:focus {
            border-color: #43e97b;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 20px rgba(67, 233, 123, 0.12);
        }

        .input-group input:focus ~ i.field-icon {
            color: #43e97b;
        }

        /* Password strength indicator */
        .password-wrapper {
            position: relative;
        }

        .password-wrapper .toggle-password {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255,255,255,0.35);
            cursor: pointer;
            font-size: 15px;
            transition: color 0.3s;
            z-index: 2;
        }

        .password-wrapper .toggle-password:hover {
            color: #43e97b;
        }

        .strength-bar {
            height: 4px;
            border-radius: 2px;
            background: rgba(255,255,255,0.08);
            margin-top: 8px;
            margin-bottom: 4px;
            overflow: hidden;
        }

        .strength-bar .bar-fill {
            height: 100%;
            width: 0%;
            border-radius: 2px;
            transition: all 0.4s ease;
        }

        .strength-text {
            font-size: 11px;
            color: rgba(255,255,255,0.4);
            margin-bottom: 10px;
        }

        /* Buttons */
        .btn-row {
            display: flex;
            gap: 12px;
            margin-top: 8px;
        }

        .btn-register {
            flex: 1;
            padding: 14px;
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            border: none;
            border-radius: 14px;
            color: #0f0c29;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(67, 233, 123, 0.3);
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(67, 233, 123, 0.45);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        .btn-reset {
            padding: 14px 24px;
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 14px;
            color: rgba(255,255,255,0.6);
            font-size: 15px;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-reset:hover {
            background: rgba(255, 255, 255, 0.12);
            color: #fff;
        }

        /* Login link */
        .login-link {
            text-align: center;
            margin-top: 24px;
            color: rgba(255,255,255,0.45);
            font-size: 14px;
        }

        .login-link a {
            color: #43e97b;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: #38f9d7;
            text-decoration: underline;
        }

        /* Divider */
        .divider {
            display: flex;
            align-items: center;
            margin: 22px 0;
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

        /* Responsive */
        @media (max-width: 500px) {
            .register-container {
                width: 94%;
                padding: 30px 20px;
            }
            .input-row {
                flex-direction: column;
                gap: 0;
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

    <!-- Registration Card -->
    <div class="register-container">
        <div class="avatar">
            <i class="fas fa-user-plus"></i>
        </div>
        <h2>Create Account</h2>
        <p class="subtitle">Fill in your details to get started</p>

        <form method="post" action="userRegistration.jsp" id="registerForm">

            <!-- First Name & Last Name — Side by Side -->
            <div class="input-row">
                <div class="input-group">
                    <input type="text" name="firstName" placeholder="First Name" required />
                    <i class="fas fa-user field-icon"></i>
                </div>
                <div class="input-group">
                    <input type="text" name="lastName" placeholder="Last Name" required />
                    <i class="fas fa-user-tag field-icon"></i>
                </div>
            </div>

            <!-- Email -->
            <div class="input-group">
                <input type="email" name="email" placeholder="Email Address" required />
                <i class="fas fa-envelope field-icon"></i>
            </div>

            <!-- Username -->
            <div class="input-group">
                <input type="text" name="userName" placeholder="Choose a Username" required />
                <i class="fas fa-at field-icon"></i>
            </div>

            <!-- Password with toggle & strength meter -->
            <div class="input-group password-wrapper">
                <input type="password" name="password" id="password" placeholder="Create Password" required />
                <i class="fas fa-lock field-icon"></i>
                <i class="fas fa-eye toggle-password" id="togglePassword"></i>
            </div>
            <div class="strength-bar">
                <div class="bar-fill" id="strengthFill"></div>
            </div>
            <div class="strength-text" id="strengthText"></div>

            <div class="divider">
                <span>ready to join?</span>
            </div>

            <!-- Buttons -->
            <div class="btn-row">
                <button type="submit" class="btn-register">
                    <i class="fas fa-rocket"></i>&nbsp; Register
                </button>
                <button type="reset" class="btn-reset">
                    <i class="fas fa-redo"></i>&nbsp; Reset
                </button>
            </div>
        </form>

        <p class="login-link">
            Already have an account? <a href="index.jsp"><i class="fas fa-sign-in-alt"></i> Login Here</a>
        </p>
    </div>

    <!-- JavaScript: Password Toggle & Strength Meter -->
    <script>
        // Toggle password visibility
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');

        togglePassword.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });

        // Password strength meter
        passwordInput.addEventListener('input', function () {
            const val = this.value;
            const fill = document.getElementById('strengthFill');
            const text = document.getElementById('strengthText');
            let strength = 0;

            if (val.length >= 6)  strength++;
            if (val.length >= 10) strength++;
            if (/[A-Z]/.test(val)) strength++;
            if (/[0-9]/.test(val)) strength++;
            if (/[^A-Za-z0-9]/.test(val)) strength++;

            const levels = [
                { width: '0%',   color: 'transparent',  label: '' },
                { width: '20%',  color: '#ff4757',      label: 'Very Weak' },
                { width: '40%',  color: '#ff6b6b',      label: 'Weak' },
                { width: '60%',  color: '#ffa502',      label: 'Fair' },
                { width: '80%',  color: '#7bed9f',      label: 'Strong' },
                { width: '100%', color: '#2ed573',      label: 'Very Strong 💪' }
            ];

            fill.style.width = levels[strength].width;
            fill.style.background = levels[strength].color;
            text.textContent = levels[strength].label;
            text.style.color = levels[strength].color;
        });

        // Reset strength bar on form reset
        document.getElementById('registerForm').addEventListener('reset', function () {
            setTimeout(() => {
                document.getElementById('strengthFill').style.width = '0%';
                document.getElementById('strengthText').textContent = '';
            }, 10);
        });
    </script>

</body>
</html>

