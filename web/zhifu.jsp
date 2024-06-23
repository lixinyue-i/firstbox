<%--
  Created by IntelliJ IDEA.
  User: lixinyue
  Date: 2024/6/21
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>支付页面</title>
</head>
<body>
<h1>选择支付方式</h1>
<form id="paymentForm">
    <input type="radio" name="paymentMethod" value="wechat"> 微信支付
    <input type="radio" name="paymentMethod" value="alipay"> 支付宝支付
</form>

<h2>填写收货信息</h2>
<form id="addressForm">
    <label for="consignee">收件人:</label>
    <input type="text" id="consignee" name="consignee" required>

    <label for="address">地址:</label>
    <input type="text" id="address" name="address" required>

    <form action="success.html" method="post">
        <!-- 表单内容 -->
        <button type="submit" id="submitBtn"> <a href="success.html">提交</a></button>
    </form>

</body>
</html>
