<%@ page import="pl.bankomat.model.UserAccount" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Strona główna</title>
    <style>
      /* Reset i styl ogólny */
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

      .home-container {
        background: #fff;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        width: 400px;
        max-width: 90%;
      }

      .home-container h2 {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        text-align: center;
      }

      .balance-info {
        text-align: center;
        margin-bottom: 1.5rem;
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
        text-decoration: none; /* dla linków */
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
    <div class="home-container">
        <h2>Witaj, <%= user.getLogin() %>!</h2>
        <div class="balance-info">
            Stan Twojego konta: <span><%= user.getBalance() %></span> PLN
        </div>

        <div class="home-buttons">
            <!-- Link do wpłaty -->
            <a href="deposit.jsp">Wplata</a>
            <!-- Link do wypłaty -->
            <a href="withdraw.jsp">Wyplata</a>

            <!-- Wylogowanie (przycisk) -->
            <form action="BankomatServlet" method="post">
                <input type="hidden" name="action" value="logout"/>
                <button>Wyloguj</button>
            </form>
        </div>
    </div>
</body>
</html>
