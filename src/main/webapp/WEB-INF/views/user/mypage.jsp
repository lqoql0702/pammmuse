<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <title>MyPage</title>

<body>
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>

<div class="container" id="wrap">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <input type="text" name="name" class="form-control input-lg" value="${user.name}"  />
                    </div>
                    <br />
                    <div class="col-xs-6 col-md-6">
                        <input type="text" name="username" class="form-control input-lg" value="${user.username}"   />
                    </div>
                </div>
                <input type="text" name="email" class="form-control input-lg" value="${user.email}"   />
                <input type="text" name="user_addr1" class="form-control input-lg" value="${user.user_addr1}"  />
                <input type="text" name="user_addr2" class="form-control input-lg" value="${user.user_addr2}"  />
                <input type="text" name="user_addr3" class="form-control input-lg" value="${user.user_addr3}"  />
                <input type="text" name="phone" class="form-control input-lg" value="${user.phone}"  />

                <br />
                <button class="btn btn-lg btn-primary btn-block signup-btn" onclick="location.href='/user/update'">
                    수정하기</button>
                <br />
                <form action="/user/delete" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">
                        탈퇴하기</button>
                </form>
        </div>
    </div>
</div>
<%@include file="../footer.jsp"%>
</body>
</html>