<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Login</title>
</head>
<body>
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>


    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login via site</h3>
                    </div>
                    <div class="panel-body">
                        <form action="/auth" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" type="text" name="username" placeholder="Username"/>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="password" name="password" placeholder="Password"/>
                                </div>
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                            </fieldset>
                        </form>
                        <hr/>
                        <center><h4>OR</h4></center>
                        <input class="btn btn-lg btn-facebook btn-block" type="button" onclick="location.href='/user/signup'" value="회원가입">
                        <hr/>
                        <input class="btn btn-lg btn-facebook btn-block" type="button"
                               onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=2ec9b40569d051b3dd40afa8bf9a0a9d&redirect_uri=http://ec2-3-37-36-176.ap-northeast-2.compute.amazonaws.com:8080/user/kakao/callback&response_type=code'"
                               value="카카오 로그인">
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<%@include file="../footer.jsp"%>
</body>
</html>