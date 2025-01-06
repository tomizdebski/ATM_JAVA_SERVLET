package pl.bankomat;

import pl.bankomat.model.ATM;
import pl.bankomat.model.UserAccount;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Główny serwlet obsługujący logikę bankomatu.
 */
public class BankomatServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        // Tworzymy jeden obiekt ATM z domyślną liczbą banknotów
        ATM atm = new ATM(10, 10, 10, 10, 10);

        // Tworzymy przykładowego użytkownika (login=admin, password=admin, saldo=5000)
        UserAccount user = new UserAccount("admin", "admin", 5000.0);

        // Zapisujemy je w kontekście aplikacji (dostępne dla wszystkich sesji)
        getServletContext().setAttribute("atm", atm);
        getServletContext().setAttribute("userAccount", user);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Sprawdzamy parametr "action" (login, deposit, withdraw, logout)
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        // Pobieramy obiekty z kontekstu
        ATM atm = (ATM) getServletContext().getAttribute("atm");
        UserAccount user = (UserAccount) getServletContext().getAttribute("userAccount");

        if ("login".equals(action)) {
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            if (user.checkCredentials(login, password)) {
                // zapisujemy w sesji info o zalogowanym użytkowniku
                session.setAttribute("loggedUser", user);
                // przekierowanie na stronę główną
                response.sendRedirect("home.jsp");
            } else {
                // błąd logowania
                request.setAttribute("msg", "Błędny login lub hasło!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } else if ("deposit".equals(action)) {
            // Wpłata
            int amount = Integer.parseInt(request.getParameter("amount"));
            // Zwiększamy saldo
            user.setBalance(user.getBalance() + amount);
            // Wpłacamy do bankomatu
            atm.deposit(amount);

            request.setAttribute("msg", "Wpłata " + amount + " PLN zakończona sukcesem.");
            request.getRequestDispatcher("result.jsp").forward(request, response);

        } else if ("withdraw".equals(action)) {
            // Wypłata
            int amount = Integer.parseInt(request.getParameter("amount"));
            // Czy są wystarczające środki na koncie?
            if (user.getBalance() < amount) {
                request.setAttribute("msg", "Brak środków na koncie!");
                request.getRequestDispatcher("result.jsp").forward(request, response);
            } else {
                // Próbujemy wypłacić z bankomatu
                boolean success = atm.withdraw(amount);
                if (success) {
                    // pomyślna wypłata, zmniejszamy saldo
                    user.setBalance(user.getBalance() - amount);
                    request.setAttribute("msg", "Wypłata " + amount + " PLN zakończona sukcesem.");
                } else {
                    request.setAttribute("msg", "Brak odpowiednich nominałów w bankomacie.");
                }
                request.getRequestDispatcher("result.jsp").forward(request, response);
            }

        } else if ("logout".equals(action)) {
            // Wylogowanie
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}
