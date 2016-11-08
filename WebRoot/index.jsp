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

<title>首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/css.css" />
</head>
<script type="text/javascript" src="js/js.js"></script>
<body>
	
	<!-- 加载上文件 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 中间部分 -->
	<jsp:useBean id="shoe" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="clothes" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="trousers" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<div class="center_container">
		<div class="hr" >
			<a href="javascript:void(0)"  onclick="gos('<%=clothes.getTable()%>');"  >炫酷卫衣专区</a>
		</div>
		<%
			for (int i = 0; i < 3; i++) {
		%>

		<div class="img">
			<a  target="_blank" href="#" onclick="see('<%=clothes.getGoodList().get(i).getId()%>','<%=clothes.getTable() %>');return false;" > <img
				src="<%=clothes.getGoodList().get(i).getSrc()%>" width="260"
				height="260">
			</a>
			<div class="desc"><%=clothes.getGoodList().get(i).getName()%></div>
		</div>

		<%
			}
		%>
		<div class="hr">
			<a href="javascript:void(0)"  onclick="gos('<%=trousers.getTable()%>')"  >长裤专区</a>
		</div>
		<%
			for (int i = 0; i < 3; i++) {
		%>

		<div class="img">
			<a target="_blank" href="#" onclick="see('<%=trousers.getGoodList().get(i).getId()%>','<%=trousers.getTable() %>');return false;"> <img
				src="<%=trousers.getGoodList().get(i).getSrc()%>" width="260"
				height="260">
			</a>
			<div class="desc"><%=trousers.getGoodList().get(i).getName()%></div>
		</div>

		<%
			}
		%>
		<div class="hr">
			<a href="javascript:void(0)"  onclick="gos('<%=shoe.getTable()%>')"  >休闲鞋专区</a>
		</div>
		<%
			for (int i = 0; i < 3; i++) {
		%>

		<div class="img">
			<a target="_blank" href="#" onclick="see('<%=shoe.getGoodList().get(i).getId()%>','<%=shoe.getTable() %>');return false;"> <img
				src="<%=shoe.getGoodList().get(i).getSrc()%>" width="260"
				height="260">
			</a>
			<div class="desc"><%=shoe.getGoodList().get(i).getName()%></div>
		</div>

		<%
			}
		%>

		<!-- 中间部分结束 -->
	</div>
	<!-- 加载下文件 -->
	<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
