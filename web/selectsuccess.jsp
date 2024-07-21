<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>选课成功</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f2f5;
            margin: 0;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #3498db;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            color: #666;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            background-color: #2ecc71;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #27ae60;
        }
        .container input[type="text"] {
            background-color: #f8f9fa; /* 浅灰色背景，增加可读性 */
            border: none; /* 移除边框 */
            padding: 5px; /* 内边距 */
            font-size: 16px; /* 字体大小与段落一致 */
        }
    </style>
</head>
<body>
<script type="text/javascript">
    window.onload = function() {
        var courseCode = localStorage.getItem('selectedCourseCode'); // 从localStorage获取
        if (courseCode) {
            document.getElementById('courseNum').value = courseCode; // 设置到输入框
        }
        if (courseCode === 'C1') {
            document.getElementById('courseInput').value = '西方艺术鉴赏';
            document.getElementById('courseTime').value = '周一 9-10节课';
            document.getElementById('courseLocation').value = 'S5 302';
        } else if (courseCode === 'C2') {
            document.getElementById('courseInput').value = '法律基础';
            document.getElementById('courseTime').value = '周二 9-10节课';
            document.getElementById('courseLocation').value = 'S5 201';
        } else if (courseCode === 'C3') {
            document.getElementById('courseInput').value = '教你玩转 Python 编程';
            document.getElementById('courseTime').value = '周三 9-10节课';
            document.getElementById('courseLocation').value = 'N5 101';
        } else if (courseCode === 'C4') {
            document.getElementById('courseInput').value = '书法之美';
            document.getElementById('courseTime').value = '周四 9-10节课';
            document.getElementById('courseLocation').value = 'S3 201';
        } else if (courseCode === 'C5') {
            document.getElementById('courseInput').value = '探索宇宙';
            document.getElementById('courseTime').value = '周五 9-10节课';
            document.getElementById('courseLocation').value = 'S4 102';
        }
    };



</script>
<div class="container">
    <h1>选课成功！</h1>
    <p>您已成功选择以下课程：</p>
    <p><strong>课程名称：</strong> <input type="text" id="courseInput" readonly></p>
    <p><strong>课程代码：</strong> <input type="text" id="courseNum" readonly></p>
    <p><strong>上课时间：</strong> <input type="text" id="courseTime" readonly></p>
    <p><strong>上课地点：</strong> <input type="text" id="courseLocation" readonly></p>
    <a href="http://localhost:8080/_war_exploded/course.jsp" class="btn" style="background-color: #e74c3c; margin-left: 10px;">返回界面</a>
    <script type="text/javascript">
        document.getElementById('returnBtn').addEventListener('click', function() {
            var courseCode = document.getElementById('courseNum').value;
            localStorage.setItem('selectedCourseCode', courseCode); // 存储到localStorage
            // 这里可以添加代码来打开退课界面，如通过修改window.location或使用AJAX
        });
    </script>
</div>
</body>
</html>
