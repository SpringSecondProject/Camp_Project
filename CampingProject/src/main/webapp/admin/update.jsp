<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
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
      <h3>수정하기</h3>
      <form method="post" action="update_ok.do">
        <input type="hidden" name="bno" value="${param.bno }">
        <table class="table">
          <tr>
            <th width="15%">아이디</th>
            <td width="85%">
              <input type="text" name="id" class="form-control input-sm" required value="${vo.id }">
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td>
              <input type="text" name="nickname" class="form-control input-sm" required value="${vo.nickname }">
            </td>
          </tr>
          <tr>
            <th>제목</th>
            <td>
              <input type="text" name="subject" class="form-control input-sm" required value="${vo.subject }">
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
              <textarea name="content" rows="5" class="form-control" required>${vo.content }</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <input type="submit" value="수정" class="btn btn-danger btn-sm">
              <input type="button" value="취소" class="btn btn-primary btn-sm" onclick="javascript:history.back()">
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</body>
</html>