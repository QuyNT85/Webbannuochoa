<%@page import="java.sql.Time"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tạm biệt</title>
<!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<div class="container"><p class="m-0 text-center text-black">
						Tạm biệt, <%=session.getAttribute("username") %> <br>
						Trang web tự động chuyển sau 3 giây</p>
						</div>
	<%
		session.invalidate();
		response.setHeader("Refresh", "3;url=index.jsp");
	%>
</body>
</html>