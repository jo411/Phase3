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
User user=null;
String newFlag=request.getParameter("newFlag");
	if(newFlag!=null)//making a new login
	{	
		user=driver.registerUser(con.stmt, request.getParameter("username"), request.getParameter("password"),
				request.getParameter("name"), request.getParameter("address"), request.getParameter("phoneNumber"), 0);
		
	}else //logging in existing user
	{
	user = driver.loginUser(con.stmt,request.getParameter("username"),request.getParameter("password"));
	}
	
	if(user==null)
	{
		if(newFlag!=null)
		{
			%>
			  <b>Username Already Exists</b> <BR><BR>
			  <input type="button" onclick="location.href='new_user.jsp';" value="Try Again" />
				
			<%
		}else
		{
%>
  <b>Incorrect Username or Password</b> <BR><BR>
  <input type="button" onclick="location.href='login.jsp';" value="Try Again" />
	
<%
		}
	}
	else
	{
		session.setAttribute("user", user); 
		session.setAttribute("connector", con);
		
		%>
		<p>Hello, <%=session.getAttribute("user") %>!</p>
		<input type="button" onclick="location.href='main_menu.jsp';" value="Enter Site" />
		<%
	}
	
	//con.closeConnection();//TODO:maybe remove
%>

</body>
</html>