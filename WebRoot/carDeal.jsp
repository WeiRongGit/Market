<%@page import="goodlist.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	errorPage="error.jsp"%>
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

<title>My JSP 'carDeal.jsp' starting page</title>

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
		//设置只执行一次下面这一段代码

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");

		if (action == null) {
			action = "";
		} else if ("buy".equals(action)) {
			ArrayList<Goods> List = null;
			String tableName = request.getParameter("tableName");
			if (tableName.equals("clothes")) {
				List = clothes.getGoodList();
			} else if (tableName.equals("shoes")) {
				List = shoe.getGoodList();
			} else if (tableName.equals("trousers")) {
				List = trousers.getGoodList();
			}
			int goodId = Integer.parseInt(request.getParameter("id"));

			for (Goods good : List) {
				if (good.getId() == goodId) {
					Goods temp = new Goods();
					temp.setId(good.getId());
					temp.setSrc(good.getSrc());
					temp.setName(good.getName());
					temp.setSave(good.getSave());
					temp.setPrice(good.getPrice());
					try {

						customer.getMyCar().addGood(
								temp,
								Integer.parseInt(request
										.getParameter("buynum")));
					} catch (NumberFormatException e) {
					throw	new NumberFormatException("请输入数字");
					}
					break;
				}
			}
		} else if ("clear".equals(action)) {
			customer.getMyCar().clear();
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
		} else if ("change".equals(action)) {
			int goodId = Integer.parseInt(request.getParameter("id"));
			int num = 0;
			try {
				num = Integer.parseInt(request.getParameter("buynum"));

			} catch (NumberFormatException E) {
				throw new NumberFormatException("请输入数字");
			}

			customer.getMyCar().change(goodId, num);
			response.sendRedirect("showCar.jsp");
		}

		response.sendRedirect("showOne.jsp");
	%>

</body>
</html>
