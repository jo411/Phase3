<%@ page language="java" import="cs5530.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
TH selectedTH=null;
int index=0;

if(request.getParameter("index")==null)//if nothing was given by a form use the last saved
{
	index = (int)(session.getAttribute("lastThIndex"));
}else
{
	index =  Integer.parseInt(request.getParameter("index"));
}

session.setAttribute("lastThIndex", index);//save for coming back
index--;//account for one offset in display
ArrayList<TH> thList = (ArrayList<TH> ) session.getAttribute("thlist");
if(index<=thList.size()-1)
{
	selectedTH=thList.get(index);
}

%>
<head>Details for TH:<%=selectedTH.name %></head>
<BR><BR>
<%=selectedTH %>

<p>What would you like to do with this TH?</p>

<p>Make a Reservation:</p>
<p>Please choose a range for your stay at this TH. Below are current periods open for reservations.</p>
<p>Your chosen range must come entirely within one of these periods. Use the format "yyyy-MM-dd"</p>

<%
if(request.getParameter("reserveFlag")!=null)
{
	User user=(User)session.getAttribute("user");
	driver.addReservation(((Connector)session.getAttribute("connector")).stmt, selectedTH, user, request.getParameter("start"), request.getParameter("end"));
	//(Statement stmt,TH th,User user,String start, String stop)//also inserts into user
	System.out.println(user);
session.setAttribute("user", user);//update user

}else
{
	out.println(driver.getDates(((Connector)session.getAttribute("connector")).stmt, selectedTH));
}
%>

<form action="view_th.jsp">
	Start Date:<input type="text" name="start"/><BR>
	End Date:<input type="text" name="end"/><BR>	
	<input type="hidden" name="reserveFlag" value=1 /><BR>
	<input type="submit" value="Make Reservation" /><BR>
</form>



<p>Leave Feedback</p>

<form action="view_th.jsp">
	Feedback Text:<input type="text" name="feedback">
	Score (0-10):<input type="text" name="score" />	
	<input type="hidden" name="submitFlag" value=1 />
	<input type="submit" value="Leave Feedback" />
</form>

<%
if(request.getParameter("submitFlag")!=null)
{
		String comment = request.getParameter("feedback");
		int score=Integer.parseInt(request.getParameter("score"));
		
		driver.leaveFeedback(((Connector)session.getAttribute("connector")).stmt, (User)session.getAttribute("user"), score, comment, selectedTH);
}
%>


<p>Mark this TH as a favorite</p>

<form action="view_th.jsp">	
	<input type="hidden" name="favoriteFlag" value=1 />
	<input type="submit" value="Mark Favorite" />
</form>

<%
if(request.getParameter("favoriteFlag")!=null)
{
	driver.favorite(selectedTH, (Connector)session.getAttribute("connector"), (User)session.getAttribute("user"));
}
%>

<p>Get recommendations based on this TH</p>

<form action="recommendations.jsp">	
	<input type="submit" value="Get Recommendations" />
</form>

<%
if(request.getParameter("favoriteFlag")!=null)
{
	driver.favorite(selectedTH, (Connector)session.getAttribute("connector"), (User)session.getAttribute("user"));
}
%>


</body>
</html>