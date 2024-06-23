<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商城首页</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/shouye.css"/>
    <script src="js/jquery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/front_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/lunbo.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<%String user_id = request.getParameter("user_id");%>
<div class="head">
    <div class="head_zi">
        <div class="huan">
            <a href="注册.jsp">
                <%
                String userId = (String) request.getSession().getAttribute("user_id");
                String message = (userId == null) ? "未登录，请先登录！" : ("尊敬的<a href='manage.jsp'>" + userId + "</a>,欢迎您！");
                %>
                <%= message %></a>
        </div>
        <div class="car">
            <a href="car.jsp"><img src="images/购物车.png" height="28px">
                <span>购物车</span>
            </a>
        </div>
        <div class="login">
            <div><a href="注册.jsp">登录</a></div>
            <div><a href="注册.jsp">注册</a></div>
        </div>

    </div>
</div>
<!--搜索框-->
<div class="search_kuang">
    <div class="search">
        <input type="text" class="text">
        <button><img src="images/搜索图标.png" width="40px"></button>
    </div>
</div>
<div class="shop">
    <div class="lunbo" >
        <span class="right" id="right"></span>
        <span class="left" id="left"></span>
        <div id="lunbo" >
            <div>
                <a href="menu/home.html"><img src="images/1.jpg" ></a>
            </div>
            <div>
                <a href="menu/home.html"><img src="images/2.jpg" ></a>
            </div>
            <div>
                <a href="menu/home.html"><img src="images/3.jpg"></a>
            </div>
            <div>
                <a href="menu/home.html"><img src="images/4.jpg" ></a>
            </div>
            <div>
                <a href="menu/home.html"><img src="images/5.png"></a>
            </div>
        </div>
    </div>
    <div class="nei">
        <div class="box_tit w">
            <h2 class="title">笔</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=bi01">
                            <div class="ph">
                                <img src="images/bi/1.jpg" >
                            </div>
                            <div class="na">狼毫毛笔</div>
                            <p>￥199</p>
                        </a>
                    </li>

                    <li class="phone_tu">
                        <a href="./detail.do?id=bi02">
                            <div class="ph">
                                <img src="images/bi/2.jpg" >
                            </div>
                            <div class="na">兼毫毛笔</div>
                            <p>￥29</p>
                        </a>
                    </li>

                    <li class="phone_tu">
                        <a href="./detail.do?id=bi03">
                            <div class="ph">
                                <img src="images/bi/3.jpg" >
                            </div>
                            <div class="na">
                                羊毫毛笔
                            </div>
                            <p>￥199</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=bi04">
                            <div class="ph">
                                <img src="images/bi/4.jpg" >
                            </div>
                            <div class="na">
                                大明笔庄
                            </div>
                            <p>￥35</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=bi05">
                            <div class="ph">
                                <img src="images/bi/5.jpg" >
                            </div>
                            <div class="na">大明笔庄 九狼一羊</div>
                            <p>￥99.20</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=bi02">
                            <div class="ph">
                                <img src="images/bi/2.jpg" >
                            </div>
                            <div class="na">毛笔</div>
                            <p>￥29</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=bi03">
                            <div class="ph">
                                <img src="images/bi/3.jpg" >
                            </div>
                            <div class="na">
                                毛笔
                            </div>
                            <p>￥199</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=bi04">
                            <div class="ph">
                                <img src="images/bi/4.jpg" >
                            </div>
                            <div class="na">
                                毛笔
                            </div>
                            <p>￥35</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="box_tit w">
            <h2 class="title">纸</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com01">
                            <div class="ph">
                                <img src="images/zhi/4.jpg" >
                            </div>
                            <div class="na">纸张</div>
                            <p>￥9</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com02">
                            <div class="ph">
                                <img src="images/zhi/1.jpg" >
                            </div>
                            <div class="na">纸张</div>
                            <p>￥1</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com03">
                            <div class="ph">
                                <img src="images/zhi/2.jpg" >
                            </div>
                            <div class="na">
                                纸张
                            </div>
                            <p>￥4</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com04">
                            <div class="ph">
                                <img src="images/zhi/3.jpg" >
                            </div>
                            <div class="na">
                                纸
                            </div>
                            <p>￥5</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com01">
                            <div class="ph">
                                <img src="images/zhi/4.jpg" >
                            </div>
                            <div class="na">纸</div>
                            <p>￥3</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com02">
                            <div class="ph">
                                <img src="images/zhi/1.jpg" >
                            </div>
                            <div class="na">纸</div>
                            <p>￥1</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com03">
                            <div class="ph">
                                <img src="images/zhi/2.jpg" >
                            </div>
                            <div class="na">
                                纸
                            </div>
                            <p>￥3</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com04">
                            <div class="ph">
                                <img src="images/zhi/3.jpg" >
                            </div>
                            <div class="na">
                                宣纸
                            </div>
                            <p>￥3</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="box_tit w">
            <h2 class="title">墨</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home01">
                            <div class="ph">
                                <img src="images/mo/1.jpg" >
                            </div>
                            <div class="na">
                                墨
                            </div>
                            <p>￥7</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home02">
                            <div class="ph">
                                <img src="images/mo/2.jpg" >
                            </div>
                            <div class="na">墨</div>
                            <p>￥9</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home03">
                            <div class="ph">
                                <img src="images/mo/3.jpg" >
                            </div>
                            <div class="na">
                                墨
                            </div>
                            <p>￥13</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home04">
                            <div class="ph">
                                <img src="images/mo/4.jpg" >
                            </div>
                            <div class="na">
                                墨
                            </div>
                            <p>￥12</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home01">
                            <div class="ph">
                                <img src="images/mo/1.jpg" >
                            </div>
                            <div class="na">
                                墨
                            </div>
                            <p>￥7</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home02">
                            <div class="ph">
                                <img src="images/mo/2.jpg" >
                            </div>
                            <div class="na">墨</div>
                            <p>￥7</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home03">
                            <div class="ph">
                                <img src="images/mo/3.jpg" >
                            </div>
                            <div class="na">
                                墨
                            </div>
                            <p>￥13</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home04">
                            <div class="ph">
                                <img src="images/mo/4.jpg" >
                            </div>
                            <div class="na">
                                墨
                            </div>
                            <p>￥12</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="box_tit w">
            <h2 class="title">砚</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan01">
                            <div class="ph">
                                <img src="images/yan/1.jpg" >
                            </div>
                            <div class="na">砚</div>
                            <p>￥29</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan02">
                            <div class="ph">
                                <img src="images/yan/2.jpg" >
                            </div>
                            <div class="na">砚</div>
                            <p>￥35</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan03">
                            <div class="ph">
                                <img src="images/yan/3.jpg" >
                            </div>
                            <div class="na">
                                砚
                            </div>
                            <p>￥13</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan04">
                            <div class="ph">
                                <img src="images/yan/4.jpg" >
                            </div>
                            <div class="na">
                                砚
                            </div>
                            <p>￥15</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan01">
                            <div class="ph">
                                <img src="images/yan/1.jpg" >
                            </div>
                            <div class="na">砚</div>
                            <p>￥29</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan02">
                            <div class="ph">
                                <img src="images/yan/2.jpg" >
                            </div>
                            <div class="na">砚</div>
                            <p>￥35</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan03">
                            <div class="ph">
                                <img src="images/yan/3.jpg" >
                            </div>
                            <div class="na">
                                砚
                            </div>
                            <p>￥13</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=yan04">
                            <div class="ph">
                                <img src="images/yan/4.jpg" >
                            </div>
                            <div class="na">
                                砚
                            </div>
                            <p>￥21</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="nav">
    <ul>
        <li class="current">笔</li>
        <li>纸</li>
        <li>墨</li>
        <li>砚</li>
        <div class="back">返回顶部</div>
    </ul>
</div>

<div class="footer">
    <div class="translate">
        <div class="footer-links">
            <h5>购物指南</h5>
            <ul>
                <li><a href="#">购物流程</a></li>
                <li><a href="#">会员介绍</a></li>
                <li><a href="#">生活旅行</a></li>
                <li><a href="#">常见问题</a></li>
                <li><a href="#">联系客服</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>支付方式</h5>
            <ul>
                <li><a href="#">信用卡</a></li>
                <li><a href="#">货到付款</a></li>
                <li><a href="#">在线付款</a></li>
                <li><a href="#">分期付款</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>售后服务</h5>
            <ul>
                <li><a href="#">售后政策</a></li>
                <li><a href="#">退款说明</a></li>
                <li><a href="#">返修/退换货</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>帮助中心</h5>
            <ul>
                <li><a href="#">账户管理</a></li>
                <li><a href="#">自助服务</a></li>
                <li><a href="#">订单操作</a></li>
                <li><a href="#">服务网点</a></li>
                <li><a href="#">授权体验店/专区</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>关于我们</h5>
            <ul>
                <li><a href="#">新浪微博</a></li>
                <li><a href="#">官方微信</a></li>
                <li><a href="#">联系我们</a></li>
                <li><a href="#">加入我们</a></li>
                <li><a href="#">公益基金会</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
