 <%@page import="goodlist.GoodList"%>
<%@page import="goodlist.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	<jsp:useBean id="customer" class="person.Person" scope="session"></jsp:useBean>
		<%
			Goods good = (Goods) session.getAttribute("oneGood");
			GoodList showList = (GoodList) session.getAttribute("whatTable");
			 if( customer.getMyCar().findById( good.getId() ) != null){
			 	good = customer.getMyCar().findById( good.getId());
			 }
		%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title><%=good.getName() %></title>

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
<script type="text/javascript">
  function  check(id,save,table,has)
	    {
	    	var have = parseInt(has);
	      	if(!<%=customer.isIs_logic()%> ){
	      	 alert("请先登录");
	      	  location.href="logic.jsp";
	      	}else{
	    
	        var buynum=document.getElementById("buynum"+id).value;
	      	 var saves=parseInt(save);
	      	 var bu = parseInt(buynum);
	        if(bu + have<0){
	             bu= -have;
	        }
	        else if(bu + have>saves){
	        
	             alert("不能超过库存量!");
	             
	             bu=saves - have;
	        }else{
	        location.href="carDeal.jsp?action=buy&id="+id+"&buynum="+bu+"&tableName="+table;
	        }
	      
	      	}
	    }

</script>
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<div class="center_container">
		<table border="2">
			<tr>
				<td rowspan="4"><img alt="" src="<%=good.getSrc()%>"></td>
				<td>商品名字:<%=good.getName()%>   编号：<%=good.getId()%></td>
			
			</tr>
			<tr>
				<td>商品单价:<%=good.getPrice()%></td>

			</tr>
			<tr><td>商品库存:<%=good.getSave()%>  已添加<%=good.getBuyNum() %>件</td></tr>
			<tr>
				<td><input type="button" value="-" onclick="decrease(<%=good.getId()%> , <%=good.getSave()%> )">
					<input type="text" style="font-size:20px;" size=5 name="buynum" id="buynum<%=good.getId()%>" /> 
					<input type="button" value="+"	onclick="increase(<%=good.getId()%>,<%=good.getSave()%>,<%=good.getBuyNum()%> )"><br />
					<input type="button" value="加入购物车" 	onclick="check('<%=good.getId()%>','<%=good.getSave()%>','<%=showList.getTable()%>',<%=good.getBuyNum() %>)" /></td>
			

			</tr>

		</table>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
