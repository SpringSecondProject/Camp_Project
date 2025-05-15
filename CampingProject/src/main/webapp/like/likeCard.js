window.likeCard = {
  props: ['cno', 'likedCamps'],
  template: `
    <div class="product-m__wishlist">
      <a :class="likedCamps.includes(cno) ? 'fas fa-heart' : 'far fa-heart'"
         :style="{ color: likedCamps.includes(cno) ? '#ff1500' : '' }"
         title="좋아요"
         @click.prevent="$parent.likeCamp(cno)">
      </a>
    </div>
  `
} 
