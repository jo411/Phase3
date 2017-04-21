<%@ page language="java" import="cs5530.*" import ="java.util.*" contentType="text/html; charset=ISO-8859-1"
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

<%
ArrayList<Availability> listA = driver.getDatesList(((Connector)session.getAttribute("connector")).stmt, (TH)session.getAttribute("alterTH"));


int count=1;
for(Availability current:listA)
{
	out.println(count+": "+current.ToString()+"<BR><BR>");
	count++;
}

if(count==1)
{
	out.println("No matches found <BR><BR>");
}
%>

	<form action="removeAvailability.jsp">
Give the number of the availability you wish to remove:<input type="text" name="availIndex">	
<input type="hidden" name="removeFlag">	
<input type="submit" value="Remove" />
</form>
<BR>

<%
if(request.getParameter("removeFlag")!=null)
{
	int index = Integer.parseInt(request.getParameter("availIndex"));
	index--;
	driver.removePeriod(((Connector)session.getAttribute("connector")).stmt, listA.get(index).pid);
}
%>


</body>
</html>