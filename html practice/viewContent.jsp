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
                    <h3>제목: <c:out value="${content.boardTitle}"/></h3>
                    <h4>작성자: ${content.userId}</h4>
                    <div class="infoDetail">
                        <p>${content.boardDate}</p>
                        <p class="viewNum">조회수: ${content.boardHit}</p>
                    </div>
                </div>
                <c:if test="${sessionScope.userId == content.userId}">
                <div class="updelBtn">
                    <a href="${pageContext.request.contextPath}/updateContent.do?boardNo=${content.boardNo}" class="updateBtn">수정</a>
                    <a href="${pageContext.request.contextPath}/deleteProcess.do?boardNo=${content.boardNo}" class="deleteBtn">삭제</a>
                </div>
                </c:if>
            </div>
            <div class="messageContainer" style="white-space:pre-wrap;">
	            <c:out value="${content.boardContent}"/>
            </div>
            <br><br><br><br><br>
            <h5>첨부파일 |<br><br>
            	<a href="${pageContext.request.contextPath}/fileDownload.do?fileName=${content.boardFile1}">${content.boardFile1}</a><br>
            	<a href="${pageContext.request.contextPath}/fileDownload.do?fileName=${content.boardFile2}">${content.boardFile2}</a></h5>
			
        </div>
        <div class="writeContainer">
        	<c:if test="${not empty requestScope.reply}">
				<div id="commentBox">
					<h2>&emsp; Comment</h2> <br>
					<c:forEach items="${requestScope.reply}" var="reply">
						<div id="replyList">
							&nbsp;<font style="font-weight:bold; font-size: 20px;">${reply.replyWriter}</font> &emsp;
							<font style="color:grey;"><fmt:formatDate pattern="YYYY-MM-dd HH:mm" value="${reply.replyDate}"/></font>
							<c:if test="${sessionScope.userId == reply.replyWriter}">
								&emsp;
								<input type="button" value="수정" id="replyBtn" onclick="location.href='${pageContext.request.contextPath}/updateReply.do?boardNo=${content.boardNo}&&replyNo=${reply.replyNo}'">
								<input type="button" value="삭제" id="replyBtn" onclick="location.href='${pageContext.request.contextPath}/deleteReply.do?boardNo=${content.boardNo}&&replyNo=${reply.replyNo}'">
							</c:if>
							<br><br>
							${reply.replyContent}
							<br><br>
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
        </div>
    
    
    <p class="listComback"><a href="${pageContext.request.contextPath}/board.do">목록으로 돌아가기</a></p>
<%-- <%@include file ="common/footer.jsp" %> --%>


</body>
</html>