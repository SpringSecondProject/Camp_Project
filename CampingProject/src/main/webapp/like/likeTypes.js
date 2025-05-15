window.LIKE_TYPES = {
  CAMP: 0,
  SHOP: 1,
  RECIPE: 2,
  CAR: 3,
  COMMUNITY: 4
};

window.likeUtil = {
  loadLikedCamps(vm, type) {
    axios.get("../like/list_vue.do", {
      params: { type },
      withCredentials: true
    }).then(res => {
      vm.likedCamps = res.data;
    })
  },

  likeCamp(vm, no, type) {
    axios.post("../like/insert_vue.do", {
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
    })
  }
};
