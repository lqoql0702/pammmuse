<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style type="text/css">

        h2 {
            color: #000;
            font-size: 26px;
            font-weight: 300;
            text-align: center;
            text-transform: uppercase;
            position: relative;
            margin: 30px 0 80px;
        }
        a{
            text-decoration : none;
        }
        table{
            border-collapse: collapse;
            margin-top : 20px;
            margin-bottom: 50px;
            text-align: center;
            width:70%;
            margin-left:15%;
            margin-right:15%;
        }
        td, th{
            border : 1px solid black;
            height: 50px;
        }
        th{
            font-size : 17px;
        }
        thead{
            font-weight: 700;
        }
        .table_wrap{
            margin : 50px 0 0 50px;
        }
        .bno_width{
            width: 12%;
        }
        .writer_width{
            width: 20%;
        }
        .regdate_width{
            width: 15%;
        }
        .updatedate_width{
            width: 15%;
        }

    </style>
</head>
<body>
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>
<h2>Notice</h2>

<div class="table_wrap">
    <table>
        <thead>
        <tr>
            <th class="bno_width">번호</th>
            <th class="title_width">제목</th>
            <th class="regdate_width">작성일</th>
        </tr>
        </thead>
        <c:forEach items="${list}" var="list">
        <tr>
            <td><c:out value="${list.id}"/></td>
            <td>
                <a class="move" href='/notice/detail?id=${list.id}'>
                    <c:out value="${list.title}"></c:out>
                </a>
            </td>
            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.reg_date}"/></td>
        </tr>
        </c:forEach>
    </table>
</div>

<form id="moveForm" method="get">
</form>

<%@include file="../footer.jsp"%>
</body>
</html>