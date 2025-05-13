window.LIKE_TYPES = {
  CAMP: 0,
  SHOP: 1,
  RECIPE: 2,
  CAR: 3,
  COMMUNITY: 4
};

window.likeUtil = {
  loadLikedCamps(vm, type = LIKE_TYPES.CAMP) {
    axios.get("http://localhost:8080/web/like/list_vue.do", {
      params: { type },
      withCredentials: true
    }).then(res => {
      vm.likedCamps = res.data;
    });
  },


};
