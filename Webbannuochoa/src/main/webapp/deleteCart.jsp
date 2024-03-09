<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="nhom1.database" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = database.connect();
		Statement st = con.createStatement();
		String idsanpham = request.getParameter("idsanpham");
		String sql = "delete from giohang where idsanpham="+idsanpham+" and idgiohang="+session.getAttribute("idgiohang");
		st.execute(sql);
		Thread.sleep(500);
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>