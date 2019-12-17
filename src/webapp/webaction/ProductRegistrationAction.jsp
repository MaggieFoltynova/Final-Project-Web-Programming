<%@page import="appLayer.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="appLayer.product.ProductDAO" %>
<%@ page import="appLayer.product.ProductDTO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStream" %>
<%
	request.setCharacterEncoding("UTF-8");
	String productName = request.getParameter("productName");
	//int productPrice = 0;
	//if(request.getParameter("productPrice") != null); //can be null
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String sellerID = request.getParameter("sellerID");
	String sellerName = request.getParameter("sellerName");
	String sellerPhone = request.getParameter("sellerPhone");
	String productPlace = request.getParameter("productPlace");
	String productClass = request.getParameter("productClass");
	//String productImg = request.getParameter("productImg");
	
	
	
	if(productName == null || sellerPhone == null || productPlace == null || productClass == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Missing input')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	ProductDAO productDAO = new ProductDAO();
	int result = productDAO.registration(new ProductDTO(0,  productName,  productPrice,  sellerID,  sellerName, sellerPhone,  productPlace,  productClass, 
										"in progress", null, 0,  null,  0,  null,  0,  null, 0));
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
		script.println("location.href = '../webpage/SellerIndex.jsp'");
		script.println("</script>");
		script.close();}
	return;
%>