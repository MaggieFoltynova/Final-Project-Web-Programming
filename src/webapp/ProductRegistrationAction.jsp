<%@page import="appLayer.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="appLayer.product.ProductDAO" %>
<%@ page import="appLayer.product.ProductDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice")); //can be null
	String sellerID = request.getParameter("sellerID");
	String sellerName = new UserDAO().getUserName(sellerID);
	String sellerPhone = request.getParameter("sellerPhone");
	String productPlace = request.getParameter("productPlace");
	String productClass = request.getParameter("productClass");
	
	if(productName == null || sellerID == null || sellerPhone == null || productPlace == null || productClass == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Missing input')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	ProductDAO productDAO = new ProductDAO();
	int result = productDAO.registration(new ProductDTO(0, productName, productPrice, sellerID, sellerName, sellerPhone, productPlace, productClass));
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
