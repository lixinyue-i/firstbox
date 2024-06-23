

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>文房四宝商城购物车界面</title>
        <link rel="stylesheet" type="text/css" href="css/public.css"/>
        <link rel="stylesheet" type="text/css" href="css/carts.css"/>
        <script src="js/jquery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
    </head>
    <body>
    <%String goods_id = request.getParameter("goods_id");%>
    <%String user_id = request.getParameter("user_id");%>
        <div class="head">
            <div class="shouye_head">
                <a href="first.jsp">文房四宝商城首页</a>
            </div>
        </div>
        <div class="cart">
            <div class="cart-head">
                <div class="column g-select">
                    <div class="g-checkbox">
                        <input type="checkbox" class="all each">
                    </div>
                    全选
                </div>
                <div class="column g-images">图片</div>
                <div class="column g-goodsname">商品名称</div>
                <div class="column g-props">商品信息</div>
                <div class="column g-price">单价</div>
                <div class="column g-quantity">数量</div>
                <div class="column g-sum">小计</div>
                <div class="column g-action">操作</div>
            </div>

            <c:forEach items="${carList}" var="item">
                <div class="carts-goods">
                    <div class="cell c-select">
                        <div class="c-checkbox">
                            <input type="checkbox" class="each">
                        </div>
                    </div>
                    <div class="cell c-images">
                        <a href="./detail.do?id=${item.goods_id}" title="${item.goods_name}"><img src="${item.pic}" alt="${item.goods_name}"></a>
                    </div>
                    <div class="cell c-goodsname"><a href="#" title="${item.goods_name}">${item.goods_name}</a></div>
                    <div class="cell c-props">${item.goods_name}</div>
                    <div class="cell c-price">
                        <span>￥</span>
                        <div class="c-price_num">${item.unitprice}</div>
                    </div>
                    <div class="cell c-quantity">
                        <button type="button"  class="reduce">-</button>
                        <input type="text" value="${item.quantity}" class="text_num">
                        <button type="button" class="add">+</button>
                    </div>
                    <div class="cell c-sum">
                        <span>￥</span>
                        <div class="c-sum_num">${item.unitprice}</div>
                    </div>

                    <div class="cell c-action">
                        <a href="#" class="remove"
                           data-goods-id="<%= request.getSession().getAttribute("goods_id") %>"
                           data-user-id="<%= request.getSession().getAttribute("user_id") %>">移除商品</a>
                    </div>

                </div>

            </c:forEach>

        </div>
        <div class="payment">
            <div class="cart-pay">
                <div class="pay-left">
                    <div class="select_all">
                        <input type="checkbox" class="all each">
                        全选
                    </div>
                    <div class="goods_num">
                        已选择数量:
                        <span>0</span>
                        件
                    </div>
                </div>
                <div class="pay-right">
                    <div class="right_jie">
                        <div class="btn">
                            <a href="zhifu.jsp">结算</a>
                        </div>
                        <div class="price-sum">
                            <div class="price-show">总价是：</div>
                            <div class="show-money">
                                ￥
                                <span>00.00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">

        </script>
    </body>
</html>
