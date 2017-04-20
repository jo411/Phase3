<%@ page language="java" import = "java.util.*" import="cs5530.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<BR><BR>
1. View most popular TH by category</br>
2. View most expensive TH by category</br>
3. View highest rated TH by category</br>
<BR><BR>
<form action=stats.jsp>
Both Boxes need to be filled.</br>
Enter a number to see corresponding statistics:<input type ="text" name = "stats"></br>
Enter Max number of rows:<input type = "text" name = "rowLimit"></br>
<input type="submit" /> 
</form>

<BR><BR>
<%String statType = request.getParameter("stats");
String row = request.getParameter("rowLimit");
int rowLimit = -1;
if(row != null)
{
	rowLimit = Integer.parseInt(row);
}
driver drive = new driver();
ArrayList<TH> thList = new ArrayList<TH>();;
if(statType !=null){
if(statType.equals("1"))
{
	thList = driver.findMostPopular((Connector)session.getAttribute("connector"),rowLimit);
	session.setAttribute("thlist", thList);
}
else if(statType.equals("2"))
{
	thList = driver.findMostExpensive((Connector)session.getAttribute("connector"),rowLimit);
	session.setAttribute("thlist", thList);
}
else if(statType.equals("3"))
{
	thList = driver.findBestRated((Connector)session.getAttribute("connector"),rowLimit);
	session.setAttribute("thlist", thList);
}

%>

<P>TH found matching the search parameters:</P>			
		<BR>
		<%	
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


<%
}
%>
<input type="button" onclick="location.href='main_menu.jsp';" value="Return to Menu" />
<p></p>
<p>Hello, <%=session.getAttribute("user") %>!</p>


</body>
</html>