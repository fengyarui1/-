package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtil {
    private  static  final String USERNAME="root";
    private  static  final String PASSWORD="123456";
    private  static  final String Driver="com.mysql.cj.jdbc.Driver";
    private  static  final String URL="jdbc:mysql://127.0.0.1:3306/user?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private  static Connection connection=null;
    static{
        try{
            Class.forName(Driver);
            //connection= DriverManager.getConnection(URL);
            connection=DriverManager.getConnection(URL,USERNAME,PASSWORD);
        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

    }
    public static Connection getConnection(){
        return connection;
    }
}
