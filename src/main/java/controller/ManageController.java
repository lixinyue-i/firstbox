package controller;

import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManageController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userId = (String) request.getSession().getAttribute("user_id");
            if (userId == null) {
                // 用户未登录或会话已失效
                response.sendRedirect("注册.jsp"); // 重定向到登录页面
                return;
            }

            // 假设使用JDBCUtils来获取数据库连接
            Connection connection = JDBCUtils.getConnection();
            // 编写SQL查询语句来获取用户权限
            String sql = "SELECT power FROM users WHERE user_id = ?";
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
                        request.setAttribute("errorMessage", "非管理员操作！非法操作");
                        request.getRequestDispatcher("error.jsp").forward(request, response); // 转发到错误提示页面
                    }
                } else {
                    // 用户ID在数据库中未找到
                    request.setAttribute("errorMessage", "用户不存在或已被删除");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access failed");
        }
    }
}
