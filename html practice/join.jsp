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
        <form method="post" action='${pageContext.request.contextPath}/joinProcess.do'>
            <p><input class="login fir" type="text" id="userId" name="userId" placeholder="ID" onfocus="this.placeholder=''" onblur="this.placeholder='ID'" required></p>
            <input type="button" id="idCheckBtn" onclick="idCheck();" value="중복 확인">
				<p class="result">
					<span class="message">※ 아이디 중복 확인을 해주세요</span>
				</p>
            <p><input class="login sec" type="password" name="password" placeholder="Password" onfocus="this.placeholder=''" onblur="this.placeholder='Password'" required></p>
            <p><input class="login email" type="text" name="name" placeholder="Name" onfocus="this.placeholder=''" onblur="this.placeholder='Name'" required></p>
            
            <button class="loginBtn" type="submit">회원가입</button>
        </form>
    </div>
    
<script>
	function idCheck() {
		$.ajax({
			url : "${pageContext.request.contextPath}/idCheck.do",
			dataType: 'json',
			type : "post",
			data : {"userId" : $("#userId").val()},
			async : true,
			success : function(data){
				if(data == 1){
					$(".result .message").text("이미 사용중인 아이디입니다");
					$(".result .message").attr("style", "color: #D82F2F");
				}else{
					$(".result .message").text("사용 가능한 아이디입니다");
					$(".result .message").attr("style", "color: #4795DA");
				}
			},
			error : function(error) {
		        alert("Error!="+JSON.stringify(error));
		    },
		    complete : function() {
		    }

		});
	};
</script>
</body>
</html>