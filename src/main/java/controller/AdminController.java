package controller;

import User.user;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import service.UserService2;


//@WebServlet("/checkPermission")
//public class AdminControll<User> extends HttpServlet {
//    private static final long serialVersionUID = 7804524886360637172L;
//    public AdminControll() {
//        super();
//
//    }
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // 从请求中获取id参数
//        String id = request.getParameter("id");
//
//        if (id == null || id.isEmpty()) {
//            // 如果id为空或不存在，可以重定向到错误页面或显示错误信息
//            response.sendRedirect("error.jsp");
//            return;
//        }
//
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8"); // 设置响应的内容类型
//
//        // 查询用户
//        String sql = "SELECT power FROM user WHERE user_id=?"; // 查询特定列并正确使用?占位符
//
//        Connection connection = JDBCUtils.getConnection();
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setString(1, id); // 设置参数值
//            try (ResultSet rs = stmt.executeQuery()) {
//                if (rs.next()) { // 假设只有一个匹配的用户ID
//                    User user = new User();
//                    user.setPower(rs.getInt("power"));
//
//                    // 检查权限值
//                    int power = user.getPower();
//                    if (power == 0) {
//                        // 权限不足或没有设置权限，允许跳转到first.jsp
//                        response.sendRedirect("first.jsp");
//                    } else {
//                        // 权限足够，不允许跳转到first.jsp，可以重定向到其他页面
//                        response.sendRedirect("manage.jsp");
//                    }
//                } else {
//                    // 用户不存在，可以重定向到错误页面或显示错误信息
//                    response.sendRedirect("error.jsp");
//                }
//            }
//        } catch (SQLException e) {
//            // 处理数据库查询异常
//            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
//        } finally {
//            // 关闭数据库连接（假设JDBCUtils.getConnection()提供了连接池）
//            // 如果不是连接池，则需要在finally块中关闭Connection
//        }
//    }
//        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        doGet(request, response);
//    }
//}