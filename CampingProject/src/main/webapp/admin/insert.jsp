<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
  background-color: #f8f9fa;
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.form-card {
  background-color: white;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 800px;
}

.form-card h3 {
  text-align: center;
  margin-bottom: 30px;
  font-weight: bold;
  color: #333;
}
</style>
</head>
<body>
  <div class="container">
    <div class="form-card">
      <h3>글쓰기</h3>
      <form method="post" action="insert_ok.do" enctype="multipart/form-data">
        <table class="table">
          <tr>
            <th width="15%">아이디</th>
            <td>
              <input type="text" name="id" class="form-control input-sm" required>
            </td>
          </tr>
          <tr>
            <th>닉네임</th>
            <td>
              <input type="text" name="nickname" class="form-control input-sm" required>
            </td>
          </tr>
          <tr>
            <th>제목</th>
            <td>
              <input type="text" name="subject" class="form-control input-sm" required>
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
              <textarea name="content" rows="5" class="form-control" required></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <input type="submit" value="글쓰기" class="btn btn-danger btn-sm">
              <input type="button" value="취소" class="btn btn-primary btn-sm" onclick="history.back()">
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</body>
</html>
