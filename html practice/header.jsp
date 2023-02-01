<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

    %>
<head>
<meta charset="UTF-8">
<title>board site</title>
	<!-- css files -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div class="container">
	    <div class="row">
	    	<div class="col-md-12">
		        <div id="logo">
                	<a href="${pageContext.request.contextPath}/home.do">
                		BOARD SITE
                        <!-- <img class="logo" src="images/logo-sbcf_w.png" alt="">
                        <img class="logo-2" src="images/logo-sbcf.png" alt=""> -->
                    </a>
				</div>
				<i id="menu-btn" class="fas fa-solid fa-bars"></i>
		            
	            <nav>
                    <ul id="mainmenu">
	                    <li><a href="${pageContext.request.contextPath}/home.do">메인</a></li>
	                    <li><a href="${pageContext.request.contextPath}/index.do">게시판</a></li>
	                </ul>
	            </nav>
		        
		        <div class="form">
		            <ul>
			            <c:if test="${sessionScope.userId != null}">
			                ${sessionScope.userId}님 안녕하세요.
			                <li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
			            </c:if>
			            <c:if test="${sessionScope.userId == null}">
			                <li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
			            </c:if>
		            </ul>
		        </div>
		        <form action="${pageContext.request.contextPath}/search.do" class="search" method="post">
		            <input type="text" id="search" name="skey">
		            <button type="submit" class="searchIcon">
		                <i class="fas fa-search"></i>
		            </button>
		        </form>
	        </div>
        </div>
    </div>
</header>
	<!-- javascript files -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>