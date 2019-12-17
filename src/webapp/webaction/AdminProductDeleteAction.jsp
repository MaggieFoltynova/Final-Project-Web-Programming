<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="appLayer.product.ProductDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% 
	request.setCharacterEncoding("UTF-8");
	int productNum = Integer.parseInt(request.getParameter("productNum"));
	ProductDAO productDAO = new ProductDAO();
	
	int result = productDAO.delete(productNum);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('deleted')");
		script.println("location.href = '../webpage/AdminProduct.jsp';");
		script.println("</script>");
		script.close();
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('error in database')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
%>