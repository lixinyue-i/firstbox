<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>  <%--导入java.sql包--%>
<html>
<head>
    <title >查看订单情况</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/shop?characterEncoding=utf-8&serverTimezone=Asia/Shanghai&useSSL=false",
                "root","1111");
        stmt = conn.createStatement();

        if(conn != null){
            out.print("数据库连接成功！");
            out.print("<br />");
%>
<table border="2">
    <tr>
        <td width="100" user_id="title">用户id</td>
        <td width="100" username="title">商品名称</td>
        <td width="100" phone="title">商品id</td>
        <td width="100" password="title">价格</td>
        <td width="100" birth="title">数量</td>

    </tr>
    <%
        ResultSet rs = null;
        String sql = "SELECT * FROM car;";  //查询语句
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        out.print("查询结果：");
        out.print("<br/>");
        while (rs.next()) {%>
    <tr>
        <td width="100"><%=rs.getString("user_id") %></td>
        <td width="100"><%=rs.getString("goods_name") %></td>
        <td width="100"><%=rs.getString("goods_id") %></td>
        <td width="100"><%=rs.getString("unitprice") %></td>
        <td width="100"><%=rs.getString("quantity") %></td>

    </tr>
    <%
                }
            }else{
                out.print("连接失败！");
            }
        }catch (Exception e) {
            //e.printStackTrace();
            out.print("数据库连接异常！");
        }
    %>
</table>
<button onclick="location.href='gxuser.jsp';">修改信息</button>
<button onclick="location.href='scuser.jsp';">删除信息</button>
</body>
</html>