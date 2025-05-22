<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 내용보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
  .container {
    max-width: 800px;
  }
  h3 {
    text-align: center;
    margin-bottom: 30px;
    font-weight: bold;
    font-size: 28px;
  }
  .table th, .table td {
    vertical-align: middle !important;
  }
  .content-box {
    border: 1px solid #ddd;
    padding: 15px;
    background-color: #fafafa;
    white-space: pre-wrap;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 16px;
    min-height: 200px;
  }
  .btn-group {
    text-align: right;
    margin-top: 20px;
  }
  .btn-group a {
    margin-left: 10px;
  }
</style>
</head>
<body>
  <div class="container" style="height: 550px;">
    <h3>내용보기</h3>
    <table class="table table-bordered">
      <tr>
        <th width="20%" class="text-center">번호</th>
        <td width="30%" class="text-center">${vo.bno}</td>
        <th width="20%" class="text-center">조회수</th>
        <td width="30%" class="text-center">${vo.hit}</td>
      </tr>
      <tr>
        <th width="20%" class="text-center">이름</th>
        <td width="30%" class="text-center">${vo.nickname}</td>
        <th width="20%" class="text-center">작성일</th>
        <td width="30%" class="text-center">${vo.regdate}</td>
      </tr>
      <tr>
        <th class="text-center">제목</th>
        <td colspan="3">${vo.subject}</td>
      </tr>
      <tr>
        <td colspan="4">
          <div class="content-box">${vo.content}</div>
        </td>
      </tr>
    </table>
    <div class="btn-group">
      <a href="update.do?bno=${vo.bno}" class="btn btn-danger btn-sm">수정</a>
      <a href="delete.do?bno=${vo.bno}" class="btn btn-success btn-sm">삭제</a>
      <a href="list.do" class="btn btn-warning btn-sm">목록</a>
    </div>
  </div>
</body>
</html>
