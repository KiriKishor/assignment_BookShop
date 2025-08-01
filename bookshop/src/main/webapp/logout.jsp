<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    session.invalidate();  // ✅ End user session
    response.sendRedirect("index.jsp"); // ✅ Go to login page
%>
