# 一、引言

1、项目目标

(1)用户管理：

实现用户注册功能，允许学生创建个人账户，并输入必要的个人信息，如用户名、密码、学号等。

提供用户登录功能，通过验证用户名和密码来确保只有合法用户能够访问系统。

(2)课程管理：

提供课程列表展示功能，让学生能够浏览所有可选课程，并了解每门课程的详细信息。

(3)选课与退课：

学生能够选择自己感兴趣的课程，并提交选课请求。

(4)评价系统：

学期结束后，学生可以对所选修的课程进行评价，教师和管理员可以查看评价汇总，以便了解课程教学效果，并作出相应改进。

2、技术选型

技术选型在项目开发中起着至关重要的作用，它决定了系统的性能、可扩展性、可维护性以及开发效率。以下是选择Tomcat作为服务器，MySQL作为数据库，HTML/CSS/JavaScript作为前端技术，以及Java Servlet/JSP作为后端技术的原因：

(1)Tomcat作为服务器

* 开源免费，轻量级且稳定可靠。

* 作为Servlet/JSP的官方参考实现，支持Java Web开发。

* 拥有活跃的社区支持。

(2)MySQL作为数据库

* 开源免费，高性能且可扩展。

* 提供丰富的安全特性和存储引擎选项。

* 广泛的用户基础和社区支持。

(3)HTML/CSS/JavaScript作为前端技术

* 跨平台，支持所有现代浏览器。

* 资源丰富，包括教程、框架和库。

* 便于创建动态、用户友好的Web界面。

(4)Java Servlet/JSP作为后端技术

* 基于强大的Java平台，生态系统完善。

* 支持MVC设计模式，提高代码质量。

* 易于与Tomcat等Servlet容器集成，实现快速部署。

* 继承Java的安全性特性。

# 二、系统要求分析

在引言中，已经提前交代了项目的大体目标，在这一部分将详细对每个目标进行细致的分析。

1、用户注册

用户可以输入自己的姓名，学号，密码进行注册。

2、用户登录

验证用户名和密码

3、修改密码

输入学号和新秘密即可修改

4、修改个人信息

在登录后，用户可以点击上方导航栏中的“修改信息”进行修改个人信息，可以修改个人年龄，性别和所在的院系。

5、选课

在登录后，用户首先进入的时课程介绍界面，一共设置了五项课程，每个课程都有简短的介绍。之后，用户可以在网页左侧的导航栏点击“选课中心”进入选课。在选课界面，用户可以看到课程的基本信息，有上课课程名称、课程编码、授课老师和上课的时间和地点。点击上方的选择按钮即可选课，且每次只能选一节课。选课完成可以跳转到选课成功界面。

6、退课

同样点击网页左侧的导航栏，点击“已选课程”，用户可以看到自己刚刚选的课，点击上方的退课按钮，即可完成退课。

7、评价课程

用户可以点击导航栏上方的“教学评价”按钮，进入课程评价界面，可以看到已选课程的编号和授课老师，进行评价。

8、非功能需求

在导航栏右侧有“退出”和“换肤”按钮。

# 三、系统设计

1、总体架构设计

(1)前端层

主要通过设计网页来实现选课中各个功能的可视化。前端通过HTTP请求与后端进行通信，获取数据并展示给用户，或者将用户输入的数据发送到后端处理。

(2)后端层

后端层是系统的核心处理部分，负责处理业务逻辑、数据存储与检索、与前端的数据交换等。它通常运行在服务器上，可以处理来自多个用户的并发请求。通过java语言，完成对各个功能的控制。

(3)数据库层

数据库层负责存储和管理系统的数据。它是数据的核心仓库，为前端和后端提供数据查询、插入、更新和删除等服务。

2、设计数据库表结构

在数据库中，一共设计4个表，分别为course（课程）、course_select（选课）、evaluate（评价）、student_table（学生信息）。为了统一，每个中的字段类型都是varchar。

(1)course（课程）

课程表并没有在项目中有实际的应用，因为在选课界面中就有存在。

![image](https://github.com/user-attachments/assets/db74ad43-a1c7-4744-8135-de5c8574920c)

![image](https://github.com/user-attachments/assets/6356f1d9-433b-4575-b861-c7b4f3b6f13a)

(2)course_select（选课）

![image](https://github.com/user-attachments/assets/50560867-c360-41bc-b853-0ea16212c32c)

![image](https://github.com/user-attachments/assets/5bba08ba-eff3-4c23-8f39-bd847cabfc69)

(3)evaluate（评价）

![image](https://github.com/user-attachments/assets/19a69fcd-39b7-4882-a614-2fc973c81863)

![image](https://github.com/user-attachments/assets/c65ff8fd-a4c2-42cc-b8c9-9f6bd309cb5f)

(4)student_table（学生信息）

其中年龄、性别、院系的添加在用户信息更新中实现。

![image](https://github.com/user-attachments/assets/7d93999e-bd21-4f0e-b05f-09b84377e29b)

![image](https://github.com/user-attachments/assets/10bb7d07-e8b6-499b-8acd-77850c6afe08)

3、接口设计

在IDEA中打开项目时，选择web文件下的WEB-INF文件，再次文件夹下新建一个lib文件夹。在lib文件夹中，导入mysql-connter-java配置文件，右击鼠标按钮，选择“add as library”选项添加。
另外配置与数据库连接的操作在src文件夹下的util目录中。

# 四、系统实现

1、环境搭建

安装Tomcat服务器，配置数据库连接。

2、后端实现

在项目中所有的功能都基于一个原理，数据库的连接和网页表单的配置，所以这里只举一个最简单的例子：**用户注册**。

(1)Bean层定义数据

```java
public class UserBean {
    private String sno;
    private String sname;
    private String password;
public String getSname() {
    return sname;
    }
    public void setSno(String sno) {
    this.sno = sno;
    }
    public String getSname() {
    return sname;
    }
    public void setSname(String sname) {
    this.sname = sname;
    }
    public String getPassword() {
    return password;
    }
    public void setPassword(String password) {
    this.password = password;
    }
}
```
1)属性（私有成员变量）：

* private String sno;：定义了一个私有字符串类型的属性sno，可能用于存储用户的学号或某种唯一标识符。
* private String sname;：定义了一个私有字符串类型的属性sname，用于存储用户的姓名。
* private String password;：定义了一个私有字符串类型的属性password，用于存储用户的密码。

2)Getter和Setter方法：

* Getter方法用于从对象中获取（读取）属性值，而不直接访问该对象的私有属性。它们通常没有副作用（即不修改对象的状态）。
* Setter方法用于设置（修改）对象中的属性值。它们允许外部代码安全地修改对象的私有属性。

(2)Dao层数据库语言
```java

public boolean addUser(UserBean userBean) {
    String sql = "insert into student_table(sno,sname,password) values(?,?,?)";
    boolean flag = false;
    try {
        PreparedStatement preparedStatement =        connection.prepareStatement(sql);
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
```

1)方法签名：

* public boolean addUser(UserBean userBean)：这是一个公开的方法，返回类型为 boolean，表示操作是否成功。它接收一个 UserBean 类型的参数 userBean，这个参数包含了要插入数据库的用户信息。

2)SQL 语句：

* String sql = "insert into student_table(sno,sname,password) values(?,?,?)";：定义了一个 SQL 插入语句，该语句用于向 student_table 表中插入一行数据。sno、sname、password 是表中的列名，而 ? 是占位符，用于之后通过 PreparedStatement 设置具体的值。

3)初始化标志变量：

* boolean flag = false;：定义了一个布尔类型的变量 flag，并初始化为 false。这个变量用于记录操作是否成功。

4)执行数据库操作：

* 使用 try 块来捕获可能发生的异常。
* 在 try 块内，首先通过 connection.prepareStatement(sql) 方法创建一个 PreparedStatement 对象，该对象用于执行带有参数的 SQL 语句。这里的 connection 应该是一个已经打开的数据库连接对象，但在这段代码中并未显示其定义和获取过程。
* 通过 preparedStatement.setString(int parameterIndex, String x) 方法为 SQL 语句中的占位符设置具体的值。这里，parameterIndex 是占位符的位置（从 1 开始），x 是要设置的值。
* 调用 preparedStatement.executeUpdate() 方法执行 SQL 语句。这个方法返回受影响的行数，即插入、更新或删除的行数。如果返回的值大于 0，表示至少有一行数据被插入。
* 根据 executeUpdate() 方法的返回值更新 flag 变量的值。实际上，flag = row > 0 ? true : false; 这行代码可以简化为 flag = row > 0;，因为 row > 0 本身就是一个布尔表达式。

5)异常处理：

* 如果在执行数据库操作的过程中发生 SQLException 异常，则捕获该异常并调用 printStackTrace() 方法打印异常堆栈信息。这里并没有对异常进行进一步的处理，比如重试机制或向调用者抛出异常，这可能会导致调用者无法知道操作失败的具体原因。

6)返回结果：

* 最后，方法返回 flag 变量的值，表示操作是否成功。

(3)Servlet层调用函数插入元素
```java
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    resp.setContentType("text/html;charset=utf-8");
    req.setCharacterEncoding("utf-8");
    //获取值
    String sno =   req.getParameter("sno");
    String sname =   req.getParameter("sname");
    String password =    req.getParameter("password");
    //初始化对象
    UserBean userBean = new UserBean();
    userBean.setSno(sno);
    userBean.setSname(sname);
    userBean.setPassword(password);
    //调用数据库Dao层进行插入
    UserDao userDao = new UserDao();
    boolean flag =   userDao.addUser(userBean);
    if (flag) {
        // 更新成功，设置重定向到成功页面
        resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY); // 也可以使用SC_SEE_OTHER，这表示客户端应该使用GET方法请求Location头部指定的URL
        resp.setHeader("Location", "http://localhost:8080/_war_exploded/signin.jsp"); // 假设你有一个名为success.html的页面来显示成功消息
    } else {
        // 更新失败，设置重定向到失败页面
        resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
        resp.setHeader("Location", "fail.html");
    }
    return;
}
```

定义一个doPost方法，这是Servlet中用于处理HTTP POST请求的方法。

1)获取请求参数：

通过req.getParameter("参数名")方法从请求中获取表单数据，如学号（sno）、姓名（sname）和密码（password），并将这些值存储在局部变量中。

2)初始化对象并设置属性值：

创建一个UserBean对象，并调用其setter方法将获取到的请求参数值设置给该对象的属性。UserBean是一个JavaBean，通常用于封装用户数据。

3)调用数据库Dao层进行插入操作：

创建一个UserDao对象，该对象负责与数据库进行交互。然后调用UserDao的addUser方法，将UserBean对象作为参数传入，执行数据库插入操作。addUser方法返回一个布尔值，表示插入操作是否成功。

3、前端实现

(1)添加映射

在web.xml配置片段中，添加<servlet-name> 和 <servlet-class> 的映射。

(2)配置表单

在所要提交的表单中action设置为刚刚设置的<servlet-name>名称，之后表单中每个元素的name都要为Bean层中所定义的数据名。

# 五、用户界面设计

在第二部分系统要求分析中，已经详细的描述了界面的设计，这一部分就展示从一开始的用户注册来体现界面设计和运行逻辑。

1、用户注册

进入界面点击登录按钮下方的注册按钮。

这里输入学号为“0012303”，姓名为“小李”，密码为“123”。

![image](https://github.com/user-attachments/assets/ef7a86b7-020d-47eb-a049-01400443d349)

2、修改密码

点击注册按钮后，返回登陆界面，在登录按钮上点击“忘记密码”选项进行修改密码。

密码修改为“123”。

![image](https://github.com/user-attachments/assets/554e6e53-4c2c-48bd-976a-5b93c016913e)

3、登录

![image](https://github.com/user-attachments/assets/4340c3dc-d38d-4c98-b70c-3dc1cf7a69ce)

4、课程介绍界面

点击登陆后跳转到课程介绍界面。

![image](https://github.com/user-attachments/assets/25f5d815-a44e-4a71-ba19-1ee76b299b1e)

5、修改个人信息

点击导航栏上的修改信息。

可以修改年龄、性别、系别。系别可选的有计算机系、数学系、物理系、化学系。

![image](https://github.com/user-attachments/assets/44a1fb50-35e5-4d6d-b58b-c2194991fdd8)

6、选课界面

点击修改可以直接跳转到选课界面。

可以看到课程信息，上方可以自行选择课程并提交。

![image](https://github.com/user-attachments/assets/98e40f97-abe8-40a4-b560-154ac51b574a)

7、选课成功界面

![image](https://github.com/user-attachments/assets/b720bcc1-26e3-4486-a1c5-ea300db4eac3)

8、退课界面

可以看到刚刚已选的课程，点击按钮即可退课。

![image](https://github.com/user-attachments/assets/d24d9f14-d4a0-4efc-881b-bc64d743d4b3)

9、教学评价

点击导航栏上发的教学评价，可以对刚刚选择课程的老师进行评价，每个老师只能评价一次。

![image](https://github.com/user-attachments/assets/90a40a97-0033-4f2c-95c9-e9b6de0174b6)

10、成功失败界面

一共设置了5个成功和失败的界面，分别为评价成功、评价失败、选课成功、选课失败、退课失败。

11、其他功能

点击导航栏的推出按钮回到登陆界面，点击换肤按钮可以改变网页背景。
