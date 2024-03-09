<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="nhom1.database" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ hàng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
	<div class="card col-10 m-auto">
	  <div class="card-header">
	    Giỏ hàng của bạn
	  </div>
	  <div class="card-body p-0">
		    <div class="d-flex">
		      <div class="p-2 border col-1">STT</div>
		      <div class="p-2 border  col-4 ">Tên sản phẩm</div>
		      <div class="p-2 border col-3 border text-center">
	      		Số lượng
		      </div>
		      <div class="p-2 border col-2 border text-end">Đơn giá</div>
		      <div class="p-2 border flex-grow-1 text-center">
		      	Chức năng
		      </div>
		  </div>
	    </div>
	  <%
	  	Connection con = database.connect();
  		Statement st = con.createStatement(); 
  		
  		String sql = "select * from giohang where idgiohang="+session.getAttribute("idgiohang");
  		int soluong = 0;
  		int thanhtien = 0;
  		
  		ResultSet rs = st.executeQuery(sql);
  		while(rs.next()){
  			soluong++;
  			Statement st2 = con.createStatement(); 
  			String sanphamSql = "select *from sanpham where idsanpham="+rs.getString("idsanpham");
  			ResultSet rs2 = st2.executeQuery(sanphamSql);
  			while(rs2.next()){
  				thanhtien+=rs2.getInt("giasanpham")*rs.getInt("soluong");
  		
  		%>
  		<form action="updateCart.jsp">
  			<input name="idsanpham" hidden="true" type="number" value="<%=rs.getInt("idsanpham") %>"></input>
		  <div class="card-body p-0">
		    <div class="d-flex">
		      <div class="p-2 border col-1"><%=soluong %></div>
		      <div class="p-2 border  col-4 "><%=rs2.getString("tensanpham") %></div>
		      <div class="p-2 border col-3 border text-center">
	      		<div class="input-group">
				    <span class="input-group-text btn btn-danger" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"> -     </span>
				    <input name="soluong" type="number" value="<%=rs.getString("soluong") %>" class="form-control text-center" min="1" max="100">
				    <span class="input-group-text btn btn-success" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"> +    </span>
				</div>
		      </div>
		      <div class="p-2 border col-2 border text-end"><%=rs2.getInt("giasanpham") %> VNĐ</div>
		      <div class="p-2 border flex-grow-1 text-end">
		      	<a href="deleteCart.jsp?idsanpham=<%=rs.getString("idsanpham") %>" class="btn btn-default">
    				<i class="bi bi-trash"></i>  
    				Xoá
				</a>
		      </div>
		      <div class="p-2 border flex-grow-1 text-end">
		      	<button type="submit" class="btn btn-default">
    				<i class="bi bi-arrow-clockwise"></i>  
    				Update
				</button>
		      </div>
		  </div>
	    </div>
	    </form>
	    <%}}
  			st.close();
  			con.close();
  		%>
	  <div class="card-footer text-muted">
	    Tổng thành tiền: <%=thanhtien %> VNĐ
		    <div class="text-end">
		    	<a href="index.jsp" class="btn btn-default">
		    		Tiếp tục mua hàng <i class="bi bi-cart-plus-fill"></i>
		    	</a>
		  	</div>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>