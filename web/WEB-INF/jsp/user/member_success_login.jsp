<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Success</title>
</head>
<body>
Login Success.....Leading You To Member Page.....
<%
    response.setHeader("refresh","1.2;URL=WebContentManageServlet?type=View");
%>
</body>
</html>