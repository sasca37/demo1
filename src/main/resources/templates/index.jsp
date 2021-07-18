<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>


<div class="container">
    <br>
    <h2>조회 목록</h2>


    <table class="table table-striped">
        <thead>
        <tr>
            <th>계약 일짜</th>
            <th>접수번호</th>
            <th>상태</th>
            <th>생성 일짜</th>
        </tr>
        </thead>

<%--        <tbody id="mySearch">--%>
<%--        <c:forEach items="${list}" var="k">--%>
<%--            <tr>--%>
<%--                <th>${k.contractDate}</th>--%>
<%--                <th>${k.registrationNum}</th>--%>
<%--                <th>${k.status}</th>--%>
<%--                <th>${k.created}</th>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>

    </table>



</div>

</body>
</html>