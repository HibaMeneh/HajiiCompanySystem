package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            String url = "jdbc:postgresql://localhost:5432/hajj_company";
            String user = "postgres";
            String pass = "1234";

            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            System.out.println("DB Error: " + e.getMessage());
            return null;
        }
    }
}

