<%-- 
    Document   : blog
    Created on : Oct 29, 2015, 8:22:54 AM
    Author     : Administrator
--%>

<%@page import="com.hackathon.util.HashtagParser"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Blog 1</title>
        <style type="text/css">
            div.hidden{
                display: none;
            }
            div.visible{
                display: block;
            }
            .comment_box{
                border-style:solid;
                border-width:1px;
                float:left;
                background-color:#d4d4cb;
                width:280px;
                padding-left:20px;
                padding-top:25px;
                padding-bottom:10px;
            }
        </style>
        <script type="text/javascript">
            function showCommentBox() {
                var div = document.getElementById('comment');
                div.className = 'visible';
            }
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%@ include file="WEB-INF/page1.html" %>

        <%
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/hackathon", "verizon", "verizon");
            Statement st = con.createStatement();

            ResultSet rset = st.executeQuery("select * from comments where page='page1' order by createdat");
            while (rset.next()) {
                out.println("<table>");
                out.println("<tr><b>" + rset.getString("createdby") + "</b> at <i>" + rset.getTimestamp("createdat") + "</i>:<br/></tr>");
                out.println("<tr>"+HashtagParser.parse(rset.getString("comment")+"</tr>"));
                out.println("</table>");
            }
        %>
        <form action="dbHelperServlet" method="post">
            <input type="hidden" name="page" value="page1"/>    <!--**********   Update this field     *************-->
            <input type="button" value="Comment" onclick="showCommentBox()"><br>
            <div class="hidden" id="comment">
                <p><br><textarea name="comment" rows="3" cols="30"></textarea><br><br>
                    <input type="submit" name="sub" value="Send"></p>
            </div>
            <input type="hidden" name="createdby" value="Vijay"/>
        </form>
    </body>
</html>