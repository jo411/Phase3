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

<head>Enter the details of the new TH lisitng:</head>

<BR>
<form action="new_listing.jsp">	
	Category:<input type=text name="category" ></br>
	URL:<input type=text name="url" ></br>
	Name:<input type=text name="name" ></br>
	Address:<input type=text name="address" ></br>
	Phone:<input type=text name="phone" ></br>
	Year Built:<input type=text name="year" length=4></br>	
	Price:<input type=text name="price" ></br>	
	<input type=hidden name="alterFlag" value=1 ></br>
	
	<input type="submit" />
</form>
<BR><BR>

<%
if(request.getParameter("alterFlag")!=null)
{
	driver.createListing(((Connector)session.getAttribute("connector")).stmt, (User)session.getAttribute("user"), request.getParameter("category"), request.getParameter("url"), request.getParameter("name"),
			request.getParameter("address"), request.getParameter("phone"), request.getParameter("year"), Integer.parseInt(request.getParameter("price")));
	
%>
<p>Listing added. Return to main or create another listing.</p>
<%
}
%>







</body>
</html>