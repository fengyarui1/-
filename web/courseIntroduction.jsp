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
        .box {
            width: 100%;
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .smaller_word{
            font-size: 0.7em;
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
                <a href="#" class="list-group-item active">课程介绍</a>
                <a href="http://localhost:8080/_war_exploded/course.jsp" class="list-group-item">选课中心</a>
                <a href="http://localhost:8080/_war_exploded/returnCourse.jsp" class="list-group-item" id="selected">已选课程</a>
            </div>
        </div>
        <!-- 右侧 -->
        <div class="co-xs-12 col-sm-10 col-md-10 col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>课程介绍</h4>
                    <div class="biaoti">
                        <h1>大学选修课选择</h1>
                    </div>
                    <div class="box">
                        <h3>西方艺术鉴赏  <a class="smaller_word">编号C1</a></h3>
                        <p>本课程将引领您踏上西方艺术的精彩之旅，从古代文明的艺术瑰宝到现代主义的创新表达。</p>
                        <p>您将深入了解西方绘画、雕塑、建筑等多种艺术形式，探索不同时期和流派的风格特点与文化内涵。</p>
                        <p>通过对著名艺术家及其作品的赏析，提升您的审美能力和艺术素养。</p>
                        <p>无论是对艺术感兴趣的初学者，还是希望深入研究的爱好者，这门课程都将为您打开西方艺术的神秘之门。</p>
                    </div>
                    <div class="box">
                        <h3>法律基础 <a class="smaller_word">编号C2</a></h3>
                        <p>法律基础是一门引导您步入法律殿堂的重要课程。</p>
                        <p>在这门课程中，您将接触到法律体系的基本框架和核心概念。从宪法的根本原则，到民法、刑法、商法等主要部门法的关键要点，为您构建起全面而系统的法律知识体系。
                        </p>
                        <p>通过对各类具体案例的深入分析，您将学会运用法律思维去理解和解决现实生活中的问题。不仅能明白自身的权利和义务，还能知晓如何在法律的框架内维护自身合法权益，以及尊重他人的权利。</p>
                        <p>无论是对于培养法治观念，还是为进一步学习专业法律知识打下坚实基础，法律基础课程都具有不可替代的重要作用。它将赋予您理性看待社会现象、遵循法律规范的能力，助力您成为一名知法、守法、用法的新时代公民。 </p>
                    </div>
                    <div class="box">
                        <h3>教你玩转Python编程 <a class="smaller_word">编号C3</a></h3>
                        <p>Python 是一种强大且易学的编程语言。</p>
                        <p>在这门课中，无论您是零基础还是有一定基础，都能学习其基础知识，如变量、数据类型、控制结构等。通过实践练习和项目，掌握解决问题的能力，了解其在 Web 开发、数据分析等领域的应用。</p>
                        <p>课程注重理论与实践结合，教师悉心指导。选择这门课，提升多种能力，为未来投资！快来探索 Python 的无限可能！ </p>
                    </div>
                    <div class="box">
                        <h3>书法之美 <a class="smaller_word">编号C4</a></h3>
                        <p>书法，是汉字的艺术表现形式。在“书法之美”这门课中，您将领略汉字书写的独特魅力。</p>
                        <p>从基本笔画到结构布局，从传统字帖临摹到个人风格探索，我们将带您逐步深入书法的世界。</p>
                        <p>在这里，您不仅能提升书写技巧，更能感受书法所蕴含的文化底蕴和审美情趣，培养耐心与专注力。</p>
                        <p>让我们一起在笔墨间，发现书法之美，传承中华优秀传统文化。 </p>
                    </div>
                    <div class="box">
                        <h3>探索宇宙 <a class="smaller_word">编号C5</a></h3>
                        <p>在“探索宇宙”这门课中，我们将开启一场浩瀚无垠的星际之旅。</p>
                        <p>从太阳系的奥秘到遥远星系的奇幻，从恒星的诞生到黑洞的神秘，您将深入了解宇宙的种种奇观。</p>
                        <p>通过精彩的影像、科学理论和前沿研究，激发您对宇宙的无限好奇与探索欲望。</p>
                        <p>一同踏上这充满未知与惊喜的宇宙探索征程！ </p>
                    </div>

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
