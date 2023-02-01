<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta charset="UTF-8">
</head>
<body>
<%@include file ="common/header.jsp" %>
    <div class="writeContainer">
        <div class="writeIntro">
            <h2>글쓰기</h2>
        </div>
        <form action="${pageContext.request.contextPath}/writeProcess.do" class="write" method="post" enctype="multipart/form-data">
            <p>
                <input type="text" id="name" name="boardTitle" class="writeName" placeholder="제목을 입력해 주세요." onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력해 주세요.'" maxlength="100" required>
            </p>
            <p>
                <textarea id="message" name="boardContent" class="writeContent" placeholder="내용을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder='내용을 입력하세요.'" maxlength="100"></textarea>
            </p>
            <div style="height:120px; width: 804px; border: 3px solid #F8F8F8; text-align: left; position:relative; margin: 0 auto; background-color:#F8F8F8;">
				<p class="p">&ensp;첨부파일 |</p>
				<input type="file" name="file1" style="position:relative; margin:10px 0px 0px 20px" >
				<input type="file" name="file2" style="position:relative; margin:8px 0px 0px 20px" >
				
			</div>

            <input type="submit" class="writeBtn" value="등록">
        </form>
	    
    </div>
<%@include file ="common/footer.jsp" %>
</body>
</html>