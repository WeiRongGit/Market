<%@page import="goodlist.GoodList"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@page
	import="goodlist.Goods"%>
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

<title>My JSP 'addData.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<jsp:useBean id="clothes" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="shoe" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="trousers" class="goodlist.GoodList" scope="session"></jsp:useBean>
	<jsp:useBean id="customer" class="person.Person" scope="session"></jsp:useBean>
	<%
		GoodList showList = null;
		String tableName = request.getParameter("tableName");
		if (tableName.equals("clothes")) {
			showList = clothes;
		} else if (tableName.equals("shoes")) {
			showList = shoe;
		} else if (tableName.equals("trousers")) {
			showList = trousers;
		}
		session.setAttribute("showList",showList);
		response.sendRedirect("showGood.jsp");
	%>
</body>
</html>
