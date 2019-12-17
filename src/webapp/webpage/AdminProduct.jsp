<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="appLayer.product.ProductDAO"%>
<%@ page import ="appLayer.product.ProductDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
    <title>HIGHLIGHT FLEA MARKET</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
<%
	String userClass = (String)session.getAttribute("userClass");
	if(userClass == null || !userClass.equals("Administer")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Only <Administer> can access')");
		script.println("location.href = '../webpage/CommonIndex.jsp';");
		script.println("</script>");
		script.close(); 
	}
	int pageNumber = 0;
	if (request.getParameter("pageNumber") != null)
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
%>
  <div id=loggo><a href="AdminUserList.jsp"><img src="../images/loggo.png" alt="" width="100px"></a></div>

    <div id="vertical-navbar">
        <div id=signindiv><a href="AdminUserList.jsp"><i class="material-icons md-48">face</i>
          <h3>USER</h3></a></div>
        <div id=Productdiv><a href="AdminProduct.jsp"><i class="material-icons md-48">store</i>
          <h3>PRODUCT</h3></a></div>
    </div>

    <div id="header">
        <img id="logo" src="../images/logo1.png" alt="">
        <img id="comment" src="../images/comment.png" alt="">
    </div>
    <hr id="hi">

    <div id="user-list">
        <table id="table">
            <thead>
                <th>productID</th>
                <th>image</th>
                <th>Name</th>
                <th>SellerID</th>
                <th>DEL</th>
            </thead>
            <tbody>

               <%
               		ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
              		productList = new ProductDAO().getList(pageNumber);
					if (productList != null) {
						for (int i = 0; i < productList.size(); ++i) {
							ProductDTO productInfo = productList.get(i);
				%>
				<tr class="alt">
					<td><span><%=productInfo.getProductNum()%></span></td>
					<td><span>image</span></td>
					<td><span><%=productInfo.getProductName()%></span></td>
					<td><span><%=productInfo.getSellerID()%></span></td>
					<td><a
						href="../webaction/AdminProductDeleteAction.jsp?productNum=<%=productInfo.getProductNum()%>"
						class="button"><i class="material-icons ">delete</i></a></td>
					<%
						}
					}
					%>
            </tbody>
        </table>
    </div>
	<%
		if (pageNumber > 0) {
	%>
	<a href="AdminProduct.jsp?pageNumber=<%=pageNumber - 1%>"> prev </a>
	<%
		} else if (productList.size() == 5) {
	%>

	<a href="AdminProduct.jsp?pageNumber=<%=pageNumber + 1%>"> next </a>
	<%
		}
	%>

</body>

<script type="text/javascript" src="/static/js/admin/admin-main.js"></script>

</html>
