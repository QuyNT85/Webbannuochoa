<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="nhom1.database" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<%
		if(session.getAttribute("islogin")!=null){
			Connection con = database.connect();
			Statement st = con.createStatement();
			String idsanpham = request.getParameter("idsanpham");
			String idgiohang = session.getAttribute("idgiohang").toString();
			int soluong = 0;
			String select = "select * from giohang where idsanpham = " + idsanpham + " and idgiohang = " + idgiohang;
			ResultSet rs = st.executeQuery(select);
			while(rs.next()){
	  			soluong++;
			}
			if(soluong >= 1){
				response.sendRedirect("index.jsp");
			}else{
				String sql = "insert into giohang(idgiohang, idsanpham, soluong)"+"values("+idgiohang+","+idsanpham+",1)";
					st.execute(sql);
					Thread.sleep(500);
					response.sendRedirect("cart.jsp");
			}
			
		}else{%>
			<div class="container"><p class="m-0 text-center text-black">Bạn chưa đăng nhập, vui lòng đăng nhập</p></div>
			<%
			response.setHeader("Refresh", "2;url=login.jsp");
		}
	%>
</body>
</html>