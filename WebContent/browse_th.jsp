<%@ page language="java" import="java.util.*" import="cs5530.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse_TH</title>
 <script LANGUAGE="javascript">
        function submitForms(){
            document.forms["Price"].submit();
            document.forms["State"].submit();
            document.forms["City"].submit();
            document.forms["Category"].submit();
            document.forms["Keyword"].submit();
            
        
            return true;
        }
    </script>
</head>
<body>
<input type="button" onclick="location.href='main_menu.jsp';" value="Return to Menu" />
<p>Please select the parameters of your search </br>
If you wish to select a combination of the following then enter all the numbers that correspond to parameters you want to search..</br>
Example (If you wish to search by price AND by address simply enter 12</br>
However if you wish to search multiple things but not necessarily in combination (OR).</br>
Simply type a space between the numbers you wish to search. Example 1 2</br>
You can use each option only once. If you choose an option be sure to fill in the corresponding field.</br>
1. Price Range</br>
2. Address(city)</br>
3. Address(state)</br>
4. Name by Keywords</br>
5. Category"</br>	
To "sort by" enter your the number in the "Sort By" box</br>
1. Price</br>
2. Average feedback score </br>
3. Average trusted user feedback score</br>
Filter mode</br>
1. Ascending</br>
2. Descending</br>



</p>
<form action="browse_th.jsp">
	Search Parameters(Required):<input type="text" name="searchParams"></br>
	Price Low:<input type=text name="priceLow" length=10></br>
    Price High:<input type=text name="priceHigh"></br>
    City:<input type=text name="city" length=10></br>
    State:<input type=text name="state" length=10></br>
    Keyword:<input type=text name="keyWord" length=10></br>
    Category:<input type=text name="category" length=10></br>
    Sort by (Required):<input type=text name = "filterType" length =10></br>
    Filter Mode(Required):<input type=text name = "filterMode" length=10></br>
	<input type="submit" />
</form>


<%
String searchParams = request.getParameter("searchParams");
	
	
	ArrayList<Integer> searchPArray = new ArrayList<Integer>();
	ArrayList<TH> thList=new ArrayList<TH>();

	//String[] keywords;	
	String city = null,keyWord = null,category=null,state = null;
					
	int priceLow = 0,priceHigh=0;
	int filterMode = -1;
	int filterType = -1;
	String sqlFilterString=null;
	String priceLowString = request.getParameter("priceLow");
	String priceHighString = request.getParameter("priceHigh");
	
	if(priceLowString != null && priceHighString != null && !priceLowString.equals("")&& !priceHighString.equals(""))
	{
		System.out.println("got some prices");
	priceLow = Integer.parseInt(priceLowString);
	priceHigh = Integer.parseInt(priceHighString);
	}
	
	city= request.getParameter("city");
	state= request.getParameter("state");
	keyWord= request.getParameter("keyWord");
	category= request.getParameter("category");
	String filterTypeString = request.getParameter("filterType");
	String filterModeString = request.getParameter("filterMode");
	
	if(filterTypeString != null && filterModeString != null && !filterTypeString.equals("")&& !filterModeString.equals(""))
	{
	filterType = Integer.parseInt(filterTypeString);
	filterMode = Integer.parseInt(filterModeString);
	}
	//driver drive = new driver();
	if(searchParams!=null)
	{
		thList=driver.browseTH((Connector)session.getAttribute("connector"),(User)session.getAttribute("user"), city, keyWord, category, state, priceLow, priceHigh, filterMode, filterType, searchParams);
		session.setAttribute("thlist", thList);
		%>		
			<P>TH found matching the search parameters:</P>			
			<form action="view_th.jsp">			
		Give the number of the TH you wish to view:<input type="text" name="index">		
		<input type="submit" value="View" />
		</form>
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

<%//end else line of if(searchParams!=null) %>
	


<p></p>



</body>
</html>