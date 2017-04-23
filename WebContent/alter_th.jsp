   <%@ page language="java" import="cs5530.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
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

<head>Here are your THs</head>
<BR>
<%

ArrayList<TH> thList=driver.getUserTH((Connector)session.getAttribute("connector"), (User)session.getAttribute("user"));

int count=1;
for(TH current:thList)
{
	out.println(count+": "+current.toString()+"<BR><BR>");
	count++;
}

if(count==1)
{
	out.println("No matches found <BR><BR>");
}

session.setAttribute("userTH",thList);
%>
	<form action="th_options.jsp">
Give the number of the TH you wish to edit:<input type="text" name="alterIndex">		
<input type="submit" value="Edit" />
</form>
<BR>

 


</body>
</html>