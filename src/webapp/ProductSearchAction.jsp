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
<%
    request.setCharacterEncoding("UTF-8");
    String getPriceLow = request.getParameter("lowPrice");
    String getPriceHigh = request.getParameter("highPrice");
    String getName = request.getParameter("searchName");
    String getProduct = request.getParameter("searchProduct");

    Connection conn= null;
    PreparedStatement pstmt = null;
    ResultSet rs= null;
    String url="jdbc:mysql://localhost:3306/tmp?serverTimezone=UTC";

    try{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, "", "");
        pstmt = conn.prepareStatement("select * from PRODUCT where (? >= productPrice) or (? <= productPrice) or (sellerName like ?) or (productName like ?)");
        pstmt.setString(1, getPriceLow);
        pstmt.setString(2, getPriceHigh);
        pstmt.setString(3, getName);
        pstmt.setString(4, getProduct);
        rs = pstmt.executeQuery();
        while(rs.next()){
            out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4)+ " " + rs.getString(5));
            out.println("<br/>");
        }

    } catch(Exception ex){
        ex.getMessage();
    }

%>

</body>
