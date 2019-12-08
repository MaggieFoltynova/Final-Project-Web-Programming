<%--
  Created by IntelliJ IDEA.
  User: magdalenafoltynova
  Date: 08/12/2019
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Registration</title>
</head>
<body>
<h1>
    Product Registration Page <br>
</h1>
<form action="./RegisterAction.jsp" method="post">
    <label>ID</label> <br>
    <input type="text" name="productID"> <br>
    <label>Product Name</label> <br>
    <input type="text" name="productName"> <br>
    <label>Product Price</label> <br>
    <input type="text" name="productPrice"> <br>
    <label>Seller Name </label> <br>
    <input type="text" name="sellerName"> <br>
    <label>Phone Number</label> <br>
    <input type="text" name="sellerNumber"> <br>
    <label>Trading place</label> <br>
    <input type="text" name="productPlace"> <br>
    <input type="radio" name="productClassification" value="FleaMarket">Flea Market<br>
    <input type="radio" name="productClassification" value="Auction">Auction<br>
    <input type="file" name="" value="">Photo Upload<br>
    <input type="submit" value="Registration">
</form>

</body>
</html>
