package nhom1;

import java.sql.Connection;
import java.sql.DriverManager;

public class database {
	static final String url = "jdbc:mysql://localhost:3306/qlmypham?useUnicode=true&characterEncoding=UTF-8";
	static final String username = "root";
	static final String password = "";
	public static Connection connect;

	public static Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = (Connection) DriverManager.getConnection(url, username, password);
			return connect;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
}
