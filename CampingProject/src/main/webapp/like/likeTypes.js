window.LIKE_TYPES = {
  CAMP: 0,
  SHOP: 1,
  RECIPE: 2,
  CAR: 3,
  COMMUNITY: 4
};

let listApp=Vue.createApp({
			data(){
				return{
				likedCamps: [] // 로그인 유저가 좋아요한거 표시
				}
			},
			mounted(){
			this.loadLikedCamps()
			},
			methods:{
			loadLikedCamps(vm, type = window.LIKE_TYPES.CAMP) {
    axios.get("/web/like/list_vue.do", {
      params: { type },
      withCredentials: true
    }).then(res => {
      vm.likedCamps = res.data;
    });
  },

  likeCamp(vm, no, type = window.LIKE_TYPES.CAMP) {
    axios.post("/web/like/insert_vue.do", {
      no,
      type
    }, {
      withCredentials: true
    }).then(res => {
      if (res.data.msg === "NOLOGIN") {
        alert("로그인이 필요합니다");
      } else {
        if (!vm.likedCamps.includes(no)) {
          vm.likedCamps.push(no);
        }
        alert(res.data.msg);
      }
    }).catch(err => {
      if (err.response && err.response.status === 401) {
        alert("로그인이 필요합니다.");
      } else {
        alert("오류 발생");
      }
    });
  }
			}
		}).mount("#campApp")
