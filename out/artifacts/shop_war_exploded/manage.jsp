<%@ page import="java.sql.Connection" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户权限检查</title>
</head>
<body>
<%
    String userId = (String) request.getSession().getAttribute("user_id");
    if (userId == null) {
        // 用户未登录或会话已失效
        response.sendRedirect("注册.jsp"); // 重定向到登录页面
        return;
    }

    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
        // 显示错误消息
        out.println("<p style='color: red;'>" + errorMessage + "</p>");
        return;
    }

    Connection connection = JDBCUtils.getConnection();
    String sql = "SELECT power FROM user WHERE user_id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setString(1, userId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int power = rs.getInt("power");
            if (power == 1) {
                // 用户是管理员
                response.sendRedirect("hotai.jsp"); // 跳转到管理员页面
            } else {
                // 用户是普通用户
                out.println("<p>非管理员操作！非法操作</p>");
            }
        } else {
            // 用户ID在数据库中未找到
            out.println("<p>用户不存在或已被删除</p>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access failed");
    }
%>
</body>
</html>
