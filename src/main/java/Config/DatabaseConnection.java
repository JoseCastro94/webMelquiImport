package Config;

import java.sql.*;

public class DatabaseConnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost;database=mequi_import";
            String usr = "sa";
            String psw = "123456";
            con = DriverManager.getConnection(url, usr, psw);
            System.out.println("Conexion establecida");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
