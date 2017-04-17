<%@ page language="java" import="cs5530.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<%
User user=(User)session.getAttribute("user");
%>
<p>Hello, <%=user%>!</p>
 <input type="button" onclick="location.href='checkout.jsp';" value="Checkout and Logout" />
<p></p>
<input type="button" onclick="location.href='new_listing.jsp';" value="Create a New Listing" />
<p></p>
<input type="button" onclick="location.href='alter_th.jsp';" value="Alter an Existing TH Listing" />
<p></p>
<input type="button" onclick="location.href='browse_th.jsp';" value="Browse TH" />
<p></p>
<input type="button" onclick="location.href='record_visit.jsp';" value="Record a Visit to a TH" />
<p></p>
<input type="button" onclick="location.href='seperation.jsp';" value="Calculate Degrees of Seperation" />
<p></p>
<input type="button" onclick="location.href='stats.jsp';" value="Look at Statistics" />
<p></p>


<%
if(user.isAdmin)
{
	%>
	Admin Controls:
	<p></p>	
	<input type="button" onclick="location.href='show_trusted.jsp';" value="Get Trusted Users" />
	<p></p>
	<input type="button" onclick="location.href='show_useful.jsp';" value="Get Useful Users" />
	<p></p>
	
	<%
}


%>




</body>
</html>