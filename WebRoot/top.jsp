<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">



<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/css.css" />
</head>

</head>

<body>
	<div class="center_container">
	<jsp:useBean id="trousers" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="shoe" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="clothes" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="customer" class="person.Person" scope="session"></jsp:useBean>
		<%
			if (clothes.getTable() == null)
				clothes.setTable("clothes");
			clothes.updateGoodList();
		%>
		<%
			if (shoe.getTable() == null)
				shoe.setTable("shoes");
			shoe.updateGoodList();
		%>
		<%
			if (trousers.getTable() == null)
				trousers.setTable("trousers");
			trousers.updateGoodList();
		%>
		<!-- 图片 -->
		<div id="top_img">
			<img src="image/main02.png">
		</div>
	<!-- 导航栏 -->

		<div id="inclu_nav">
			<ul class="nav">
				
					<li><a target="_blank" href="index.jsp">首&nbsp;&nbsp;&nbsp;页</a></li>
					<li><a target="_blank" href="#"
						onclick="gos('<%=shoe.getTable()%>');return false;">休闲鞋</a></li>
					<li><a target="_blank" href="#"
						onclick="gos('<%=clothes.getTable()%>');return false;">炫酷卫衣</a></li>
					<li><a target="_blank" href="#"
						onclick="gos('<%=trousers.getTable()%>');return false;">长裤</a></li>
			</ul>
		</div>
		<!-- 从数据库提取数据 -->
		<div id="csr">
			<%
			if (customer.isIs_logic()) {
		%>
			尊敬的:<%=customer.getName() + "  "%>
			欢迎你！ <a href="showCar.jsp">点击查看购物车</a>
			<%
			} else {
		%>
			<a href="logic.jsp">请先登录</a>
			<%
				}
			%>
			
		</div>




	</div>

</body>
</html>
