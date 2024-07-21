package dao;

import bean.UserBean;
import util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class UserDao {
    private static final Connection connection = JdbcUtil.getConnection();

    public boolean addUser(UserBean userBean) {
        String sql = "insert into student_table(sno,sname,password) values(?,?,?)";
        boolean flag = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userBean.getSno());
            preparedStatement.setString(2, userBean.getSname());
            preparedStatement.setString(3, userBean.getPassword());
            int row = preparedStatement.executeUpdate();
            flag = row > 0 ? true : false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return flag;

    }
    public UserBean queryUser(String sno, String password){
        UserBean userBean=null;
        String sql = "select * from student_table where sno = ? and password = ?";
        try{
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, sno);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                userBean= new UserBean();
                userBean.setSno(resultSet.getString("sno"));
                userBean.setSname(resultSet.getString("sname"));
                userBean.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return userBean;
    }
    public boolean updateUser(String sno,String newPassword) {
        boolean flag = false;
        String sql = "update student_table set password = ? where sno = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, sno);
            flag=preparedStatement.executeUpdate()>0?true:false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return flag;
    }
    public boolean addCourse(UserBean userBean) {
        String sql = "insert into course_select(sno,num,course) values(?,?,?)";
        boolean flag = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userBean.getSno());
            preparedStatement.setString(2, userBean.getNum());
            preparedStatement.setString(3, userBean.getCourse());
            int row = preparedStatement.executeUpdate();
            flag = row > 0 ? true : false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return flag;

    }
    public boolean deleteCourse(String sno ,String num) {
        boolean flag = false;
        String sql = "delete from course_select where sno = ? and num = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, sno);
            preparedStatement.setString(2 ,num);
            flag = preparedStatement.executeUpdate() > 0 ? true : false;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return flag;
    }
    public boolean updateInformation(String sno,String sage,String ssex,String sdept) {
        boolean flag = false;
        String sql = "update student_table set sage = ?,ssex = ?,sdept = ? where sno = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, sage);
            preparedStatement.setString(2,ssex);
            preparedStatement.setString(3,sdept);
            preparedStatement.setString(4, sno);
            flag=preparedStatement.executeUpdate()>0?true:false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return flag;
    }
    public boolean evaluate(UserBean userBean) {
        String sql = "insert into evaluate(sno,num,teacher,evaluate) values(?,?,?,?)";
        boolean flag = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userBean.getSno());
            preparedStatement.setString(2, userBean.getNum());
            preparedStatement.setString(3, userBean.getTeacher());
            preparedStatement.setString(4,userBean.getEvaluate());
            int row = preparedStatement.executeUpdate();
            flag = row > 0 ? true : false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return flag;

    }
}