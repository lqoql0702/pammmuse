<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Sign Up</title>
</head>
<body>
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>

<div class="container" id="wrap">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form action="/user/signup" method="post" accept-charset="utf-8" class="form" role="form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <legend>Sign Up</legend>
                <tr/>
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <input type="text" name="name" class="form-control input-lg" placeholder="Name"  />
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <input type="text" name="username" value="" class="form-control input-lg" placeholder="ID"  />
                    </div>
                </div>
                <input type="text" name="email" class="form-control input-lg" placeholder="Email"  />
                <input type="password" name="password" class="form-control input-lg" placeholder="Password"  />
                <input type="text" name="address" class="form-control input-lg" placeholder="Address"  />
                <input type="text" name="phone" class="form-control input-lg" placeholder="Phone"  />

                <br />
                <span class="help-block">By clicking Create my account, you agree to our Terms and that you have read our Data Use Policy, including our Cookie Use.</span>
                <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">
                    Create my account</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>