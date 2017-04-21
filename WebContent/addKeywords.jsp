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


<p>Please Enter the Keyword you wish to add.</p>


<form action="addKeywords.jsp">
	Keyword:<input type="text" name="keyW"/><BR>	
	<input type="hidden" name="addKeyFlag" value=1 /><BR>
	<input type="submit" value="Add Keyword" /><BR>
</form>

<%
if(request.getParameter("addKeyFlag")!=null)
{
	driver.addKeyword((TH)session.getAttribute("alterTH"),(Connector)session.getAttribute("connector"), (User)session.getAttribute("user"),  
			request.getParameter("keyW"));
	
	
}
%>

</body>
</html>