<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="appLayer.product.ProductDAO"%>
<%@ page import ="appLayer.product.ProductDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>
		<br> show all user list
	</h1>
	<p>
		productNum &emsp; productPrice &emsp; productPlace &emsp; SellerPhone &emsp; productClass &emsp; SellerID &emsp; SellerName &emsp; Status
	<p>
	<%
		ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
		productList = new ProductDAO().getList();
		for(int i = 0; i < productList.size(); ++i) {
			ProductDTO productInfo = productList.get(i);
	%>
		<span> <%= productInfo.getProductNum() %>&emsp;</span>
		<span> <%= productInfo.getProductPrice() %>&emsp;</span>
		<span> <%= productInfo.getProductPlace() %>&emsp;</span>
		<span> <%= productInfo.getSellerPhone() %>&emsp;</span>
		<span> <%= productInfo.getProductClass() %>&emsp;</span>
		<span> <%= productInfo.getSellerID() %>&emsp;</span>
		<span> <%= productInfo.getSellerName() %>&emsp;</span>
		<span> <%= productInfo.getProductStatus() %>&emsp;</span>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/BuyAction.jsp?productNum=<%=productInfo.getProductNum() %>">Buy</a>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/WishAction.jsp?productNum=<%=productInfo.getProductNum() %>">Add to Wish List</a>
		<span> <br> </span>
	<%
		}
	%>
</body>
</html>