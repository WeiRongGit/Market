<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>出现了错误</title>
    
	  </head>
  
  <body>
  <jsp:include page="top.jsp"></jsp:include>
    <div class="center_container">  
           <br>  
           <br>  
           <h1> 错误信息   </h1>  
           <hr>  
            
           <h3><%=exception.toString()%></h3>  
           <br>  
           <br>  
           <br>  
           
           <a href="javascript: history.back();">返回</a>  
       </div>  
       <jsp:include page="bottom.jsp"></jsp:include>
  </body>
</html>
