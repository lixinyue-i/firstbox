<%--
  Created by IntelliJ IDEA.
  User: gk190100
  Date: 2024/6/22
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除用户页面</title>
</head>
<body>
<!-- 用户ID输入框和删除按钮 -->
<div>
    <label for="userIdInput">输入用户ID:</label>
    <input type="text" id="userIdInput" placeholder="请输入用户ID">
    <button onclick="deleteUser()">删除用户</button>
</div>

<script>
    // 删除用户的函数
    function deleteUser() {
        var userId = document.getElementById('userIdInput').value;
        if (!userId) {
            alert('请输入用户ID');
            return;
        }

        if (confirm('确定要删除用户吗？')) {
            fetch(`/api/users/${userId}`, { method: 'DELETE' })
                .then(response => {
                    if (response.ok) {
                        alert('删除成功');
                        // 刷新页面或从页面上移除用户行
                       document.querySelector(`tr[data-user-id="${userId}"]`).remove();
                        window.location.reload(); // 刷新页面
                    } else {
                        alert('删除成功！');
                    }
                })
                .catch(error => {
                    console.error('删除用户时发生错误:', error);
                    alert('删除时发生网络错误');
                });
        }
    }
</script>

</body>
</html>
