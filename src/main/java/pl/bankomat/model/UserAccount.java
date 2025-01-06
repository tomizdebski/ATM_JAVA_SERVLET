package pl.bankomat.model;

/**
 * Klasa reprezentująca konto użytkownika (login, hasło, saldo).
 */
public class UserAccount {
    private String login;
    private String password;
    private double balance;

    public UserAccount(String login, String password, double balance) {
        this.login = login;
        this.password = password;
        this.balance = balance;
    }

    /**
     * Sprawdza, czy przekazany login i password są zgodne z danymi konta.
     */
    public boolean checkCredentials(String login, String password) {
        return this.login.equals(login) && this.password.equals(password);
    }

    // Gettery i settery
    public String getLogin() { return login; }
    public void setLogin(String login) { this.login = login; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public double getBalance() { return balance; }
    public void setBalance(double balance) { this.balance = balance; }
}

