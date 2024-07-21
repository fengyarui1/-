<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>选课中心</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/main.css" />
    <style type="text/css">
        .table{
            font-size: 1.2em;
        }
        #introduction{
            font-size: 0.9em;
            color: gray;
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
                    <li class="active"><a href="#">选课管理</a></li>
                    <li><a href="http://localhost:8080/_war_exploded/evaluate.jsp">教学评价</a></li>
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
        <div class="co-xs-12 col-sm-2 col-md-2 col-lg-2">
            <div class="list-group">
                <a href="http://localhost:8080/_war_exploded/courseIntroduction.jsp" class="list-group-item">课程介绍</a>
                <a href="#" class="list-group-item active">选课中心</a>
                <a href="http://localhost:8080/_war_exploded/returnCourse.jsp" class="list-group-item" id="selected">已选课程</a>
            </div>
        </div>
        <!-- 右侧 -->
        <div class="co-xs-12 col-sm-10 col-md-10 col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>选课中心</h4>
                    <form action="course" method="post">
                        <script type="text/javascript">
                            window.onload = function() {
                                var sno = localStorage.getItem("sno");
                                document.getElementById("courseSnoInput").value = sno;
                            };
                        </script>
                        <input type="text" value="" id="courseSnoInput" name="sno" readonly>
                        <select id="courseSelect" name="course">
                            <option value="西方艺术鉴赏">西方艺术鉴赏</option>
                            <option value="法律基础">法律基础</option>
                            <option value="教你玩转 Python 编程">教你玩转 Python 编程</option>
                            <option value="书法之美">书法之美</option>
                            <option value="探索宇宙">探索宇宙</option>
                        </select>
                        <input type="text" name="num" id="courseNum" readonly>
                        <input type="submit" id="courseBtn" value="提交">


                        <script>
                            document.getElementById('courseBtn').addEventListener('click', function() {
                                var courseCode = document.getElementById('courseNum').value;
                                localStorage.setItem('selectedCourseCode', courseCode); // 存储到localStorage
                                // 这里可以添加代码来打开退课界面，如通过修改window.location或使用AJAX
                            });
                            document.getElementById('cancelCourseBtn').addEventListener('click', function() {
                                var courseCode = document.getElementById('courseNum').value;
                                localStorage.setItem('selectedCourseCode', courseCode); // 存储到localStorage
                                // 这里可以添加代码来打开退课界面，如通过修改window.location或使用AJAX
                            });
                        </script>
                        <script type="text/javascript">
                            document.addEventListener("DOMContentLoaded", function() {
                                // 页面加载完成后，设置默认的课程代码为C1
                                document.getElementById("courseNum").value = "C1";
                                // 同时，为<select>元素添加change事件监听器
                                document.getElementById("courseSelect").addEventListener("change", function() {
                                    var selectedIndex = this.selectedIndex + 1; // 索引从0开始，所以+1
                                    var courseCode = "C" + selectedIndex;
                                    if (selectedIndex >= 0 && selectedIndex <= 5) { // 确保索引在有效范围内
                                        document.getElementById("courseNum").value = courseCode;
                                    }
                                });
                            });
                            document.getElementById('cancelCourseBtn').addEventListener('click', function() {
                                // 跳转到退课页面
                                window.location.href = 'yixuanke.html';
                            });
                        </script>
                    </form>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th>课程名称</th>
                            <th>课程编号</th>
                            <th>上课老师</th>
                            <th>时间地点</th>
                            <th></th>
                        </tr>
                        <tr>
                            <td>西方艺术鉴赏</td>
                            <td>C1</td>
                            <td>王老师</td>
                            <td>周一 9-10节课 S5 302</td>
                            <td>
                                <a href="#collapse1" class="detail-link" data-toggle="collapse" data-parent="#accordion">
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                            </td>
                        </tr>
                        <tr id="collapse1" class="collapse">
                            <td colspan="10" id="introduction">     西方艺术鉴赏   艺术类   1学分</td>
                        </tr>
                        <tr>
                            <td>法律基础</td>
                            <td>C2</td>
                            <td>李老师</td>
                            <td>周二 9-10节课 S5 201</td>
                            <td>
                                <a href="#collapse2" class="detail-link" data-toggle="collapse" data-parent="#accordion">
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                            </td>
                        </tr>
                        <tr id="collapse2" class="collapse">
                            <td colspan="10" id="introduction">    法律基础    人文类   2学分</td>
                        </tr>
                        <tr>
                            <td>教你玩转Python编程</td>
                            <td>C3</td>
                            <td>赵老师</td>
                            <td>周三 9-10节课 N5 101</td>
                            <td>
                                <a href="#collapse3" class="detail-link" data-toggle="collapse" data-parent="#accordion">
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                            </td>
                        </tr>
                        <tr id="collapse3" class="collapse">
                            <td colspan="10" id="introduction">    教你玩转Python编程   技术类   1.5学分</td>
                        </tr>
                        <tr>
                            <td>书法基础</td>
                            <td>C4</td>
                            <td>张老师</td>
                            <td>周四 9-10节课 S3 201</td>
                            <td>
                                <a href="#collapse4" class="detail-link" data-toggle="collapse" data-parent="#accordion">
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                            </td>
                        </tr>
                        <tr id="collapse4" class="collapse">
                            <td colspan="10" id="introduction">     书法基础   艺术类   2学分</td>
                        </tr>
                        <tr>
                            <td>探索宇宙</td>
                            <td>C5</td>
                            <td>陈老师</td>
                            <td>周五 9-10节课 S4 102 </td>
                            <td>
                                <a href="#collapse5" class="detail-link" data-toggle="collapse" data-parent="#accordion">
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                            </td>
                        </tr>
                        <tr id="collapse5" class="collapse">
                            <td colspan="10" id="introduction">     探索宇宙   人文类   1学分</td>
                        </tr>

                    </table>
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
    })
</script>
</body>
</html>
