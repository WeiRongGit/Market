<%@ page language="java" import="java.util.*,goodlist.*"
	pageEncoding="UTF-8"%>
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

<title>My JSP 'getOne.jsp' starting page</title>

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
	<%
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String tableName = request.getParameter("table");

		GoodList showList = null;

		if (tableName.equals("clothes")) {
			showList = clothes;
		} else if (tableName.equals("shoes")) {
			showList = shoe;
		} else if (tableName.equals("trousers")) {
			showList = trousers;
		}

		for (Goods good : showList.getGoodList()) {
			if (good.getId() == id) {
				Goods g = new Goods();
				g.setId(good.getId());
				g.setName(good.getName());
				g.setPrice(good.getPrice());
				g.setSave(good.getSave());
				g.setSrc(good.getSrc());
				g.setBuyNum(good.getBuyNum());
				session.setAttribute("oneGood", g);
				session.setAttribute("whatTable", showList);
				response.sendRedirect("showOne.jsp");
				break;
			}
		}
	%>
</body>
</html>
