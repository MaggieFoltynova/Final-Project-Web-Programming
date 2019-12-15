<%@page import="appLayer.product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="appLayer.product.ProductDTO"%>
<%@ page import="appLayer.user.UserDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice")); //can be null
	String sellerID = request.getParameter("sellerID");
	String sellerName = new UserDAO().getUserName(sellerID);
	String sellerPhone = request.getParameter("sellerPhone");
	String productPlace = request.getParameter("productPlace");
	String productClass = request.getParameter("productClass");
	String productImg =request.getParameter("productImg");


	//Inserting the image
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	String url="jdbc:mysql://localhost:3306/tmp?serverTimezone=UTC";

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, "", "");
		//reading the image file
		File image = new File(productImg);
		//Registering the product = filling the table
		pstmt = conn.prepareStatement("insert into product(productName, productPrice, sellerPhone, productPlace, productClass, productImg) " + "values(? ,?, ?, ?, ?, ?)");
		pstmt.setString(1, productName);
		pstmt.setInt(2, productPrice);
		pstmt.setString(3, sellerPhone);
		pstmt.setString(4, productPlace);
		pstmt.setString(5, productClass);
		pstmt.setString(6, productImg);
		FileInputStream fis = new FileInputStream(image);
		pstmt.setBinaryStream(3, (InputStream) fis, (int) (image.length()));
		int count = pstmt.executeUpdate();
		if(count > 0)
		{
			out.println("Insert successful."); //Successfully uploaded the picture
		}
		else
		{
			out.println("Not successful."); // Not successfully uploaded the picture
		}
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	finally{
		try{
			if(rs != null){
				rs.close();
				rs = null;
			}
			if(pstmt !=null)
			{
				pstmt.close();
				pstmt = null;
			}
			if(conn!=null)
			{
				conn.close();
				conn = null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}


	if(productName == null || sellerID == null || sellerPhone == null || productPlace == null || productClass == null || productImg == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Missing input')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	ProductDAO productDAO = new ProductDAO();
	int result = productDAO.registration(new ProductDTO(0, productName, productPrice, sellerID, sellerName, sellerPhone, productPlace, productClass, productImg));
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Same product already exists')");
		script.println("history.back()");
		script.println("</script>");
		script.close();}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();}
	return;
%>
