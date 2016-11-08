<%@page import="car.Car"%>
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

<title>购物车</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript" src="js/js.js">
	   
	    
	   
	</script>
</head>

<body>
	<div class="center_container">
		<jsp:useBean id="customer" class="person.Person" scope="session"></jsp:useBean>
		<jsp:include page="top.jsp"></jsp:include>
		<%
			if(!customer.isIs_logic()){
				response.sendRedirect("logic.jsp");
			}		
			Car car = customer.getMyCar();
			if (car.getSize() == 0 || car == null) {
				out.print("<h1>目前购物车空空如也！</h1>");
		%>
		<a href="index.jsp">继续购物</a>
		<%
			} else {
		%>
		<table border="2" style="width: 93%;text-align: center;"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>编号</td>
				<td>图片</td>
				<td>名字</td>
				<td>数量</td>
				<td>单价</td>
				<td>总价</td>
				<td colspan="2">增加或者减少</td>
			</tr>
			<%
				double sum = 0;

					for (Goods good : car.getCar()) {
						out.print("<tr>");
						out.print("<td>" + good.getId() + "</td>");
			%>
			<td><img src="<%=good.getSrc()%>" width="200px" height="200px"></td>
			<%
				out.print("<td>" + good.getName() + "</td>");
						out.print("<td>" + good.getBuyNum() + "</td>");
						out.print("<td>" + good.getPrice() + "</td>");
						out.print("<td>" + car.getGoodSum(good) + "</td>");
			%>
			<td>
			<td><input type="button" value="-"
				onclick="car_decrease(<%=good.getId()%> , <%=good.getBuyNum()%> )">
				<input type="text" style="font-size:20px;" size=5 name="buynum"
				id="buynum<%=good.getId()%>" /> <input type="button" value="+"
				onclick="car_increase(<%=good.getId()%>,<%=good.getBuyNum() %>,<%=good.getSave()%> )"><br />
				<input type="button" value="修改"
				onclick="change(<%=good.getId()%>,<%=good.getBuyNum() %>,<%=good.getSave()%>)" /></td>

			</td>

			<%
				out.print("</tr>");

					}
			%>
			<tr>
				<td colspan="8">应付金额：<%=car.getCarSum()%></td>
			</tr>
			<tr>
				<td colspan="8"> <a href="javascript: history.back();">继续购物</a>  </td>
			</tr>
			<tr>
				<td colspan="8"><input type="button" onclick="clears()"
					value="清空购物车"></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>





</body>
</html>
