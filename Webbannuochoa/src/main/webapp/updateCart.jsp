<%@page import="nhom1.database" %>
    <%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = database.connect();
		Statement st = con.createStatement();
		String idsanpham = request.getParameter("idsanpham");
		String soluong = request.getParameter("soluong");
		String sql = "update giohang set soluong="+soluong+" where idsanpham="+idsanpham+" and idgiohang="+session.getAttribute("idgiohang");
		st.executeUpdate(sql);
		Thread.sleep(500);
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>