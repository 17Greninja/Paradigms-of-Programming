public class Display {

    static void printCharLine(int m, char c) {
        for (int j = 1; j <= m; j++) {
            System.out.print(c);
        }
    }

    static void printA(int n, int m, char c, int i) {
        if (i == (n + 1) / 2) {
            printCharLine(m, c);
        } else if (i == 1) {
            System.out.print(' ');
            printCharLine(m - 2, c);
            System.out.print(' ');
        } else {
            System.out.print(c);
            printCharLine(m - 2, ' ');
            System.out.print(c);
        }
        System.out.print(' ');
    }

    static void printE(int n, int m, char c, int i) {
        if (i == n || i == 1 || i == (n + 1) / 2) {
            printCharLine(m, c);
        } else {
            System.out.print(c);
            printCharLine(m - 1, ' ');
        }
        System.out.print(' ');
    }

    static void printI(int n, int m, char c, int i) {
        if (i == n || i == 1) {
            printCharLine(m, c);
        } else {
            printCharLine(m / 2, ' ');
            System.out.print(c);
            printCharLine(m - ((m / 2) + 2) + 1, ' ');
        }
        System.out.print(' ');
    }

    static void printO(int n, int m, char c, int i) {
        if (i == n || i == 1) {
            System.out.print(' ');
            printCharLine(m - 2, c);
            System.out.print(' ');
        } else {
            System.out.print(c);
            printCharLine(m - 2, ' ');
            System.out.print(c);
        }
        System.out.print(' ');
    }

    static void printU(int n, int m, char c, int i) {
        if (i == n) {
            printCharLine(m, c);
        } else {
            System.out.print(c);
            printCharLine(m - 2, ' ');
            System.out.print(c);
        }
        System.out.print(' ');
    }

    static void printB(int n, int m, char c, int i) {
        if (i == n || i == 1 || i == (n + 1) / 2) {
            printCharLine(m - 1, c);
            System.out.print(' ');
        } else {
            System.out.print(c);
            printCharLine(m - 2, ' ');
            System.out.print(c);
        }
        System.out.print(' ');
    }

    static void printC(int n, int m, char c, int i) {
        if (i == n || i == 1) {
            printCharLine(m, c);
        } else {
            System.out.print(c);
            printCharLine(m - 1, ' ');
        }
        System.out.print(' ');
    }

    static void printD(int n, int m, char c, int i) {
        if (i == n || i == 1) {
            printCharLine(m - 1, c);
            System.out.print(' ');
        } else {
            System.out.print(c);
            printCharLine(m - 2, ' ');
            System.out.print(c);
        }
        System.out.print(' ');
    }

    static void printF(int n, int m, char c, int i) {
        if (i == 3 || i == 1) {
            printCharLine(m, c);
        } else {
            System.out.print(c);
            printCharLine(m - 1, ' ');
        }
        System.out.print(' ');
    }

    static void printPattern(char letter, int n, int m, char c, int i) {
        switch (letter) {
            case 'A':
                printA(n, m, c, i);
                break;
            case 'E':
                printE(n, m, c, i);
                break;
            case 'I':
                printI(n, m, c, i);
                break;
            case 'O':
                printO(n, m, c, i);
                break;
            case 'U':
                printU(n, m, c, i);
                break;
            case 'B':
                printB(n, m, c, i);
                break;
            case 'C':
                printC(n, m, c, i);
                break;
            case 'D':
                printD(n, m, c, i);
                break;
            case 'F':
                printF(n, m, c, i);
                break;
        }
    }

    static void displayPattern(String pattern, int n, int m, char c) {
        for (int it = 1; it <= n; it++) {
            for (int i = 0; i < pattern.length(); i++) {
                printPattern(pattern.charAt(i), n, m, c, it);
            }
            System.out.print("\n");
        }
    }

    public static void main(String args[]) {

        int rows = 6;
        int cols = 6;
        char c = '#';

        int sizeArgs = args.length;

        String pattern = args[sizeArgs - 1];
        int check_m = -1;
        int check_n = -1;
        int check_c = -1;
        for (int i = 0; i < sizeArgs - 1; i++) {
            if (args[i].equals("-m"))
                check_m = i;
            else if (args[i].equals("-n"))
                check_n = i;
            else if (args[i].equals("-c"))
                check_c = i;
        }
        if (check_m != -1) {
            cols = Integer.parseInt(args[1 + check_m]);
        }
        if (check_n != -1) {
            rows = Integer.parseInt(args[1 + check_n]);
        }
        if (check_c != -1) {
            c = args[check_c + 1].charAt(0);
        }
        if (rows <= 3 || cols <= 3) {
            System.out.print(
                    "Bad Input, please make sure that number of rows and columns are both greater than 3." + "\n");
            return;
        }
        displayPattern(pattern.toUpperCase(), rows, cols, c);
    }
}
