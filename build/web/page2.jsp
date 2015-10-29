<html>
    <head>
        <title>Untitled Document</title>
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
        <form action="mailto:myemail@domain.com" method="post">
            <input type="button" value="Comment" onclick="showCommentBox()"><br>
            <div class="hidden" id="comment">
                <p><br><textarea name="comments" rows="3" cols="30"></textarea><br><br>
                    <input type="submit" name="sub" value="Send"></p>
            </div>
        </form>
</html>