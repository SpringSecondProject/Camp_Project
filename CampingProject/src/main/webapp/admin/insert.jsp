<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container {
  margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 800px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <h3 class="text-center">글쓰기</h3>
      <form method="post" action="insert_ok.do" enctype="multipart/form-data">
  <table class="table">
    <tr>
      <th>아이디</th>
      <td><input type="text" name="id" required class="input-sm"></td>
    </tr>
    <tr>
      <th>닉네임</th>
      <td><input type="text" name="nickname" required class="input-sm"></td>
    </tr>
    <tr>
      <th>제목</th>
      <td><input type="text" name="subject" required class="input-sm"></td>
    </tr>
    <tr>
      <th>내용</th>
      <td><textarea name="content" rows="5" cols="52" required></textarea></td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type="submit" value="글쓰기" class="btn btn-sm btn-danger">
        <input type="button" value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
</form>
    </div>
  </div>
</body>
</html>
