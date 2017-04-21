<%@ page language="java" import="cs5530.*" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<p>Hello, <%=session.getAttribute("user") %>!</p>
<input type="button" onclick="location.href='main_menu.jsp';" value="Return to Menu" />
<p></p>
<%
int index=0;
TH selectedTH= null;
if(request.getParameter("alterIndex")==null)//if nothing was given by a form use the last saved
{
	index = (int)(session.getAttribute("lastAlterIndex"));
}else
{
	index =  Integer.parseInt(request.getParameter("alterIndex"));
}

session.setAttribute("lastAlterIndex", index);//save for coming back
index--;//account for one offset in display
ArrayList<TH> thList = (ArrayList<TH> ) session.getAttribute("userTH");
if(index<=thList.size()-1)
{
	selectedTH=thList.get(index);
	session.setAttribute("alterTH", selectedTH);
}
%>




<p>Enter the values you wish to change:</p>
<BR>
<form action="th_options.jsp">	
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
	TH temp=selectedTH;
	temp.category= !request.getParameter("category").equals("")?request.getParameter("category"):selectedTH.category; 
	temp.url= !request.getParameter("url").equals("")?request.getParameter("url"):selectedTH.url;
	temp.name= !request.getParameter("name").equals("")?request.getParameter("name"):selectedTH.name;
	temp.address= !request.getParameter("address").equals("")?request.getParameter("address"):selectedTH.address;
	temp.phone= !request.getParameter("phone").equals("")?request.getParameter("address"):selectedTH.phone;
	temp.yearBuilt= !request.getParameter("year").equals("")?request.getParameter("year"):selectedTH.yearBuilt;
	temp.price= !request.getParameter("price").equals("")?Integer.parseInt(request.getParameter("price")):selectedTH.price;

	driver.updateListing((Connector)session.getAttribute("connector"),temp);
}
%>



<input type="button" onclick="location.href='addKeywords.jsp';" value="Add Keyword" />
<p></p>

<input type="button" onclick="location.href='removeKeywords.jsp';" value="Remove Keyword" />
<p></p>

<input type="button" onclick="location.href='add_availabilities.jsp';" value="Add Availability" />
<p></p>

<input type="button" onclick="location.href='removeAvailability.jsp';" value="Remove Availability" />
<p></p>



</body>
</html>