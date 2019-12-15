<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Registration</title>
</head>
<body>
<% String userID = (String)session.getAttribute("userID"); %>
<h1>
    Product Registration Page <br>
</h1>
<form action="./ProductRegistrationAction.jsp" method="post">
	<input type="hidden" name="sellerID" value="<%=userID%>">
    <label>Product Name</label> <br>
    <input type="text" name="productName"> <br>
    <label>Product Price</label> <br>
    <input type="text" name="productPrice"> <br>
    <label>Phone Number</label> <br>
    <input type="text" name="sellerPhone"> <br>
    <label>Trading place</label> <br>
    <input type="text" name="productPlace"> <br>
    <input type="radio" name="productClass" value="FleaMarket">Flea Market<br>
    <input type="radio" name="productClass" value="Auction">Auction<br>
    <input type="file" name="productImg" value="">Photo Upload<br>
    <input type="submit" value="Registration">
</form>

</body>
</html>
