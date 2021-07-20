<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="layout/header.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="utf-8">

<style>
    @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
    @import url(//fonts.googleapis.com/earlyaccess/hanna.css);


    .table {
        font-family: 'Nanum Gothic Coding', monospace;
        font-size: 15px;
    }
    div {
        text-align: center;
        font-family: 'Nanum Gothic Coding', monospace;
        /* font-family: 'Noto Sans KR', sans-serif;*/
        font-size: 15px;
    }
    h2{
        font-family: 'Hanna', fantasy;
        font-size: 40px;
    }
    p {
        font-family: 'Nanum Pen Script', cursive;
        font-size: 25px;
    }
    #form1 {
        display: inline-block;
        text-align: center;
    }
    input[type="date"]::before {content:attr(data-placeholder); width: 70%}
    input[type="date"]:focus::before,
    input[type="date"]:valid::before {display:none}

    #button1, #button2 {
        background-color: white;
        color: black;
        border: 2px solid deepskyblue;
        transition-duration: 0.4s;
        width: 105px;
        font-size : 15px;
        font-family: 'Nanum Pen Script', cursive;
    }

    #button1:hover, #button2:hover {
        background-color: #6495ED;
        color: white;
    }

</style>
<div class="container">
    <br>
    <h2>조회 목록</h2>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>생성 시간</th>
            <th>XPU 장비명</th>
            <th>장비 번호</th>
            <th>성능치</th>
        </tr>
        </thead>

        <tbody id="mySearch">
        <c:forEach items="${list}" var="list">
            <tr>
                <th>${list.time}</th>
                <th>${list.type}</th>
                <th>${list.no}</th>
                <th>${list.per}</th>
            </tr>
        </c:forEach>
        </tbody>

    </table>

    <ul class="pagination h-100 justify-content-center align-items-center">
        <c:if test="${paging.prev}">
            <li class="page-item">
                <a class="page-link"  href='<c:url value="/data?page=${paging.startPage-1}"/>'>>이전</a>
            </li>
        </c:if>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
            <c:choose>
                <c:when test="${cri.page eq num}">
                    <li class="page-item active">
                        <a class="page-link"  href='<c:url value="/data?page=${num}"/>'>>${num}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href='<c:url value="/data?page=${num}"/>'>>${num}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${paging.next && paging.endPage>0}">
            <li class="page-item">
                <a class="page-link" href='<c:set var="nextBtn" value="${paging.endPage+1}"/>'>>다음</a>
            </li>
        </c:if>
    </ul>

</div>

<script type="text/javascript">

</script>

<%@ include file="layout/footer.jsp" %>
</body>
</html>