<template>
  <div>
    <ul>
      <li v-for="qnaItem in qnalist" v-bind:key="qnaItem.num" class="shadow" 
        :class="{done: qnaItem.answer != null}" @click.stop="getQna(qnaItem.num)" >

        <span v-if="qnaItem.answer == null" class ="answer-request">답변 요청</span>
            <span v-else class ="answer-complete">답변 완료</span>

        
        {{qnaItem.qna}}:{{qnaItem.writer}} <!-- 꺼내서 이 두정보만 출력 -->
        <span
          class="removeBtn" @click.stop="removeQna(qnaItem.num)">
          <i>삭제</i>
        </span>
      </li>
    </ul>
  </div>
</template>

<script>
import Constant from '../Constant';

export default {
  computed: {
    //store안의 qnalist check
    qnalist() {
      return this.$store.state.qnalist;
    }
  },
  created () {
    this.$store.dispatch(Constant.GET_QNALIST)
    .then(()=> this.$router.push('/list')); //action call
  },
  methods: {
    //getQna, removeQna, AnswerQna
    getQna(num){
      this.$router.push('/detail/' + num);//'/detail/:num'을 통해 QnaDetail.vue로 화면이 넘어가야 함
    },

    removeQna(num){
      this.$store.dispatch(Constant.REMOVE_QNA, num); //data이름 없이 그냥 보냈는데 받는 쪽에서 payload로 받음
    },
    AnswerQna(num){
      this.$router.push('/answer/' + num);
    }
  },
};
</script>

<style scoped>
.shadow {
box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.03)
}
.answer-request{
  color: #62acde;
}
.answer-complete{
  color : red;
}
ul {
  list-style-type: none;
  padding-left: 0px;
  margin-top: 0;
  text-align: left;
}
li {
  display: flex;
  min-height: 50px;
  height: 50px;
  line-height: 50px;
  margin: 0.5rem 0;
  padding: 0 0.9rem;
  background: white;
  border-radius: 5px;
}
.checkBtn {
  line-height: 45px;
  color: #62acde;
  margin-right: 5px;
}
.removeBtn {
  margin-left: auto;
  color: #de4343;
}

.list-item {
  display: inline-block;
  margin-right: 10px;
}
.list-move {
  transition: transform 1s;
}
.list-enter-active,
.list-leave-active {
  transition: all 1s;
}
.list-enter,
.list-leave-to {
  opacity: 0;
  transform: translateY(30px);
}
.answered{
  background-color: lightslategray;
}
</style>