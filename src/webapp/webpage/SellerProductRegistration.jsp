<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="appLayer.user.UserDAO"%>
<%@ page import ="appLayer.user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>

<head>
  <title>HIGHLIGHT FLEA MARKET</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" type="text/css" href="../css/style.css" />
  <link rel="stylesheet" type="text/css" href="../css/productregistrationstyle.css" />

  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
<%
	String UserClass = (String)session.getAttribute("userClass");
	if(UserClass == null || !UserClass.equals("Seller")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Only <Seller> can access')");
		script.println("location.href = '../webpage/CommonIndex.jsp';");
		script.println("</script>");
		script.close(); 
	}
	String userID = (String)session.getAttribute("userID");
	String userName = (String)session.getAttribute("userName");
%>
  <div id=loggo><a href="SellerIndex.jsp"><img src="../images/loggo.png" alt="" width="100px"></a></div>
  <div id="vertical-navbar">
    <div id=signindiv><a href="SellerMyInfo.jsp"><i class="material-icons md-48">account_circle</i>
        <h3>My INFO</h3>
      </a></div>
    <div id=Productdiv><a href="SellerProductRegistration.jsp"><i class="material-icons md-48">store</i>
        <h3>REGISTER</h3>
      </a></div>



  </div>
  <div id="header">
    <img id="logo" src="../images/logo1.png" alt="">
    <img id="comment" src="../images/comment.png" alt="">
  </div>
  <hr id="hi">



  <div id="happy">
    <form class="selform" id="selform" action="../webaction/ProductRegistrationAction.jsp" method="post">
      <div id="formdiv">
        <label for="tab-1" class="tab">Registration</label>
        <div id="informdiv">
          <input type="file" name="productImg" id="profile_pt" onchange="previewImage(this,'View_area')">
          <div id='View_area'
            style='width: 100px; height: 100px; color: black; border: 0px solid black;  display:block;'>
          </div>

          <div id="joy">
          <input type="hidden" name="sellerID" value="<%=userID%>">
          <input type="hidden" name="sellerName" value="<%=userName%>">
            <label>Product Name</label>
            <div class="idinput">
              <input type="text" name="productName">
            </div>
            <label>Product Price</label>
            <div class="idinput">
              <input type="text" name="productPrice">
            </div>
            <label>Phone Number</label>
            <div class="idinput">
              <input type="text" name="sellerPhone">
            </div>
            <label>Trading place</label>
            <div class="idinput">
              <input type="text" name="productPlace">
            </div>
            <div id="radio">
              <label id="fm">Flea Market</label>
              <div class="radiodiv"><input class="radio" type="radio" name="productClass" value="FleaMarket"></div>
              <label id="auc">Auction</label>
              <div class="radiodiv"><input class="radio" type="radio" name="productClass" value="Auction"></div>
            </div>

            <input id="btn" type="submit" value="Registration">
          </div>
    </form>
  </div>

  <script type="text/javascript" src="/static/js/admin/admin-main.js"></script>
</body>
<script type="text/javascript">
  function previewImage(targetObj, View_area) {
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;

    //ieì¼ë(IE8 ì´íììë§ ìë)
    if (ua.indexOf("MSIE") > -1) {
      targetObj.select();
      try {
        var src = document.selection.createRange().text; // get file full path(IE9, IE10ìì ì¬ì© ë¶ê°)
        var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


        if (ie_preview_error) {
          preview.removeChild(ie_preview_error); //errorê° ìì¼ë©´ delete
        }

        var img = document.getElementById(View_area); //ì´ë¯¸ì§ê° ë¿ë ¤ì§ ê³³

        //ì´ë¯¸ì§ ë¡ë©, sizingMethodë divì ë§ì¶°ì ì¬ì´ì¦ë¥¼ ìëì¡°ì  íë ì­í 
        img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "', sizingMethod='scale')";
      } catch (e) {
        if (!document.getElementById("ie_preview_error_" + View_area)) {
          var info = document.createElement("<p>");
          info.id = "ie_preview_error_" + View_area;
          info.innerHTML = e.name;
          preview.insertBefore(info, null);
        }
      }
      //ieê° ìëë(í¬ë¡¬, ì¬íë¦¬, FF)
    } else {
      var files = targetObj.files;
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var imageType = /image.*/; //ì´ë¯¸ì§ íì¼ì¼ê²½ì°ë§.. ë¿ë ¤ì¤ë¤.
        if (!file.type.match(imageType))
          continue;
        var prevImg = document.getElementById("prev_" + View_area); //ì´ì ì ë¯¸ë¦¬ë³´ê¸°ê° ìë¤ë©´ ì­ì 
        if (prevImg) {
          preview.removeChild(prevImg);
        }
        var img = document.createElement("img");
        img.id = "prev_" + View_area;
        img.classList.add("obj");
        img.file = file;
        img.style.width = '240px';
        img.style.height = '240px';
        img.style.position = 'absolute';
        img.style.top = '330px';
        img.style.left = '60px';
        // img.style.height = '500px';
        preview.appendChild(img);
        if (window.FileReader) { // FireFox, Chrome, Opera íì¸.
          var reader = new FileReader();
          reader.onloadend = (function (aImg) {
            return function (e) {
              aImg.src = e.target.result;
            };
          })(img);
          reader.readAsDataURL(file);
        } else { // safari is not supported FileReader
          //alert('not supported FileReader');
          if (!document.getElementById("sfr_preview_error_"
            + View_area)) {
            var info = document.createElement("p");
            info.id = "sfr_preview_error_" + View_area;
            info.innerHTML = "not supported FileReader";
            preview.insertBefore(info, null);
          }
        }
      }
    }
  }
</script>

</html>