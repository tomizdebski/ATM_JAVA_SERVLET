<%@ page import="pl.bankomat.model.UserAccount" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Strona główna - ATM</title>
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

      /* Główna ramka ATM */
      .atm-frame {
        background: #f8f8f8;
        border: 10px groove #999;       /* imitacja ramki bankomatu */
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

      /* Kontener z Twoim dotychczasowym widokiem */
      .home-container {
        background: #fff;
        padding: 2rem;
        width: 100%;
        max-width: 400px;  /* dopasowane do szerokości ekranu ATM */
        text-align: center;
      }

      .home-container h2 {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        text-align: center;
      }

      .balance-info {
        margin-bottom: 1.5rem;
        font-size: 1.1rem;
      }

      .balance-info span {
        font-weight: bold;
      }

      .home-buttons {
        display: flex;
        flex-direction: row;
        gap: 0.5rem;
        justify-content: center;
      }

      .home-buttons a,
      .home-buttons form button {
        background: #3498db;
        color: #fff;
        font-weight: 600;
        border: none;
        padding: 0.6rem 1rem;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        text-align: center;
        transition: background 0.3s ease;
      }
      .home-buttons a:hover,
      .home-buttons form button:hover {
        background: #2c80b9;
      }
    </style>
</head>
<body>
<%
    // Sprawdzamy, czy użytkownik jest zalogowany
    UserAccount user = (UserAccount) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
    <!-- Ramka główna imitująca obudowę bankomatu -->
    <div class="atm-frame">
        <!-- Górny pasek bankomatu (np. nazwa, logo) -->
        <div class="atm-header">
            Bankomat Ekran Główny
        </div>
        
        <!-- Wewnętrzny ekran -->
        <div class="atm-screen">
            <div class="home-container">
                <h2>Witaj, <%= user.getLogin() %>!</h2>
                <div class="balance-info">
                    Stan Twojego konta: <span><%= user.getBalance() %></span> PLN
                </div>

                <div class="home-buttons">
                    <!-- Link do wpłaty -->
                    <a href="deposit.jsp">Wpłata</a>
                    <!-- Link do wypłaty -->
                    <a href="withdraw.jsp">Wypłata</a>

                    <!-- Wylogowanie (przycisk) -->
                    <form action="BankomatServlet" method="post">
                        <input type="hidden" name="action" value="logout"/>
                        <button>Wyloguj</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
