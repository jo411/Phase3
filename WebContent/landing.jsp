<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.Serializable" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<% 
	
Connector con= new Connector();
	User user = driver.loginUser(con.stmt,request.getParameter("username"),request.getParameter("password"));
	if(user==null)
	{
%>
  <b>Incorrect Username or Password</b> <BR><BR>
	
<%
	}
	else
	{
		session.setAttribute("user", user); 
		
		%>
		<a href="greeting.jsp">Greet</a>
		<%
	}
	
	
%>

</body>
</html>