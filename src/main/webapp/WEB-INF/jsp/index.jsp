<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<%--<script type="text/javascript">--%>
<%--    var list = '<c:out value="${list[0]}"/>';--%>
<%--    console.log(list);--%>


<%--</script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    const list = '<c:out value="${list}"/>';
    $(function () {
        $.ajax({
            url: "/ajax.do", // 호출할 주소
            data: {
                name : list
                <%--type: '<c:out value="${list[0].type}"/>',--%>
                <%--no: '<c:out value="${list[0].no}"/>',--%>
                <%--per: '<c:out value="${list[0].per}"/>'--%>
            }, // 넘길 데이터
            dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
            success: function(data) { // 결과 받기
                //data = JSON.parse(data); // JSON 형태로 파싱
                console.log(data);
            }
        });
    });
</script>
<div class="container">
    <br>
    <h2>조회 목록</h2>


    <table class="table table-striped">
        <thead>
        <tr>
            <th>날짜</th>
            <th>타입</th>
            <th>번호</th>
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



</div>

</body>
</html>