<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>已选课程</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/main.css" />
    <style type="text/css">
        .table{
            font-size: 1.2em;
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
                <a href="http://localhost:8080/_war_exploded/course.jsp" class="list-group-item">选课中心</a>
                <a href="#" class="list-group-item active" id="selected">已选课程</a>
            </div>
        </div>
        <!-- 右侧 -->
        <div class="co-xs-12 col-sm-10 col-md-10 col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>已选课程</h4>
                    <form action="returncourse" method="post">
                        <script type="text/javascript">
                            window.onload = function() {
                                // 获取并设置学生编号sno
                                var sno = localStorage.getItem("sno");
                                if (sno) {
                                    document.getElementById("courseSnoInput").value = sno;
                                }
                                var courseCode = localStorage.getItem('selectedCourseCode'); // 从localStorage获取
                                var courseRow = document.getElementById('courseRow');
                                var courseNameCell = courseRow.querySelector('#courseName');
                                var courseCodeCell = courseRow.querySelector('#courseCode');
                                var teacherCell = courseRow.querySelector('#teacher');
                                var timePlaceCell = courseRow.querySelector('#timePlace');
                                if (courseCode) {
                                    document.getElementById('courseNum').value = courseCode; // 设置到输入框
                                }
                                if (courseCode === 'C1') {
                                    document.getElementById('courseInput').value = '西方艺术鉴赏';
                                    courseNameCell.textContent = '西方艺术鉴赏';
                                    courseCodeCell.textContent = 'C1';
                                    teacherCell.textContent = '王老师';
                                    timePlaceCell.textContent = '周一 9-10节课 S5 302';
                                } else if (courseCode === 'C2') {
                                    document.getElementById('courseInput').value = '法律基础';
                                    courseNameCell.textContent = '法律基础';
                                    courseCodeCell.textContent = 'C2';
                                    teacherCell.textContent = '李老师';
                                    timePlaceCell.textContent = '周二 9-10节课 S5 201';
                                } else if (courseCode === 'C3') {
                                    document.getElementById('courseInput').value = '教你玩转 Python 编程';
                                    courseNameCell.textContent = '教你玩转Python编程';
                                    courseCodeCell.textContent = 'C3';
                                    teacherCell.textContent = '赵老师';
                                    timePlaceCell.textContent = '周三 9-10节课 N5 101';
                                } else if (courseCode === 'C4') {
                                    document.getElementById('courseInput').value = '书法之美';
                                    courseNameCell.textContent = '书法基础';
                                    courseCodeCell.textContent = 'C4';
                                    teacherCell.textContent = '张老师';
                                    timePlaceCell.textContent = '周四 9-10节课 S3 201';
                                } else if (courseCode === 'C5') {
                                    document.getElementById('courseInput').value = '探索宇宙';
                                    courseNameCell.textContent = '探索宇宙';
                                    courseCodeCell.textContent = 'C5';
                                    teacherCell.textContent = '陈老师';
                                    timePlaceCell.textContent = '周五 9-10节课 S4 102';
                                }
                            };

                        </script>
                        <input type="text" value="" id="courseSnoInput" name="sno" readonly>
                        <input type="text" value="" id="courseInput" readonly>
                        <input type="text" name="num" id="courseNum" readonly>
                        <input type="submit" name="" value="退课">
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
                        <tr id="courseRow">
                            <td id="courseName"></td>
                            <td id="courseCode"></td>
                            <td id="teacher"></td>
                            <td id="timePlace"></td>
                            <td></td>
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
