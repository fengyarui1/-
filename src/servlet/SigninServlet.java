package servlet;

import bean.UserBean;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SigninServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sno = req.getParameter("sno");
        String password = req.getParameter("password");
        UserDao userDao = new UserDao();
        UserBean userBean = userDao.queryUser(sno, password);
        // 判断用户是否存在
        if (userBean != null) {
            // 登录成功，重定向到成功页面
            resp.sendRedirect("http://localhost:8080/_war_exploded/courseIntroduction.jsp"); // 假设成功页面为success.jsp
            System.out.println("Login success, redirecting to success page.");
        } else {
            // 登录失败，重定向到失败页面
            resp.sendRedirect("failure.jsp"); // 假设失败页面为failure.jsp
            System.out.println("Login failed, redirecting to failure page.");
        }
    }
}