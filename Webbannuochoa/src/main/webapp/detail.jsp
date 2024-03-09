<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="nhom1.database" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Chi Tiết</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <%	
    	Connection con = database.connect();
    	Statement st = con.createStatement();
    
    	boolean islogin = session.getAttribute("islogin")==null?false:true;
    
    	request.setCharacterEncoding("utf-8");
    	
    %>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Shop Mỹ Phẩm</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Trang chủ</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Sản Phẩm</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="index.jsp?maloai=1">Nước Hoa</a></li>
                                <li><a class="dropdown-item" href="index.jsp?maloai=3">Dưỡng Da</a></li>
                                <li><a class="dropdown-item" href="index.jsp?maloai=2">Trang Điểm</a></li>
                            </ul>
                        </li>
                    </ul>
                    <%
                    	if(!islogin){
                    %>
                    	<form class="d-flex" action="login.jsp">
                            <button class="btn btn-outline-dark m-2" type="submit">
                                   <i class="bi bi-person-circle"></i>
                                    Đăng nhập
                                </button>
                        </form>
                   	<%
                    	}else{
                    		
                    %>
	                    <ul class="navbar-nav mb-2 mb-lg-0 ms-lg-4">
	                        <li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Xin chào, <%=session.getAttribute("username") %></a>
	                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                                <li><a class="dropdown-item" href="logout.jsp">Đăng xuất</a></li>
	                            </ul>
	                        </li>
	                    </ul>
                    <%
                    	int count=0;
                	    String strQuery = "SELECT * FROM giohang where idgiohang="+session.getAttribute("idgiohang");
                	    ResultSet rs = st.executeQuery(strQuery);
                	    while(rs.next()){
                	       	count+=rs.getInt("soluong");
                	   	}
                	    if(count > 0){
                    %>
                    <form class="d-flex" action="cart.jsp">
	                   <button class="btn btn-outline-dark m-2" type="submit">
	                       <i class="bi-cart-fill me-1"></i>
	                       Cart
	                       <span class="badge bg-dark text-white ms-1 rounded-pill">
                                        	<% 

                    	}else{
                     %>
                        <button class="btn btn-outline-dark m-2" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">
                            	<%                            		
                           	}
                            	out.print(count);
                       }
                           	%>
                           </span>
                       </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <%
        	String idsanpham = request.getParameter("idsanpham");
       		String sqlgetsanpham = "Select * from sanpham where idsanpham="+idsanpham;
       		ResultSet rs = st.executeQuery(sqlgetsanpham);
       		while(rs.next()){
        %>
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    	<img class="card-img-top mb-5 mb-md-0" src="image/sanpham/<%=rs.getString("anhsanpham") %>"/>
                    </div>
                    <div class="col-md-6">
                        <div class="small mb-1">ID: <%=rs.getString("idsanpham") %></div>
                        <h1 class="display-5 fw-bolder"><%=rs.getString("tensanpham") %></h1>
                        <div class="fs-5 mb-5">
                            <span style="font-size:25px; margin: auto;font-weight: bold; color: red"><%=rs.getString("giasanpham") %></span>
                        </div>
                        <div class="d-flex">
                            <a class="btn btn-outline-dark flex-shrink-0 mt-auto"
                            	href="addCart.jsp?idsanpham=<%=rs.getString("idsanpham")%>">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container px-4 px-lg-5 my-5">
            	<%=rs.getString("chitietsanpham") %>
            </div>
        </section>
        <%
       		}
        %>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container">
            	<p class="m-0 text-center text-white">Copyright &copy; Nhóm 1 - CD21LM1</p>
            	<p class="m-0 text-center text-white">Trịnh Quang Duy - 514210650</p>
            	<p class="m-0 text-center text-white">Phạm Duy Nghĩa - 514210692</p>
            	<p class="m-0 text-center text-white">Nguyễn Văn Quý - 514210409</p>
            
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>