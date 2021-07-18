<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<script type="text/javascript">
    var list = '<c:forEach items="${list.type}" var="list"/>';
    console.log(list);


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