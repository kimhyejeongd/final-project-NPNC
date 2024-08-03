<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<sec:authentication var="loginMember" property="principal"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 게시판</title>
    <link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
    <header>
        <h1>관리자 게시판</h1>
    </header>
    <main>
        <!-- 게시글 내용 -->
        <div class="post">
            <h2>${boardDto.BOARD_TITLE}</h2>
            <div class="meta">
                <span class="author">${boardDto.MEMBER_KEY}</span>
                <span class="date"><fmt:formatDate value="${boardDto.BOARD_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            </div>
            <div class="content">
                <p>${boardDto.BOARD_CONTENT}</p>
            </div>
        </div>

        <!-- 댓글 목록 -->
        <div class="comments mt-4">
            <c:forEach var="comment" items="${comments}">
                <div class="comment mt-3">
                    <div class="meta">
                        <span class="author">${comment.MEMBER_KEY}</span>
                        <span class="date"><fmt:formatDate value="${comment.BOARD_COMMENT_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                    <p>${comment.BOARD_COMMENT_DETAIL}</p>

                    <!-- 댓글 수정 및 삭제 버튼 (작성자 또는 관리자만 표시) -->
                    <c:if test="${comment.MEMBER_KEY == loginMember.memberKey || loginMember.authorities.contains('ROLE_ADMIN')}">
                        <div class="comment-actions">
                            <form action="${path}/admin/board/deleteComment/${comment.BOARD_COMMENT_KEY}" method="post" class="d-inline">
                                <input type="hidden" name="boardKey" value="${boardDto.BOARD_KEY}"/>
                                <button type="submit">삭제</button>
                            </form>
                        </div>
                    </c:if>

                    <!-- 대댓글 목록 -->
                    <c:forEach var="reply" items="${commentRepliesMap[comment.BOARD_COMMENT_KEY]}">
                        <div class="reply mt-2">
                            <div class="meta">
                                <span class="author">${reply.MEMBER_KEY}</span>
                                <span class="date"><fmt:formatDate value="${reply.BOARD_COMMENT_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                            </div>
                            <p>${reply.BOARD_COMMENT_DETAIL}</p>

                            <!-- 대댓글 수정 및 삭제 버튼 (작성자 또는 관리자만 표시) -->
                            <c:if test="${reply.MEMBER_KEY == loginMember.memberKey || loginMember.authorities.contains('ROLE_ADMIN')}">
                                <div class="reply-actions">
                                    <form action="${path}/admin/board/deleteReply/${reply.BOARD_COMMENT_KEY}" method="post" class="d-inline">
                                        <input type="hidden" name="boardKey" value="${boardDto.BOARD_KEY}"/>
                                        <button type="submit">삭제</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>

        <!-- 댓글 작성 폼 -->
        <div class="comment-form mt-4">
            <h3>댓글 작성</h3>
            <form action="${path}/admin/board/addComment" method="post">
                <input type="hidden" name="boardKey" value="${boardDto.BOARD_KEY}"/>
                <textarea name="commentDetail" rows="4" required></textarea>
                <button type="submit">댓글 작성</button>
            </form>
        </div>
    </main>
</body>
</html>
