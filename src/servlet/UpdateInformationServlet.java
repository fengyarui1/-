package servlet;

import bean.UserBean;
import dao.UserDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateInformationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String sno=req.getParameter("sno");
        String sage=req.getParameter("sage");
        String ssex=req.getParameter("ssex");
        String sdept=req.getParameter("sdept");
        UserDao userDao = new UserDao();
        boolean isSuccess = userDao.updateInformation(sno, sage,ssex,sdept);
        if (isSuccess) {
            // 更新成功，设置重定向到成功页面
            resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY); // 也可以使用SC_SEE_OTHER，这表示客户端应该使用GET方法请求Location头部指定的URL
            resp.setHeader("Location", "http://localhost:8080/_war_exploded/course.jsp"); // 假设你有一个名为success.html的页面来显示成功消息
        } else {
            // 更新失败，设置重定向到失败页面
            resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            resp.setHeader("Location", "http://localhost:8080/_war_exploded/updatefail.jsp");
        }
        return;
    }
}