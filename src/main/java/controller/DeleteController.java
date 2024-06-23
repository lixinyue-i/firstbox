package controller;

import beans.Car;
import beans.Good;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//import service.UserService2;
@WebServlet("/delete-cart-item")
class DeleteCarController extends HttpServlet{
    private static final long serialVersionUID = 7804524886360637172L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    //    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            String goodsId = request.getParameter("goods_id");
//            // String userId = request.getParameter("user_id"); // 如果需要
//
//            Connection connection = JDBCUtils.getConnection(); // 获取数据库连接
//            String sql = "DELETE FROM car WHERE goods_id=?"; // 准备 SQL 删除语句
//            PreparedStatement stmt = connection.prepareStatement(sql);
//            stmt.setString(1, goodsId);
//            // stmt.setString(2, userId); // 如果需要
//
//            int rowsAffected = stmt.executeUpdate();
//            if (rowsAffected > 0) {
//                // 如果受影响的行数大于0，则删除成功
//                response.getWriter().write("{ \"success\": true }");
//            } else {
//                // 如果没有行被删除，返回错误
//                response.getWriter().write("{ \"success\": false, \"message\": \"商品未找到或已删除\" }");
//            }
//
//            stmt.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            response.getWriter().write("{ \"success\": false, \"message\": \"" + e.getMessage() + "\" }");
//        }
//    }
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String goodsId = request.getParameter("goods_id");
            String userId = request.getParameter("user_id"); // 如果需要
            String action = request.getParameter("action");

            if ("remove".equals(action)) {
                Connection connection = JDBCUtils.getConnection(); // 获取数据库连接
                String sql = "DELETE FROM car WHERE goods_id=? AND user_id=?"; // 准备 SQL 删除语句
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setString(1, goodsId);
                stmt.setString(2, userId); // 假设您已经从会话中获取了用户ID

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    // 如果受影响的行数大于0，则删除成功
                    response.getWriter().write("{ \"success\": true }");
                } else {
                    // 如果没有行被删除，返回错误
                    response.getWriter().write("{ \"success\": false, \"message\": \"商品未找到或已删除\" }");
                }

                stmt.close();
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{ \"success\": false, \"message\": \"" + e.getMessage() + "\" }");
        }
    }
}