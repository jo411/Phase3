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

if(request.getParameter("index").equals(null))//if nothing was given by a form use the last saved
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

<input name="txtFeedback" type="text" />
<input name="leaveFeedback" onclick="leaveFeedback(document.getElementsByName('txtFeedback')[0].value)" type="button" value="Leave Feedback for this TH" />



 <script LANGUAGE="javascript">
        function leaveFeedback(input){
         
        	driver.giveFeedback(selectedTH, (Connector)session.getAttribute("connector"),(User)session.getAttribute("user"));
        
            return false;
        }
        
        
    </script>

</body>
</html>