<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@include file ="common/header.jsp" %>
	<div class="writeContainer">
            <div class="writeIntro">
                <h2>수정하기</h2>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/updateProcess.do?boardNo=${content.boardNo}" class="write" enctype="multipart/form-data">
            	<input type="hidden" name="boardNo" value="${content.boardNo}">
                <p>
                    <input type="text" class="writeName" id="name" name="boardTitle" value="${content.boardTitle}">
                </p>
                <p>
                    <textarea name="boardContent" class="writeContent" id="message">${content.boardContent}</textarea>
                </p>
                <div style="height:120px; width: 804px; border: 3px solid #F8F8F8; text-align: left; position:relative; margin: 0 auto; background-color:#F8F8F8;">
					<p class="p">&ensp;첨부파일 |</p>
					<input type="file" multiple name="file1" style="position:relative; margin:10px 0px 0px 20px" >
					<input type="file" multiple name="file2" style="position:relative; margin:8px 0px 0px 20px" >
				</div>
				
                <input type="submit" class="writeBtn" value="등록">
            </form>
    </div>
<%@include file ="common/footer.jsp" %>
</body>
</html>