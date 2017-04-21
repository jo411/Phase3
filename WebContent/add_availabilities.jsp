<%@ page language="java" import="cs5530.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<input type="button" onclick="location.href='main_menu.jsp';" value="Return to Menu" />
<p></p>

<p>Hello, <%=session.getAttribute("user") %>!</p>

<p>Please choose a range for availability at this TH.</p>
<p>Use the format "yyyy-MM-dd"</p>

<form action="add_availabilities.jsp">
	Start Date:<input type="text" name="start"/><BR>
	End Date:<input type="text" name="end"/><BR>
	Price:<input type="text" name="price"/><BR>		
	<input type="hidden" name="addFlag" value=1 /><BR>
	<input type="submit" value="Add Availability" /><BR>
</form>

<%
if(request.getParameter("addFlag")!=null)
{
	driver.addAvailability(((Connector)session.getAttribute("connector")).stmt, (User)session.getAttribute("user"), (TH)session.getAttribute("alterTH"), 
			request.getParameter("start"), request.getParameter("end"), Integer.parseInt(request.getParameter("price")));
	
	
}
%>


</body>
</html>