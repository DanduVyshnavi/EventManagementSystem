package dbconnections;

import java.sql.Connection;
import java.sql.DriverManager;

public class eventdbconnection {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    private static final String URL = "jdbc:mysql://localhost:3306/employeedashboard"; // Use 'eventdashboard' if preferred

    private static Connection conn = null;

    public static Connection getconnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName(DRIVER);
                conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}