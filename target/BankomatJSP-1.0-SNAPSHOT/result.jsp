<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Wynik operacji</title>
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
      .result-container {
        background: #fff;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        width: 400px;
        max-width: 90%;
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
    <div class="result-container">
        <h2>Informacja</h2>
        <p class="result-message">${msg}</p>
        <p class="back-link">
            <a href="home.jsp">Powrót do strony głównej</a>
        </p>
    </div>
</body>
</html>

