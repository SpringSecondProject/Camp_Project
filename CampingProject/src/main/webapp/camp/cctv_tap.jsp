<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>

</head>
<body>
	<div class="u-s-p-y-90">
		<div class="container">
			<div class="row">
				<c:choose>
					<c:when test="${not empty cctv and cctv.cctvformat eq 'HLS'}">
						<h3>${cctv.cctvname}</h3>
						<video id="cctvVideo" width="900" controls autoplay muted></video>

						<script>
							const video = document.getElementById('cctvVideo');
							const videoSrc = "${cctv.cctvurl}";

							if (Hls.isSupported()) {
								const hls = new Hls();
								hls.loadSource(videoSrc);
								hls.attachMedia(video);
								hls.on(Hls.Events.MANIFEST_PARSED, function() {
									video.play();
								});
							} else if (video
									.canPlayType('application/vnd.apple.mpegurl')) {
								video.src = videoSrc;
								video.addEventListener('loadedmetadata',
										function() {
											video.play();
										});
							} else {
								alert("브라우저가 HLS를 지원하지 않습니다.");
							}
						</script>
					</c:when>

					<c:otherwise>
						<h1 style="text-align: center;">CCTV가 없습니다</h1>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</body>
</html>