<%@ page language="java" import="cs5530.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<input type="button" onclick="location.href='main_menu.jsp';" value="Return to Menu" />
<p></p>
<%
	User user=(User)session.getAttribute("user");
	//Connector con = new Connector();
	Connector con = (Connector)session.getAttribute("connector");

if(request.getParameter("entries")==null){
	
	%>
	<form action="show_useful.jsp">
	Maximum Entries:<input type="text" name="entries" />
	<input type="submit" value="Get Users" />
</form>
	<%
}

else
{
	String display = driver.showUsefulUsers(con, user, Integer.parseInt(request.getParameter("entries"))).replace("\n", "<br>");
	%>
	<form action="show_useful.jsp">
	Maximum Entries:<input type="text" name="entries" />
	<input type="submit" value="Get Users" />
	</form>

	<p><%=display%></p>
	<%
	
	
}

%>


	
	

</body>
</html>