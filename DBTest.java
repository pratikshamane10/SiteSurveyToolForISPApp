import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBTest {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/isp_survey_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";
        String pass = "Computer27@#";

        try {
            System.out.println("Attempting to connect to: " + url);
            Connection conn = DriverManager.getConnection(url, user, pass);
            System.out.println("Successfully connected to the database!");
            conn.close();
        } catch (SQLException e) {
            System.err.println("Connection failed!");
            e.printStackTrace();
        }
    }
}
