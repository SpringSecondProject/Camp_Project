<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<title></title>
	<script src="https://cdn.tailwindcss.com"></script>
	<style>
      /* 최상위 영역 명시적으로 선언 */
      .comm-write-wrapper {
        background-color: #f4f6f9;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333;
        padding: 60px 15px;
      }

      .comm-write-container {
        max-width: 730px;
        margin: 0 auto;
        padding: 40px 35px;
        background-color: #ffffff;
        border-radius: 15px;
        box-shadow: 0 15px 40px rgba(0, 0, 0, 0.05);
        transition: transform 0.3s ease;
      }

      .comm-write-container:hover {
        transform: translateY(-5px);
      }

      .comm-write-container h2.title {
        font-weight: 700;
        font-size: 26px;
        margin-bottom: 30px;
        color: #222;
        text-align: center;
      }

      .comm-write-container label.form-label {
        font-weight: 500;
        margin-bottom: 10px;
      }

      .comm-write-container input[type="text"],
      .comm-write-container textarea {
        background-color: #f9f9f9;
        border-radius: 10px;
        border: 1px solid #ddd;
        padding: 12px 15px;
        font-size: 15px;
        transition: border 0.3s ease, box-shadow 0.3s ease;
        width: 100%;
      }

      .comm-write-container input[type="text"]:focus,
      .comm-write-container textarea:focus {
        border-color: #4CAF50;
        box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
        outline: none;
      }

      .comm-write-container .hashtag-label {
        display: inline-block;
        padding: 10px 20px;
        border: 2px solid #ccc;
        border-radius: 50px;
        cursor: pointer;
        font-size: 14px;
        color: #666;
        background-color: #f9f9f9;
        transition: all 0.25s ease-in-out;
      }

      .comm-write-container input[type="checkbox"]:checked + .hashtag-label {
        border-color: #4CAF50;
        background-color: #e8f5e9;
        color: #4CAF50;
        font-weight: 600;
      }

      .comm-write-container input[type="checkbox"] {
        display: none;
      }

      .comm-write-container .btn-cancel,
      .comm-write-container .btn-submit {
        height: 50px;
        font-size: 16px;
        font-weight: 600;
        border-radius: 10px;
        width: 48%;
      }

      .comm-write-container .btn-cancel {
        background-color: #f1f1f1;
        color: #333;
        transition: background-color 0.3s ease;
      }

      .comm-write-container .btn-cancel:hover {
        background-color: #ddd;
      }

      .comm-write-container .btn-submit {
        background-color: #4CAF50;
        color: #fff;
        transition: background-color 0.3s ease;
      }

      .comm-write-container .btn-submit:hover {
        background-color: #45a049;
      }

      .comm-write-container .form-section {
        margin-bottom: 30px;
      }

      .comm-write-container .hashtags-wrap {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
      }

      @media (max-width: 576px) {
        .comm-write-container {
          padding: 30px 20px;
        }
      }
	</style>
</head>

<body>
<div id="serviceWriteApp" class="comm-write-wrapper">
	<div class="comm-write-container">
		<h2 class="title">문의사항 작성</h2>
		<!-- 제목 -->
		<div class="form-section">
			<label for="title" class="form-label text-2xl">제목</label>
			<input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
		</div>

		<!-- 내용 -->
		<div class="form-section">
			<label for="content" class="form-label text-2xl">내용</label>
			<textarea id="content" name="content" rows="12" placeholder="내용을 입력하세요"
			          class="resize-none"
			          required></textarea>
		</div>
		<!-- 버튼 영역 -->
		<div class="flex justify-between">
			<button type="button" class="btn btn-cancel" @click="writeCancel()">
				취소하기
			</button>
			<button type="submit" class="btn btn-submit" @click="dataRecv()">
				등록하기
			</button>
		</div>
	</div>
</div>
</body>
<script>
  let serviceListApp = Vue.createApp({
    methods: {
      dataRecv() {
        axios.post('/web/service/write_vue.do', {
          pid: '${sessionScope.userid}',
          title: document.getElementById('title').value,
          content: document.getElementById('content').value,
        }).then(res => {
          alert('문의사항이 성공적으로 작성되었습니다.')
          location.href = '/web/service/list.do'
        }).catch(error => {
          alert('문의사항 작성이 실패하였습니다.')
          console.log(error)
          throw Error(res.statusText)
        })
      },
      writeCancel() {
        if (confirm("정말 취소하시고 이전화면으로 이동하시겠습니까?")) {
          history.back();
        }
      },
    }
  }).mount("#serviceWriteApp")
</script>