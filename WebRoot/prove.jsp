<%@page import="person.Person"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
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

<title>My JSP 'prove.jsp' starting page</title>

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
	<%
		int yz = (Integer)session.getAttribute("n");
		int va = 0;
		try{
		 va = Integer.parseInt(request.getParameter("validation"));
			
		}catch(NumberFormatException e){
		throw new NumberFormatException("验证码必须是数字");

		}
		
		if (yz == va) {
			if (Person.checkUser("users",
					Person.toChinese(request.getParameter("csr_Name")),
					Person.toChinese(request.getParameter("csr_PassWord")))) {
	%>
	<jsp:useBean id="customer" class="person.Person" scope="session"></jsp:useBean>
	<jsp:setProperty property="name" name="customer"
		value='<%=Person.toChinese(request.getParameter("csr_Name"))%>' />
	<jsp:setProperty property="passWord" name="customer"
		value='<%=Person.toChinese(request
							.getParameter("csr_PassWord"))%>' />
	<%
		customer.setIs_logic(true);
				response.sendRedirect("index.jsp");
			}

		} else {

			response.sendRedirect("logic.jsp");
		}
	%>


</body>
</html>
