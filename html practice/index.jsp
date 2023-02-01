<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@include file ="common/header.jsp" %>
	<div>
        <div class="listContainer">
            <div class="listIntro">
                <h2>게시판</h2>
                <p><a href="${pageContext.request.contextPath}/write.do"><i class="fas fa-pen"></i>글쓰기</a></p>
            </div>
            <c:if test="${not empty requestScope.board}">
            <table class="listTable">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <c:forEach items="${requestScope.board}" var="board">
                <tbody>
                    <tr>
                        <td>${board.boardNo}</td>
                        <td><a href="${pageContext.request.contextPath}/viewContent.do?boardNo=${board.boardNo}"><c:out value="${board.boardTitle}"/></a></td>
                        <td>${board.userId}</td>
                        <td>${board.boardDate}</td>
                        <td>${board.boardHit}</td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
            	<div style="text-align:center; margin-top:10px;">
	            <c:if test="${paging.startPage != 1}">
				<a href="${pageContext.request.contextPath}/board.do?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">◀ </a>
				</c:if>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="pageNum">
					<c:choose>
						<c:when test="${pageNum == paging.nowPage }">
							<a><font size="4">${pageNum}</font></a>
						</c:when>
						
						<c:when test="${pageNum != paging.nowPage }">
							<a href="${pageContext.request.contextPath}/board.do?nowPage=${pageNum}&cntPerPage=${paging.cntPerPage}"><font color="666666">${pageNum}</font></a>
						</c:when>
					</c:choose>
				</c:forEach>
				
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="${pageContext.request.contextPath}/board.do?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}"> ▶</a>
				</c:if>
				</div>
			</c:if>  
	     </div>
    </div>
<%@include file ="common/footer.jsp" %>
</body>
</html>