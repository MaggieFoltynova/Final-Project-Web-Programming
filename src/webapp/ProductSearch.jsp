<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Product Search</title>
</head>
<body>
<% String userID = (String)session.getAttribute("userID"); %>

    <form method="post" action="./ProductSearchAction.jsp">
        <input type="hidden" name="sellerID" value="<%=userID%>">

        <input type="text" name="lowPrice" placeholder="Lowest Price"> <br>
        <input type="text" name="highPrice" placeholder="Highest Price"> <br>


        <input type="text" class="searchName" name="search" placeholder="Seller Name"> <br>
        <input type="text" class="searchProduct" name="search" placeholder="Product Name"> <br>

        <button type="submit" class="searchButton" name="search">
            <i class="fa fa-search"></i>
        </button>

    </form>

</body>
