<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Wynik operacji - ATM</title>
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

      /* Główna ramka bankomatu (obudowa) */
      .atm-frame {
        background: #f8f8f8;
        border: 10px groove #999;  /* imitacja obudowy bankomatu */
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
        border-radius: 15px 15px 0 0;
        font-weight: bold;
        font-size: 1.2rem;
      }

      /* Ekran wewnątrz bankomatu */
      .atm-screen {
        flex: 1;
        background: #fff;
        margin: 1rem;
        border-radius: 10px;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      /* Kontener z wynikiem operacji – Twój dotychczasowy .result-container */
      .result-container {
        background: #fff;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        width: 100%;
        max-width: 400px;
        text-align: center;
      }
      .result-container h2 {
        font-size: 1.5rem;
        margin-bottom: 1rem;
      }
      .result-message {
        margin-bottom: 1.5rem;
        color: #333;
      }
      .back-link a {
        display: inline-block;
        background: #3498db;
        color: #fff;
        font-weight: 600;
        border: none;
        padding: 0.6rem 1rem;
        border-radius: 4px;
        text-decoration: none;
        transition: background 0.3s ease;
      }
      .back-link a:hover {
        background: #2c80b9;
      }
    </style>
</head>
<body>
    <!-- Ramka bankomatu -->
    <div class="atm-frame">
        <!-- Pasek górny -->
        <div class="atm-header">
            Bankomat - Wynik operacji
        </div>
        <!-- Ekran wewnętrzny -->
        <div class="atm-screen">
            <div class="result-container">
                <h2>Informacja</h2>
                <p class="result-message">${msg}</p>
                <p class="back-link">
                    <a href="home.jsp">Powrót do strony głównej</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
