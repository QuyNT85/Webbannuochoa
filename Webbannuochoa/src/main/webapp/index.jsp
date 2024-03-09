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
        <title>Shop Mỹ Phẩm</title>
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
                                <li><a class="dropdown-item" href="?maloai=1">Nước Hoa</a></li>
                                <li><a class="dropdown-item" href="?maloai=3">Dưỡng Da</a></li>
                                <li><a class="dropdown-item" href="?maloai=2">Trang Điểm</a></li>
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
        <!-- Header-->
        <header class="bg-light py-2">
            <!-- <div class="container px-4 px-lg-5 my-5"> -->
                <div class="text-center text-white header">
                	<img style="max-width: 100%; max-height: 100%; display: block; margin: auto" alt="banner shop" src="image/banner/banner.png" >
                </div>
            <!-- </div> -->
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <%
               		try{
	        			String sqlgetsanpham = "Select * from sanpham";
	        			ResultSet result = st.executeQuery(sqlgetsanpham);
	        	    	if((request.getParameter("maloai")!=null)){
	        	    		switch(request.getParameter("maloai")){
	        	    		case "1": 
	        	    			sqlgetsanpham = "select * from sanpham where maloai='1'";
	        	    			result = st.executeQuery(sqlgetsanpham);
	        	    			break;
	        	    		case "2": 
	        	    			sqlgetsanpham = "select * from sanpham where maloai='2'";
	        	    			result = st.executeQuery(sqlgetsanpham);
	        	    			break;
	        	    		case "3": 
	        	    			sqlgetsanpham = "select * from sanpham where maloai='3'";
	        	    			result = st.executeQuery(sqlgetsanpham);
	        	    			break;
	        	    		}
	        	    	}
	        			while(result.next()){
                %>
                <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <a href="detail.jsp?idsanpham=<%=result.getString("idsanpham")%>">
                            	<img class="card-img-top" src="image/sanpham/<%=result.getString("anhsanpham") %>"/>
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
	                                <a class="btn" href="detail.jsp?idsanpham=<%=result.getString("idsanpham")%>">
		                            <!-- Product name-->
                                    	<h5 class="fw-bolder"><%=result.getString("tensanpham") %></h5>
		                            </a>
                                </div>
                            </div>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            <p style="font-size:25px; margin: auto;font-weight: bold; color: red"> <%=result.getString("giasanpham") %> đ</p>
                            <!-- Product actions-->
                            <div class="card-footer border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="addCart.jsp?idsanpham=<%=result.getString("idsanpham")%>">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                <%
        				}
	        				result.close();
			            	st.close();
			    			con.close();
		    		}
		    		catch(Exception e){
		    			out.println(e);
		    		}
                %>
                </div>
            </div>
        </section>
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
