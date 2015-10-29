<%-- 
    Document   : index
    Created on : Oct 29, 2015, 6:33:34 AM
    Author     : Administrator
--%>

<%@page import="com.hackathon.util.HashtagParser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <form method="post">
        <input type="search" placeholder="Search" name="query" results="0"/>
    </form>
    
    <ol>
        <li><a href="page1.jsp">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a></li>
        <li><a href="page2.jsp">Aliquam tincidunt mauris eu risus.</a></li>
        <li><a href="page3.jsp">Vestibulum auctor dapibus neque.</a></li>
    </ol>

    <%
        HashtagParser parser = new HashtagParser();
    %>
    
</html>
