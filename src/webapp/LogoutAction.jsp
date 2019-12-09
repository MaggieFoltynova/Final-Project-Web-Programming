<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.invalidate();			// delete userID in session, so user must log-in again
%>
<script>
	location.href = 'index.jsp';	// go to main page
</script>