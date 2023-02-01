<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@include file ="common/header.jsp" %>
        <div class="viewContainer">
            <div class="infoContainer">
                <div>
                    <h3>제목: ${content.boardTitle}</h3>
                    <h4>작성자: ${content.userId}</h4>
                    <div class="infoDetail">
                        <p>${content.boardDate}</p>
                        <p class="viewNum">조회수: 1</p>
                    </div>
                </div>
                <c:if test="${sessionScope.userId == content.userId}">
                <div class="updelBtn">
                    <a href="${pageContext.request.contextPath}/updateContent.do?boardNo=${content.boardNo}" class="updateBtn">수정</a>
                    <a href="${pageContext.request.contextPath}/deleteProcess.do?boardNo=${content.boardNo}" class="deleteBtn">삭제</a>
                </div>
                </c:if>
            </div>
            <div class="messageContainer">
                ${content.boardContent}
            </div>
            <br><br><br><br><br>
            <h5>${content.userId}님의 게시글</h5>
        </div>
        
    <c:if test="${not empty requestScope.reply}">
		<div id="commentBox">
			<h2>&emsp; Comment</h2>
			<c:forEach items="${requestScope.reply}" var="reply">
				<div id="replyList">
					<form action="${pageContext.request.contextPath}/updateReplyPro.do" method="post">
						<input type="hidden" value="${reply.replyNo}" name="replyNo">
						<input type="hidden" value="${content.boardNo}" name="boardNo">
						&nbsp;<font style="font-weight:bold; font-size: 20px;">${reply.replyWriter}</font> &emsp;
						<font style="color:grey;"><fmt:formatDate pattern="YYYY-MM-dd HH:mm" value="${reply.replyDate}"/></font>
						&emsp;
						<c:choose>
							<c:when test="${reply.replyNo == update}">
								<input type="submit" id="replyBtn" value="완료">
								<br><br>
								<input type="text" style="width:500px; height:100px;" name="updateReply" value="${reply.replyContent}">
							</c:when>
							<c:when test="${reply.replyNo != update}">
								<br><br>
								${reply.replyContent}
							</c:when>
						</c:choose>	
					</form>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<br>
	<form action="${pageContext.request.contextPath}/writeReply.do?boardNo=${content.boardNo}" method="post">
		<div id="replyBox">
			<div id="replyWrite">
				<b>&emsp;Add | </b><br> 
				<input type="text" name="replyContent" style="width:500px; height:80px; margin:15px 10px 20px 20px;">
				<input type="submit" id="replyBtn" style="width:50px; height:80px;" value="등록">
			</div>
		</div>
	</form>
    
    <p class="listComback"><a href="${pageContext.request.contextPath}/board.do">목록으로 돌아가기</a></p>
<%@include file ="common/footer.jsp" %>
</body>
</html>