<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>选课错误</title>
    <script>
        // 当页面加载完成后执行
        window.onload = function() {
            // 显示警告弹窗
            alert("每次只能选一节课！");

            // 延迟跳转，给用户一点时间看到弹窗
            setTimeout(function() {
                // 跳转到update.html页面
                window.location.href = 'http://localhost:8080/_war_exploded/course.jsp';
            }, 1000);
        };
    </script>
</head>
<body>
<script type="text/javascript" src="canvas-nest.min.js"></script>
<canvas height="926" width="1920" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;" id="c_n1"></canvas>
</body>
</html>
