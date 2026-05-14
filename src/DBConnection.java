import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/hajj_company?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "12324013";

    public static Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            System.out.println("Connection Error: " + e.getMessage());
            return null;
        }
    }
}