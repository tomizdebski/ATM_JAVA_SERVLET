<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Wypłata</title>
    <style>
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
      .withdraw-container {
        background: #fff;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        width: 360px;
        max-width: 90%;
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
        display: block;
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
</body>
</html>
