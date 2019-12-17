<%@ page import="appLayer.product.ProductDTO"%>
<%@ page import="appLayer.product.ProductDAO"%>
<%@ page import="appLayer.wish.WishDTO"%>
<%@ page import="appLayer.wish.WishDAO"%>
<%@
 page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String buyerID = (String)session.getAttribute("userID");
	int productNum = Integer.parseInt(request.getParameter("productNum"));
	
	WishDAO wishDAO = new WishDAO();
	int result = wishDAO.AddToWishList(buyerID, productNum);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	if(result == 1){
		script.println("alert('Add to wish list')");
		ProductDAO productDAO = new ProductDAO();
		productDAO.AddWishCount(productNum);
	}
	else
		script.println("alert('The product is already in the wish list')");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
%>