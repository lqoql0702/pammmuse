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

        a{
            text-decoration : none;
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


    </style>
</head>
<body>
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>

<div class="card border-primary mb-3" style="width: 50%;margin-left: auto;margin-right: auto;">
    <div class="card-header" name="title"><c:out value="${pageInfo.title}"/></div>
    <div class="card-body">
        <p class="card-text" name="content"><c:out value="${pageInfo.content}"/></p>
    </div>
</div>

<%@include file="../footer.jsp"%>
</body>
</html>