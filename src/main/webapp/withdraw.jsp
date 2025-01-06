<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Wypłata - ATM</title>
    <style>
      /* Reset i styl ogólny */
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

      /* Wewnątrz ekranu – Twój dotychczasowy kontener do wypłaty */
      .withdraw-container {
        background: #fff;
        padding: 2rem;
        border-radius: 8px;
        width: 100%;
        max-width: 360px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      }

      .withdraw-container h2 {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        text-align: center;
      }

      .withdraw-form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
      }

      .withdraw-form label {
        font-weight: bold;
      }

      .withdraw-form input[type="number"] {
        width: 100%;
        padding: 0.5rem;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      .withdraw-form button {
        background: #e67e22;
        color: #fff;
        font-weight: 600;
        border: none;
        padding: 0.6rem 1rem;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s ease;
      }

      .withdraw-form button:hover {
        background: #cf6d17;
      }

      .back-link {
        margin-top: 1rem;
        text-align: center;
      }

      .back-link a {
        color: #3498db;
        text-decoration: none;
        font-weight: 600;
      }
    </style>
</head>
<body>
    <!-- Ramka bankomatu -->
    <div class="atm-frame">
        <!-- Pasek górny -->
        <div class="atm-header">
            Bankomat - Wypłata
        </div>
        <!-- Ekran wewnętrzny -->
        <div class="atm-screen">
            <div class="withdraw-container">
                <h2>Wypłata gotówki</h2>
                <form class="withdraw-form" action="BankomatServlet" method="post">
                    <input type="hidden" name="action" value="withdraw"/>
                    <div>
                        <label for="amount">Kwota do wypłaty (PLN):</label>
                        <input type="number" name="amount" id="amount" min="20" step="20"/>
                    </div>
                    <button type="submit">Wypłać</button>
                </form>
                <p class="back-link">
                    <a href="home.jsp">Powrót do strony głównej</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>

