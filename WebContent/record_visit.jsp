<%@ page language="java" import="cs5530.*" import= "java.util.*" contentType="text/html; charset=ISO-8859-1"
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


<%
Connector con= (Connector)session.getAttribute("connector");
User user = (User)session.getAttribute("user");
ArrayList<Visit> reserveList = driver.getUserReservations(con,user);
int count=1;
		for(Visit current:reserveList)
		{
			out.println(count+": "+current.toString()+"<BR><BR>");
			count++;
		}
		
		if(count==1)
		{
			out.println("No matches found <BR><BR>");
		}
		%>
			<form action="record_visit.jsp">
		To record a visit input the corresponding number:<input type="text" name="recResIndex">	
		<input type="hidden" name="recResFlag" value = 1>	
		<input type="submit" value="Record" />
		</form>
		<BR>
<% 
if(request.getParameter("recResFlag")!=null)
{
	int index = Integer.parseInt(request.getParameter("recResIndex"));
	Visit current = reserveList.get(index-1);
	user.visits.add(new Visit(current.thid,current.start,current.stop,current.pid));
	session.setAttribute("user", user);
}
%>
<p>Hello, <%=session.getAttribute("user") %>!</p>


</body>
</html>