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

<title>登陆</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/css.css">
	

</head>

<body>
	
	<jsp:include page="top.jsp"></jsp:include>
	<div class="center_container">
	<jsp:useBean id="customer" class="person.Person" scope="session"></jsp:useBean>
		<%
		
			
			
			//如果登陆就显示登陆并返回主页面
			if (customer.isIs_logic()) {
				String name = (String) session.getAttribute("csr_Name");
				out.print("亲爱的" + customer.getName() + " 你已经登陆      3秒后回到首页");
				response.setHeader("refresh", "3;URL=index.jsp");
			} else {
		%>
				<%
					int number = (int)(Math.random()*100000);
					session.setAttribute("n", number);
				 %>
		<form action="prove.jsp" method="post">
			<table>
				
				<tr>
					<td>账户</td>
					<td><input type="text" name="csr_Name" class="input"></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="password" name="csr_PassWord" class="input"></td>
				</tr>
				<tr>
					<td>验证码</td>
					<td><input type="text" name="validation">&nbsp;<%=number %>  </td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="登陆"> <input type="reset" value="重置"></td>
				</tr>

			</table>
		</form>


		<%
			}
		%>



	</div>

	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
