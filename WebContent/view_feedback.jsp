<%@ page language="java" import= "java.util.*" import="cs5530.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ViewFeedback</title>
</head>
<body>
<input type="button" onclick="location.href='view_th.jsp';" value="Return to Menu" />
<p></p>
<%ArrayList<Feedback> feedbacks = new ArrayList<Feedback>();
ArrayList<TH> thList = (ArrayList<TH> )session.getAttribute("thlist");
int index = (int)(session.getAttribute("lastThIndex"));
index--;
TH currentTH = thList.get(index);
String viewNum = request.getParameter("allRsome");

if(viewNum == null)
{
%>

<b>
<form action="view_feedback.jsp">
Enter max number of feedbacks to view:<input type = "text" name = "allRsome"> 
<input type = "submit" >
</form>

<%
}//end if(viewNum == null)
else
{
int viewNumInt = Integer.parseInt(viewNum);
feedbacks = driver.viewFeedback(currentTH, (Connector)session.getAttribute("connector"), (User)session.getAttribute("user"), false, viewNumInt);
session.setAttribute("feedbackList", feedbacks);
%>
		
			<P>Feedbacks for the TH:</P>	
		<BR>
		<%	
		int count=1;
		for(Feedback current:feedbacks)
		{
			out.println(count+": "+current.toString()+"<BR><BR>");
			count++;
		}
		
		if(count==1)
		{
			out.println("No Feedbacks found <BR><BR>");
		}
		%>
			<form action="view_singleFeedback.jsp">
		Give the number of the feedback you wish to view:<input type="text" name="feedIndex">		
		<input type="submit" value="View" />
		</form>
		<BR>

<%
//TODO finish up the viewing of all feedbacks and make a view single feedback jsp page and then get rating working
}

%>

<p>Hello, <%=session.getAttribute("user") %>!</p>


</body>
</html>