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
<BR><BR>
<%
Connector con= (Connector)session.getAttribute("connector");
User user = (User)session.getAttribute("user");
if(!user.reservations.isEmpty())
{
	int count = 1;
	out.println("These are your current Reservations <BR>");
	for(Reservation current : user.reservations)
	{
		out.println((count)+": "+current.toString()+"<BR><BR>");//print out all reservations
		count++;
	}
	%>
	
	To remove a reservation input the corresponding number.<BR>
<form action="checkout.jsp">
Give the number of the Reservation you wish to remove:<input type="text" name="resInd">	
<input type="hidden" name="remResFlag" value = 1>	
<input type="submit" value="Remove" />
</form>
<BR>

<%
if(request.getParameter("remResFlag")!=null)
{
	int index = Integer.parseInt(request.getParameter("resInd"));
	if(index -1 < user.reservations.size()){
	user.reservations.remove(index-1);}
}
%>
	
	<% 
	
}
if(!user.visits.isEmpty())
{
	int count = 1;
	out.println("These are your current visits");
	for(Visit current : user.visits)
	{
		out.println((count)+": "+current.toString()+"<BR><BR>");//print out all reservations
		count++;
	}
	%>
	To remove a visit input the corresponding number.<BR>
<form action="checkout.jsp">
Give the number of the visit you wish to remove:<input type="text" name="visInd">	
<input type="hidden" name="remVisFlag" value = 1>	
<input type="submit" value="Remove" />
</form>
<BR>

<%
if(request.getParameter("remVisFlag")!=null)
{
	int index = Integer.parseInt(request.getParameter("visInd"));
	if(index -1 < user.visits.size()){
	user.visits.remove(index-1);}
}

%>
	<% 
	
}//end visits if

%>


<form action="checkout.jsp">
<b>Confirm Contents in Cart</b>	
<input type="hidden" name="confirmCartFlag">	
<input type="submit" value="Confirm" />
</form>
<BR>

<%
if(request.getParameter("confirmCartFlag")!=null)
{
	driver.confirmReservationsJsp(user,con);//confirm the reservations in the shoppoing cart
	driver.confirmVisitsJSP(con,user);//confirm the reservations in the shoppoing cart
	con.closeConnection();
	session.invalidate();
	response.sendRedirect("index.html");
}
%>





</body>
</html>