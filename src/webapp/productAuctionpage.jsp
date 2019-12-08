<%--
  Created by IntelliJ IDEA.
  User: magdalenafoltynova
  Date: 08/12/2019
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="appLayer.util.DatabaseUtil" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Product Auction</title>
</head>
<body>
<h1>
    Product Auction Page <br>
</h1>
<form action="./ProductAuctionAction.jsp" method="post">
    <label>ID</label> <br>
    <input type="text" name="productID"> <br>

    <!--

    <label>Product Name</label> <br>
    <input type="text" name="productName"> <br>

    <label>Current product price </label> <br>
    <input type="text" name="productPrice"> <br>

    <label>Seller Name</label> <br>
    <input type="text" name="sellerName"> <br>

    <label>Seller Number</label> <br>
    <input type="text" name="sellerNumber"> <br>

    <label>Trading place</label> <br>
    <input type="text" name="productPlace"> <br>


    <%/*
        String id = request.getParameter("productID");
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = request.getParameter("database");
        String productName = request.getParameter("productName");
        String sellerName = request.getParameter("sellerName");
        String sellerNumber = request.getParameter("sellerNumber");
        String productPlace= request.getParameter("productPlace");

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try{
            try {
                connection = DriverManager.getConnection(connectionUrl + database, productName, sellerName, sellerNumber, productPlace);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            assert connection != null;
            try {
                statement=connection.createStatement();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            String sql ="select * from users";
            assert statement != null;
            try {
                resultSet = statement.executeQuery(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            assert resultSet != null;
            while(true){
                try {
                    if (!resultSet.next()) break;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                */
    %>

    put wish list-->

    <!--current price-->

    <!-- picture of the product-->





</form>

    <%
        String ID = request.getParameter("userID");
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "FinalProject";
        String userID = "root";
        String password = "Velmitajneheslo";
        try {
        Class.forName(driver);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
    %>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
    <tr>
        <td>Product Name</td>
        <td>Product Price</td>
        <td>Seller Name</td>
        <td>Seller Number</td>
        <td>Trading Place</td>

    </tr>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userID, password);
            statement = connection.createStatement();
            String SQL ="SELECT productName, productPrice, sellerName, sellerNumber, productPlace FROM PRODUCT";
            resultSet = statement.executeQuery(SQL);
            while(resultSet.next()){
    %>
    <tr>
        <td><%=resultSet.getString("productName") %></td>
        <td><%=resultSet.getString("productPrice") %></td>
        <td><%=resultSet.getString("sellerName") %></td>
        <td><%=resultSet.getString("sellerNumber") %></td>
        <td><%=resultSet.getString("productPlace") %></td>
    </tr>
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>

<input type="button" value="WishList"> WishList
<input type="submit" value="Bid!">

</body>
</html>
