<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="GB2312"%>
<%@page import="java.sql.*" %>  <%--����java.sql��--%>
<html>
<head>
    <title >�鿴�������</title>
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
            out.print("���ݿ����ӳɹ���");
            out.print("<br />");
%>
<table border="2">
    <tr>
        <td width="100" user_id="title">�û�id</td>
        <td width="100" username="title">��Ʒ����</td>
        <td width="100" phone="title">��Ʒid</td>
        <td width="100" password="title">�۸�</td>
        <td width="100" birth="title">����</td>

    </tr>
    <%
        ResultSet rs = null;
        String sql = "SELECT * FROM car;";  //��ѯ���
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        out.print("��ѯ�����");
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
                out.print("����ʧ�ܣ�");
            }
        }catch (Exception e) {
            //e.printStackTrace();
            out.print("���ݿ������쳣��");
        }
    %>
</table>
<button onclick="location.href='gxuser.jsp';">�޸���Ϣ</button>
<button onclick="location.href='scuser.jsp';">ɾ����Ϣ</button>
</body>
</html>