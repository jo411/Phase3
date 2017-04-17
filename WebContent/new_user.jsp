<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

Create a new account below
<form action="landing.jsp">
	Username:<input type="text" name="username" >
	<p></p>
	Password:<input type="password" name="password" />
	<p></p>
	Full Name:<input type="text" name="name">
	<p></p>
	Address:<input type="text" name="address">
	<p></p>
	Phone Number:<input type="text" name="phoneNumber">
	<p></p>	
	<input type="hidden" name="newFlag" value=1>
	<p></p>
	<input type="submit" value="Create" />
</form>

</body>
</html>