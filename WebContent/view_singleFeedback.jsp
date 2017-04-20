<%@ page language="java" import="java.util.*" import="cs5530.*" contentType="text/html; charset=ISO-8859-1"
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
ArrayList<Feedback> feedbacks = (ArrayList<Feedback> ) session.getAttribute("feedbackList");
int index = -1;
if(request.getParameter("feedIndex") ==null)
{
	index = (int)(session.getAttribute("lastFeedIndex"));
}
else
{
	index = Integer.parseInt(request.getParameter("feedIndex"));
}
session.setAttribute("lastFeedIndex",index);
index--;
Feedback currentFeedback = feedbacks.get(index);
%>

<head>Details for Feedback:</head>
<BR><BR>
<%=currentFeedback %>

<p>What would you like to do with this Feedback?</p>

<p>RateFeedback</p>
<BR>
Rating is 0 = Useless, 1 = Useful, 2 = Very Useful
<form action="view_singleFeedback.jsp">
	Rating(0,1,2):<input type="text" name="rateScore">
	<input type="hidden" name="submitFlag" value=1 />
	<input type="submit" value="Rate" />
</form>

<%
if(request.getParameter("submitFlag")!=null)
{
		String comment = request.getParameter("feedback");
		int score=Integer.parseInt(request.getParameter("rateScore"));
		
		driver.rateFeedback(currentFeedback, ((Connector)session.getAttribute("connector")), (User)session.getAttribute("user"), score );
}
%>

<p> Trust User </p>

<form action= "view_singleFeedback.jsp">
<%=currentFeedback.login %>
<input type="hidden" name="trustFlag" value=1 />
<input type = "submit" value = "Trust User">
</form>

<%
if(request.getParameter("trustFlag")!=null)
{
	driver.trustUser(currentFeedback, (Connector)session.getAttribute("connector"), (User)session.getAttribute("user"), 1);
}
%>

<p> Untrust User </p>

<form action= "view_singleFeedback.jsp">
<%=currentFeedback.login %>
<input type="hidden" name="untrustFlag" value=1 />
<input type = "submit" value = "Untrust User">
</form>

<%
if(request.getParameter("untrustFlag")!=null)
{
	driver.trustUser(currentFeedback, (Connector)session.getAttribute("connector"), (User)session.getAttribute("user"), 0);
}
%>


<p>Hello, <%=session.getAttribute("user") %>!</p>


</body>
</html>