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

<b>Here are some recommendations based on your Reservation</b>


<P>TH found matching the search parameters:</P>			

		<BR>
		<%	
		ArrayList<TH> thList = driver.getRecomendationsList((Connector)session.getAttribute("connector"), (User)session.getAttribute("user"), (TH)session.getAttribute("currentTH"));
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
		%>
			<form action="view_th.jsp">
		Give the number of the TH you wish to view:<input type="text" name="index">		
		<input type="submit" value="View" />
		</form>
		<BR>

<p>Hello, <%=session.getAttribute("user") %>!</p>


</body>
</html>