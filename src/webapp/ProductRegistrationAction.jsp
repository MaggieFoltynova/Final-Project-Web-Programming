<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="appLayer.product.ProductDAO" %>
<%@ page import="appLayer.product.ProductDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String productID = request.getParameter("productID");
	String productName = request.getParameter("productName");
	String productPrice = request.getParameter("productPrice"); //can be null
	String sellerName = request.getParameter("sellerName");
	String sellerNumber = request.getParameter("sellerNumber");
	String productPlace = request.getParameter("productPlace");
	String productClassification = request.getParameter("productClassification");
	
	if(productID == null || productName == null || sellerName == null || sellerNumber == null || productPlace == null || productClassification == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Missing input')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	ProductDAO productDAO = new ProductDAO();
	int result = productDAO.registration(new ProductDTO(productID, productName, productPrice,sellerName, sellerNumber, productPlace, productClassification));
	PrintWriter script = response.getWriter();
	if(result == -1){
		script.println("<script>");
		script.println("alert('Same product already exists')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	script.close();
	return;
%>