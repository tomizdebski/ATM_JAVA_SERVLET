<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logowanie - ATM</title>
    <meta charset="UTF-8">
    <style>
      /* RESET i styl ogólny */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #dce2e6, #f2f2f2);
        color: #333;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      /* Główna ramka ATM (obudowa) */
      .atm-frame {
        background: #f8f8f8;
        border: 10px groove #999;   /* imitacja obudowy bankomatu */
        border-radius: 25px;
        width: 480px;
        height: 620px;
        display: flex;
        flex-direction: column;
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      }

      /* Pasek ATM (góra) */
      .atm-header {
        background: #4a5055;
        color: #fff;
        padding: 1rem;
        text-align: center;
        border-radius: 15px 15px 0 0; /* zaokrąglenie górnych rogów */
        font-weight: bold;
        font-size: 1.2rem;
      }

      /* Ekran wewnątrz bankomatu */
      .atm-screen {
        flex: 1; /* wypełnia resztę miejsca */
        background: #fff;
        margin: 1rem;
        border-radius: 10px;
        overflow: hidden; /* by zawartość ładnie się mieściła */
        display: flex;
        align-items: center;
        justify-content: center;
      }

      /* Kontener logowania */
      .login-container {
        background: #fff;
        padding: 2rem;
        width: 100%;
        max-width: 360px;
        text-align: center;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        border-radius: 8px;
      }

      .login-container h1 {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
      }

      .login-form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
      }

      .login-form label {
        margin-bottom: 0.3rem;
        font-weight: bold;
        text-align: left; /* odrobinę estetyki przy polu tekstowym */
      }

      .login-form input[type="text"],
      .login-form input[type="password"] {
        width: 100%;
        padding: 0.5rem;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      .login-form button {
        background: #3498db;
        color: #fff;
        font-weight: 600;
        border: none;
        padding: 0.6rem 1rem;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s ease;
      }

      .login-form button:hover {
        background: #2c80b9;
      }

      .error-message {
        color: #e74c3c;
        margin-top: 1rem;
      }
    </style>
</head>
<body>
    <!-- Ramka główna bankomatu -->
    <div class="atm-frame">
        <!-- Pasek u góry (np. z nazwą banku) -->
        <div class="atm-header">Bankomat - Logowanie</div>
        
        <!-- Wewnętrzny ekran -->
        <div class="atm-screen">
            <div class="login-container">
                <h1>Logowanie</h1>
                <form class="login-form" action="BankomatServlet" method="post">
                    <input type="hidden" name="action" value="login"/>
                    
                    <div>
                        <label for="login">Login</label>
                        <input type="text" name="login" id="login" required/>
                    </div>
                    <div>
                        <label for="password">Hasło</label>
                        <input type="password" name="password" id="password" required/>
                    </div>
                    <button type="submit">Zaloguj</button>
                </form>
                <!-- Komunikat o błędzie/wyniku -->
                <p class="error-message">${msg}</p>
            </div>
        </div>
    </div>
</body>
</html>
