<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<title></title>
	<script src="https://cdn.tailwindcss.com"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<style>
      .inline-calendar .flatpickr-calendar {
        width: 100%;
        max-width: 300px;
        border: 1px solid #e2e8f0;
        border-radius: 0.5rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      .flatpickr-day.selected {
        background-color: #4a90e2;
        border-color: #4a90e2;
        color: white;
      }

      .flatpickr-day.startRange,
      .flatpickr-day.endRange {
        background-color: #4a90e2;
        border-color: #4a90e2;
      }

      .flatpickr-weekdays {
        background-color: #f7f7f7;
      }

      .flatpickr-day.today {
        background-color: #e0f7fa;
        font-weight: bold;
      }

      .flatpickr-day.disabled {
        color: #a0aec0;
      }
	</style>
</head>
<body>
<div id="campcarDetailApp"
     class="flex w-screen min-h-screen p-12 justify-center">
	<div class="flex flex-col w-3/4 h-full items-center gap-8">
		<jsp:include page="components/breadcrumb.jsp"/>
		<div class="flex flex-row w-full h-full gap-4">
			<div class="flex p-4 w-1/2">
				<img :src="item.poster || '../assets/images/no_image.webp'" alt=""
				     class="w-full rounded-xl"/>
			</div>
			<div class="flex flex-col w-1/2 p-4 justify-center items-center">
				<div id="dateRangePicker" class="inline-calendar"></div>
				<p class="mt-2 text-gray-600">선택된 기간: {{ rangeText || '기간을 선택하세요' }}</p>
			</div>
		</div>
		<div class="mt-4 mb-12 w-full border-b border-gray-400"></div>
		<div class="flex flex-row-reverse w-full h-full gap-4">
			<div class="flex flex-col gap-4 w-1/2 h-full font-normal text-left px-12">
				<p class="text-4xl">모델명: {{ item.name }}</p>
				<p class="text-3xl">최대인원: {{ item.capacity }}명</p>
				<p class="text-3xl">가격: {{ formatPrice(item.price) }}원/일</p>
				<div class="my-4 w-full border-b border-gray-400"></div>
				<p class="text-3xl">총 가격: {{ formatPrice(calculateTotalPrice()) }}원</p>
				<button class="px-8 py-4 bg-blue-500 text-white rounded-xl shadow-lg hover:bg-blue-600 font-normal text-2xl mt-8"
				        @click="goRent()">
					결제하기
				</button>
			</div>
			<div class="w-1/2 h-full min-h-screen p-4" v-html="item.content">
			</div>
		</div>
	</div>
</div>
<script>
  let campcarDetailApp = Vue.createApp({
    data() {
      const param = new URLSearchParams(window.location.search)
      return {
        id: param.get('id'),
        item: {},
        startDate: null,
        endDate: null,
        endDatePicker: null,
        rangeText: null,
        finalPrice: 0,
      }
    },
    mounted() {
      const vm = this;
      setTimeout(() => {
        flatpickr("#dateRangePicker", {
          inline: true,
          mode: "range",
          dateFormat: "Y-m-d",
          minDate: "today",
          locale: "ko", // 한글 설정
          onChange: (selectedDates, dateStr, instance) => {
            if (selectedDates.length === 2) {
              vm.startDate = selectedDates[0] ? selectedDates[0].toISOString().split('T')[0] : null;
              vm.endDate = selectedDates[1] ? selectedDates[1].toISOString().split('T')[0] : null;
              vm.rangeText = vm.startDate + " ~ " + vm.endDate;
            } else {
              vm.startDate = null;
              vm.endDate = null;
              vm.rangeText = null;
            }
          },
          onReady: (selectedDates, dateStr, instance) => {
            // 한글 요일 설정 (flatpickr 기본 한글 지원 부족 시 커스터마이징)
            instance.weekdayContainer.innerHTML = `
              <div class="flatpickr-weekdays">
                <span class="flatpickr-weekday">일</span>
                <span class="flatpickr-weekday">월</span>
                <span class="flatpickr-weekday">화</span>
                <span class="flatpickr-weekday">수</span>
                <span class="flatpickr-weekday">목</span>
                <span class="flatpickr-weekday">금</span>
                <span class="flatpickr-weekday">토</span>
              </div>
            `;
          },
        });

        this.dataRecv();
      }, 100);
    },
    methods: {
      dataRecv() {
        axios.get('/web/campcar/detail_vue.do', {
          params: {
            id: this.id
          }
        }).then(res => {
          this.item = res.data
        }).catch(error => {
          console.log(error.response)
        })
      },
      formatPrice(price) {
        return (price || 0).toLocaleString('ko-KR');
      },
      calculateTotalPrice() {
        if (this.startDate && this.endDate) {
          const start = new Date(this.startDate);
          const end = new Date(this.endDate);
          const days = Math.ceil((end - start) / (1000 * 60 * 60 * 24));
          const dailyPrice = this.item.price || 0;
          this.finalPrice = dailyPrice + ((days - 1) * (dailyPrice / 6));
          return this.finalPrice;
        }
        return 0;
      },
      goRent() {
        if (this.startDate && this.endDate) {
          console.log(this.startDate)
          console.log(this.endDate)
          console.log(this.finalPrice)
        } else {
          alert('기간을 선택해주세요.');
        }
      }
    }
  }).mount('#campcarDetailApp')
</script>
</body>
