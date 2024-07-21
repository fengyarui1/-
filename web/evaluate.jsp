<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2024/7/15
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>教学评价</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/main.css" />
    <style>
        /* 定义红色标注的样式 */
        .red-note {
            color: red; /* 文本颜色为红色 */
            font-weight: bold; /* 可选：加粗文本 */
            font-size: 0.8em;
        }
        #teacher1,#evaluateSelect {
            width: 100px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        #evaluateBtn{
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
</head>
<body>
<script type="text/javascript" src="canvas-nest.min.js"></script>
<canvas height="926" width="1920" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;" id="c_n1"></canvas>
<div class="header">
    <nav class="navbar navbar-default" role="navigation" id="bg">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">学生选课评教系统</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="http://localhost:8080/_war_exploded/courseIntroduction.jsp">选课管理</a></li>
                    <li class="active"><a href="#">教学评价</a></li>
                    <li><a href="http://localhost:8080/_war_exploded/updateInformation.jsp">修改信息</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="http://localhost:8080/_war_exploded/signin.jsp" class="dropdown-toggle">退出</a>

                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">换肤<b class="caret"></b></a>
                        <ul class="dropdown-menu" id="color">
                            <li id="blue"><a href="#">蓝色</a></li>
                            <li id="red"><a href="#">红色</a></li>
                            <li id="yellow"><a href="#">黄色</a></li>
                            <li id="green"><a href="#">绿色</a></li>
                            <li id="default" class="active"><a href="#">默认</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <!-- 左侧 -->

        <!-- 右侧 -->
        <div class="co-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>评价信息 <span class="red-note">（每个老师只能评价一次）</span></h4>
                    <div class="form-group">
                        <div class="panel-body">

                            <form action="evaluate" method="post">
                                <table class="table">
                                    <tr>
                                        <th>学号</th>
                                        <th>课程编号</th>
                                        <th>上课老师</th>
                                        <th>评分</th>
                                        <th>操作</th>
                                    </tr>
                                    <tr>
                                        <script type="text/javascript">
                                            window.onload = function() {
                                                var sno = localStorage.getItem("sno");
                                                document.getElementById("courseSnoInput").value = sno;
                                                var courseCode = localStorage.getItem('selectedCourseCode');
                                                if (courseCode) {
                                                    document.getElementById('courseNum').value = courseCode; // 设置到输入框
                                                }
                                                if (courseCode === 'C1') {
                                                    document.getElementById('teacher1').value = '王老师';

                                                } else if (courseCode === 'C2') {
                                                    document.getElementById('teacher1').value = '李老师';

                                                } else if (courseCode === 'C3') {
                                                    document.getElementById('teacher1').value = '赵老师';

                                                } else if (courseCode === 'C4') {
                                                    document.getElementById('teacher1').value = '张老师';

                                                } else if (courseCode === 'C5') {
                                                    document.getElementById('teacher1').value = '陈老师';

                                                }
                                            };
                                        </script>
                                        <td><input type="text" id="courseSnoInput" name="sno"  readonly></td>
                                        <td><input type="text" id="courseNum" name="num"  readonly></td>
                                        <td><input type="text" id="teacher1" name="teacher"  readonly></td>
                                        <td>
                                            <select name="evaluate" id="evaluateSelect">
                                                <option value="优秀">优秀</option>
                                                <option value="良好">良好</option>
                                                <option value="差">差</option>
                                            </select>
                                        </td>
                                        <td><button type="submit" id="evaluateBtn">提交</button></td>
                                    </tr>
                                </table>
                            </form>
                            <!--小屏后在下面显示翻页-->
                            <div class="visible-xs">
                                <ul class="pagination">
                                    <li><a href="#">&laquo;</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function(){
                /*全选*/
                $('#all').click(function(){
                    if($(this).is(":checked")){
                        console.log("ss");
                        $('td').find('input').prop("checked",true);
                    }else{
                        $('td').find('input').prop("checked",false);
                    }
                });
                /*换肤*/
                $('#blue').click(function(){
                    $('body').css("background","url(img/bg4.jpg)");
                    $('#bg').css("background","url(img/bg4.jpg)");
                    $('#color li').siblings().removeClass('active');
                    $('#blue').addClass("active");
                });
                $('#green').click(function(){
                    $('body').css("background","url(img/bg1.jpg)");
                    $('#bg').css("background","url(img/bg1.jpg)");
                    $('#color li').siblings().removeClass('active');
                    $('#green').addClass("active");
                });
                $('#red').click(function(){
                    $('body').css("background","url(img/bg2.jpg)");
                    $('#bg').css("background","url(img/bg2.jpg)");
                    $('#color li').siblings().removeClass('active');
                    $('#red').addClass("active");
                });
                $('#yellow').click(function(){
                    $('body').css("background","url(img/bg3.jpg)");
                    $('#bg').css("background","url(img/bg3.jpg)");
                    $('#color li').siblings().removeClass('active');
                    $('#yellow').addClass("active");
                });
                $('#default').click(function(){
                    $('body').css("background","white");
                    $('#bg').css("background","");
                    $('#color li').siblings().removeClass('active');
                    $('#default').addClass("active");
                });
                /*删除*/
            })
        </script>
</body>
</html>

