<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

                                    <a href="../member/signup.do">회원가입</a></li>
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
                                <h1 class="section__heading u-c-secondary">회원가입</h1>
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
                                <div class="l-f-o__pad-box" id="signupApp">
                                        <div class="gl-s-api">
                                            <!-- <div class="u-s-m-b-30">
                                                <button class="gl-s-api__btn gl-s-api__btn--gplus" type="button"><i class="fab fa-google"></i>
                                                    <span>카카오 간편로그인</span>
                                                </button>
                                            </div> -->
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-fname">아이디</label>
                                            <input class="input-text input-text--primary-style" type="text" ref="id" v-model="id" placeholder="ID" maxlength="20" style="width: 70%;margin-right: 10px" @input="idInput()">
                                        	<input type="button" :class="isID?'btn-sm btn-default':'btn-sm btn-success'" id="idBtn" value="아이디 중복 확인" style="width: 25%" @click="idCheck()" :disabled="isID">
                                        </div>
                                        <div class="u-s-m-b-30">
                                        	<span v-if="idMsg!==''" :style="isID?'color:green':'color:red'">{{idMsg}}</span>
                                        </div>
                                        <div class="gl-inline">
	                                        <div class="u-s-m-b-30">
	                                            <label class="gl-label" for="reg-lname">
	                                            	비밀번호
	                                            	<span class="btn-sm btn-default" style="float: right;" id="pwdView1" @click="pwdView(1)"><i :class="pwdView1?'fas fa-eye':'fas fa-eye-slash'"></i></span>
	                                            </label>
	                                            <input class="input-text input-text--primary-style" type="password" ref="pwd1" v-model="pwd1" placeholder="Password" maxlength="10" @input="pwdCheck()">
	                                        </div>
	                                        <div class="u-s-m-b-30">
	                                            <label class="gl-label" for="reg-lname">
	                                            	비밀번호 확인
	                                            	<span class="btn-sm btn-default" style="float: right;" id="pwdView2" @click="pwdView(2)"><i :class="pwdView2?'fas fa-eye':'fas fa-eye-slash'"></i></span>
	                                            </label>
	                                            <input class="input-text input-text--primary-style" type="password" ref="pwd2" v-model="pwd2" placeholder="Password" maxlength="10" @input="pwdCheck()">
	                                        </div>
                                        </div>
                                        <div class="gl-inline">
	                                        <div class="u-s-m-b-30">
	                                        </div>
	                                        <div class="u-s-m-b-30">
	                                            <span v-if="pwdMsg!==''" :style="isPWD?'color:green':'color:red'">{{pwdMsg}}</span>
	                                        </div>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-lname">이름</label>
                                            <input class="input-text input-text--primary-style" type="text" ref="name" v-model="name">
                                        </div>
                                        <div class="gl-inline">
                                            <div class="u-s-m-b-30">
	                                            <label class="gl-label" for="reg-lname">생년월일</label>
	                                            <input class="input-text input-text--primary-style" id="birthday" type="date" ref="birthday" v-model="birthday">
                                            </div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="gender">성별</label>
                                                <select class="select-box select-box--primary-style u-w-100" ref="sex" v-model="sex">
                                                    <option selected disabled>Select</option>
                                                    <option value="남자">남자</option>
                                                    <option value="여자">여자</option>
                                                </select></div>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-lname">이메일</label>
                                            <input class="input-text input-text--primary-style" type="email" ref="email" v-model="email">
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-password">전화번호</label>
                                            <input class="input-text input-text--primary-style" type="text" ref="phone" v-model="phone" placeholder="(-)를 빼고 입력해주세요" @input="phoneCheck()" @focus="phoneFocus()">
                                         </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-password">우편번호</label>
                                            <input class="input-text input-text--primary-style" type="text" ref="post" v-model="post" style="width: 70%;margin-right: 10px" readonly>
                                            <input type="button" class="btn-sm btn-success" value="우편번호 찾기" style="width: 25%" @click="postFind()">
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-password">주소</label>
                                            <input class="input-text input-text--primary-style" type="text" ref="addr1" v-model="addr1" readonly>
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-password">상세주소</label>
                                            <input class="input-text input-text--primary-style" type="text" ref="addr2" v-model="addr2">
                                        </div>
                                        <div class="u-s-m-b-30">
                                            <label class="gl-label" for="reg-password">소개</label>
                                            <input class="input-text input-text--primary-style" type="text" ref="content" v-model="content">
                                        </div>
                                        <div class="u-s-m-b-30 text-center">
                                            <input type="button" class="btn-sm btn-primary" value="회원가입" style="margin-right: 10px" @click="signup()">
                                            <input type="button" class="btn-sm btn-danger" value="취소" @click="cancel()">
                                        </div>
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
    <script src="../js/member/signup.js"></script>
</body>
</html>