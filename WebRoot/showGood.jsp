<%@page import="goodlist.GoodList"%>
<%@page import="goodlist.Goods"%>
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

<title>购物狂欢</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<jsp:useBean id="customer" class="person.Person" scope="session"></jsp:useBean>

<script type="text/javascript" src="js/js.js"></script>

<body>
	<%
		GoodList showList = (GoodList) session.getAttribute("showList");
	%>
	<jsp:include page="top.jsp"></jsp:include>
	<div class="center_container">

		<%
			for (Goods good : showList.getGoodList()) {
		%>
		<div class="img">
			<a target="_blank" href="#"
				onclick="see('<%=good.getId()%>','<%=showList.getTable()%>');return false;">
				<img src="<%=good.getSrc()%>" width="260" height="260">
			</a>
			<div class="desc"><%=good.getName()%></div>
		</div>
		<%
			}
		%>




	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
