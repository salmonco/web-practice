<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="pageLogo"><a href="${pageContext.request.contextPath}/index.do">BBS SITE</a></div>
    <div class="loginContainer">
        <form method="post" action='${pageContext.request.contextPath}/loginProcess.do'>
            <p><input class="login fir" name="userId" type="text" placeholder="ID" onfocus="this.placeholder=''" onblur="this.placeholder='ID'"></p>
            <p><input class="login sec" name="password" type="password" placeholder="Password" onfocus="this.placeholder=''" onblur="this.placeholder='Password'"></p>
            <button class="loginBtn" type="submit">로그인</button>
        </form>
        <br />
        <button id="join" onclick="location.href='${pageContext.request.contextPath}/join.do'">회원가입</button>
    </div>
</body>
</html>