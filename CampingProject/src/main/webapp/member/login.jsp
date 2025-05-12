<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-y-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="breadcrumb">
                        <div class="breadcrumb__wrap">
                            <ul class="breadcrumb__list">
                                <li class="has-separator">

                                    <a href="../main/main.do">Home</a></li>
                                <li class="is-marked">

                                    <a href="../member/login.do">로그인</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section 1 ======-->


        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary">로그인</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row row--center">
                        <div class="col-lg-6 col-md-8 u-s-m-b-30">
                            <div class="l-f-o">
                                <div class="l-f-o__pad-box" id="loginApp">
                                    <form method="post" action="../member/login.do" class="l-f-o__form" id="frm">
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="login-email">아이디</label>
                                            <input class="input-text input-text--primary-style" type="text" name="id" ref="id" v-model="id" placeholder="ID">
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="login-password">비밀번호</label>
                                            <input class="input-text input-text--primary-style" type="password" name="pwd" ref="pwd" v-model="pwd" placeholder="Password">
                                        </div>
                                        <div class="gl-inline">
	                                        <div class="u-s-m-b-30">
	                                            <!--====== Check Box ======-->
	                                            <div class="check-box">
	                                                <input type="checkbox" id="remember-me" name="remember-me">
	                                                <div class="check-box__state check-box__state--primary">
	                                                    <label class="check-box__label" for="remember-me">자동로그인</label>
	                                                </div>
	                                            </div>
	                                            <!--====== End - Check Box ======-->
	                                        </div>
                                            <div class="u-s-m-b-30">
                                                <!-- <a class="gl-link" href="#">비밀번호 찾기</a> -->
                                            </div>
                                        </div>
                                        <div class="u-s-m-b-30 text-center">
                                            <input class="btn-sm btn-success" type="button" value="로그인" @click="login()" style="margin-right: 10px">
                                            <input class="btn-sm btn-danger" type="button" value="취소" @click="cancel()">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 2 ======-->
    </div>
    <!--====== End - App Content ======-->
	<script src="../js/member/login.js"></script>
</body>
</html>