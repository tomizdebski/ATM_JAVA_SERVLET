package pl.bankomat.model;

import java.util.Random;

/**
 * Klasa reprezentująca stan bankomatu i operacje wpłaty/wypłaty nominałów.
 */
public class ATM {

    private int bill500;
    private int bill200;
    private int bill100;
    private int bill50;
    private int bill20;

    public ATM(int b500, int b200, int b100, int b50, int b20) {
        this.bill500 = b500;
        this.bill200 = b200;
        this.bill100 = b100;
        this.bill50 = b50;
        this.bill20 = b20;
    }

    // Gettery i settery
    public int getBill500() { return bill500; }
    public void setBill500(int bill500) { this.bill500 = bill500; }
    public int getBill200() { return bill200; }
    public void setBill200(int bill200) { this.bill200 = bill200; }
    public int getBill100() { return bill100; }
    public void setBill100(int bill100) { this.bill100 = bill100; }
    public int getBill50() { return bill50; }
    public void setBill50(int bill50) { this.bill50 = bill50; }
    public int getBill20() { return bill20; }
    public void setBill20(int bill20) { this.bill20 = bill20; }

    /**
     * Metoda przyjmująca kwotę do wpłaty i przydzielająca ją w sposób losowy na nominały.
     */
    public void deposit(int amount) {
        Random rand = new Random();
        int remaining = amount;

        // Dopóki mamy co najmniej 20, wrzucamy w losowy nominał
        while (remaining >= 20) {
            int pick = rand.nextInt(5); // 0..4
            int nom = 0;
            switch (pick) {
                case 0: nom = 500; break;
                case 1: nom = 200; break;
                case 2: nom = 100; break;
                case 3: nom = 50;  break;
                case 4: nom = 20;  break;
            }
            if (remaining - nom >= 0) {
                remaining -= nom;
                switch (nom) {
                    case 500: bill500++; break;
                    case 200: bill200++; break;
                    case 100: bill100++; break;
                    case  50: bill50++;  break;
                    case  20: bill20++;  break;
                }
            }
        }
        // Jeśli coś zostaje poniżej 20, pomijamy lub można dorzucić do bill20
    }

    /**
     * Metoda wypłacająca kwotę w możliwie najmniejszej liczbie banknotów.
     * Zwraca true, jeśli się udało, lub false, jeśli brak odpowiednich nominałów.
     */
    public boolean withdraw(int amount) {
        // Kopie tymczasowe, żeby nie zmieniać stanu, jeśli się nie uda
        int tmp500 = bill500;
        int tmp200 = bill200;
        int tmp100 = bill100;
        int tmp50  = bill50;
        int tmp20  = bill20;

        int remaining = amount;

        // Najpierw 500
        while (remaining >= 500 && tmp500 > 0) {
            remaining -= 500;
            tmp500--;
        }
        // Potem 200
        while (remaining >= 200 && tmp200 > 0) {
            remaining -= 200;
            tmp200--;
        }
        // Potem 100
        while (remaining >= 100 && tmp100 > 0) {
            remaining -= 100;
            tmp100--;
        }
        // Potem 50
        while (remaining >= 50 && tmp50 > 0) {
            remaining -= 50;
            tmp50--;
        }
        // Na końcu 20
        while (remaining >= 20 && tmp20 > 0) {
            remaining -= 20;
            tmp20--;
        }

        // Czy udało się wyzerować?
        if (remaining == 0) {
            // Zatwierdzamy zmiany
            bill500 = tmp500;
            bill200 = tmp200;
            bill100 = tmp100;
            bill50  = tmp50;
            bill20  = tmp20;
            return true;
        } else {
            // Nie udało się wypłacić całej kwoty
            return false;
        }
    }
}

