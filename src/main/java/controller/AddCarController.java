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


@WebServlet("/addcar.do")
public class AddCarController extends HttpServlet{
    private static final long serialVersionUID = 7804524886360637172L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            HttpSession session= request.getSession();

            String id = request.getParameter("id");

            Object  user_id= session.getAttribute("user_id");
            //1查询
            //查询商品
            String sql="SELECT * FROM goods WHERE goods_id=?";

            Connection connection= JDBCUtils.getConnection();
            PreparedStatement stmt =  connection.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            Good good=new Good();

            while (rs.next()) {
                good.setGoods_id(rs.getString("goods_id"));
                good.setGoods_name(rs.getString("goods_name"));
                good.setUnitprice(rs.getString("unitprice"));
                good.setDetails(rs.getString("details"));
                good.setPic(rs.getString("photo"));


            }

            //2添加到数据库
                // 检查购物车中是否已有该商品
                String checkSql = "SELECT * FROM car WHERE goods_id=? AND user_id=?";
                PreparedStatement checkStmt = connection.prepareStatement(checkSql);
                checkStmt.setString(1, good.getGoods_id());
                checkStmt.setString(2, user_id.toString());
                ResultSet checkRs = checkStmt.executeQuery();
                boolean exists = checkRs.next(); // 检查是否已有记录

                if (!exists) {
                    // 如果不存在，插入新记录
                    String sqladd = "INSERT INTO car (goods_id, goods_name,unitprice,quantity,user_id,pic) VALUES (?,?,?,?,?,?)";
                    PreparedStatement insertStmt = connection.prepareStatement(sqladd);
                    insertStmt.setString(1, good.getGoods_id());
                    insertStmt.setString(2, good.getGoods_name());
                    insertStmt.setString(3, good.getUnitprice());
                    insertStmt.setString(4, "1");
                    insertStmt.setString(5, user_id.toString());
                    insertStmt.setString(6, good.getPic());
                    int res = insertStmt.executeUpdate();
                    if (res > 0) {
                        System.out.println("插入成功");
                    }
                    insertStmt.close();
                } else {
                    // 如果存在，更新数量
                    String updateSql = "UPDATE car SET quantity = quantity + 1 WHERE goods_id=? AND user_id=?";
                    PreparedStatement updateStmt = connection.prepareStatement(updateSql);
                    updateStmt.setString(1, good.getGoods_id());
                    updateStmt.setString(2, user_id.toString());
                    int updateResult = updateStmt.executeUpdate();
                    if (updateResult > 0) {
                        System.out.println("更新成功");
                    }
                    updateStmt.close();
                }



            //3返回购物车
            String carsql="select * from car where user_id=?";

            stmt =  connection.prepareStatement(carsql);
            stmt.setString(1, user_id.toString());

            //查询商品

             rs = stmt.executeQuery();
            Car car=null;
            List<Car> carList=new ArrayList<>();


            while (rs.next()) {
                car=new Car();
                car.setGoods_id(rs.getString("goods_id"));
                car.setGoods_name(rs.getString("goods_name"));
                car.setUnitprice(rs.getString("unitprice"));
                car.setQuantity(rs.getString("quantity"));
                car.setPic(rs.getString("pic"));
                carList.add(car);

            }
            connection.close();

            request.getSession().setAttribute("carList", carList);
            response.sendRedirect("car.jsp");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String goodsId = request.getParameter("goods_id");
            String userId = request.getParameter("user_id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            System.out.println("1到dopost里，goodsId:"+goodsId+"userid"+userId+"quantity"+quantity);

            Connection connection = JDBCUtils.getConnection(); // 获取数据库连接
            String sql = "UPDATE car SET quantity = ? WHERE goods_id = ? AND user_id = ?"; // 准备 SQL 更新语句
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, quantity);
            stmt.setString(2, goodsId);
            stmt.setString(3, userId); // 假设这是获取当前用户ID的函数
            System.out.println("2到dopost里，goodsId:"+goodsId+"userid"+userId+"quantity"+quantity);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                // 更新成功
                response.getWriter().write("{ \"success\": true }");
            } else {
                // 未找到记录或更新失败
                System.out.println("weizhaodaojilu");
                response.getWriter().write("{ \"success\": false, \"message\": \"数据库更新失败\" }");
            }

            stmt.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("失败");
            response.getWriter().write("{ \"success\": false, \"message\": \"" + e.getMessage() + "\" }");
        }
    }



}