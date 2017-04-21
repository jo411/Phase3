<%@ page language="java" import="cs5530.*" import = "java.util.*" contentType="text/html; charset=ISO-8859-1"
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
ArrayList<Keyword> listA = driver.getKeywordsList((TH)session.getAttribute("alterTH"),(Connector)session.getAttribute("connector"), (User)session.getAttribute("user"));

int count=1;
for(Keyword current:listA)
{
	out.println(count+": "+current.toString()+"<BR><BR>");
	count++;
}

if(count==1)
{
	out.println("No matches found <BR><BR>");
}
%>

	<form action="removeKeywords.jsp">
Give the number of the Keyword you wish to remove:<input type="text" name="keyWIndex">	
<input type="hidden" name="removeFlag">	
<input type="submit" value="Remove" />
</form>
<BR>

<%
if(request.getParameter("removeFlag")!=null)
{
	int index = Integer.parseInt(request.getParameter("keyWIndex"));
	index--;
	driver.deleteKeyword(((Connector)session.getAttribute("connector")).stmt, listA.get(index),(TH)session.getAttribute("alterTH"));
}
%>

<p>Hello, <%=session.getAttribute("user") %>!</p>


</body>
</html>