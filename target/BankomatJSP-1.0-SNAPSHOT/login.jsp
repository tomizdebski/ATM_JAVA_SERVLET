<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logowanie</title>
    <!-- Wewnętrzny CSS -->
    <style>
      /* Wyzerowanie marginesów i paddingu */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: Arial, sans-serif;
        background: #f0f0f2;
        color: #333;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .login-container {
        background: #fff;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        width: 360px;  /* szerokość kontenera */
        max-width: 90%;
      }

      .login-container h1 {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        text-align: center;
      }

      .login-form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
      }

      .login-form label {
        margin-bottom: 0.3rem;
        font-weight: bold;
      }

      /* Ustawiamy width: 100%, by input wypełniał całą możliwą szerokość */
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
        text-align: center;
      }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Logowanie</h1>
        <form class="login-form" action="BankomatServlet" method="post">
            <input type="hidden" name="action" value="login"/>
            <div>
                <label for="login">Login</label>
                <input type="text" name="login" id="login"/>
            </div>
            <div>
                <label for="password">Hasło</label>
                <input type="password" name="password" id="password"/>
            </div>
            <button type="submit">Zaloguj</button>
        </form>
        <!-- Komunikat o błędzie/wyniku -->
        <p class="error-message">${msg}</p>
    </div>
</body>
</html>

