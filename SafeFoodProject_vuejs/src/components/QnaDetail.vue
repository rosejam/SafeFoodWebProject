<template>
  <div>
    <table>
      <tbody>
        <tr>
          <td>번호</td>
          <td>            
            {{qna.num}}
          </td>
        </tr>
        <tr>
          <td>제목</td>
          <td>            
            {{qna.title}}
          </td>
        </tr>
        <tr>
          <td>작성자</td>
          <td>
            {{qna.writer}}
          </td>
        </tr>
        <tr>
          <td>작성일</td>
          <td>
            {{qna.wdate}}
          </td>
        </tr>
        <tr>
          <td>질문</td>
          <td>
           <div> {{qna.question}}</div>
            <button @click="updateQ">수정</button>
          </td>
        </tr>
        <tr>
          <td>답변</td>
          <td>
            <span v-if="qna.answer != null">{{qna.answer}}</span>
            <span v-else><button @click="AnswerQna">답변달기</button></span>
          </td>
        </tr>
       </tbody>
    </table>
  </div>
</template>

<script>
import Constant from "../Constant";
export default {

  created() {
    //call getQna with param
    this.getQna(this.$route.params.num);
  },
  computed: {
    qna(){
      return this.$store.state.qna; //qna값을 감시
    }
  },

  methods: {
    getQna(num) {
      //action call
      this.$store.dispatch(Constant.GET_QNA, num) //파라메터를 객체로 보냈으므로 store.js에서 payload.id로 꺼내서 사용!! (그냥 보냈으면 그냥 payload로 사용)
                                                          //qna를 선택한 것으로 바꾸어 준다.
    },
    updateQ(){
      this.$router.push('/update/' + this.num);
    },
    AnswerQna(){
      this.$router.push('/answer/' + this.$route.params.num);
    },
    clear() { //이건 안쓰나?
      this.qna = {}; 
    }
  }
};
</script>

<style scoped>
input:focus {
  outline: none;
}
.inputBox {
  background: white;
  height: 50px;
  line-height: 50px;
  border-radius: 5px;
}
.inputBox input {
  border-style: none;
  font-size: 0.9rem;
}
.addContainer {
  background: linear-gradient(to right, #6478fb, #8763fb);
  display: inline-block;
  width: 3rem;
  border-radius: 0 5px 5px 0;
}

.modifyBtn {
  color: white;
  vertical-align: middle;
}

table {
  margin: 10px auto;
  border-collapse: collapse;
  border: 2px solid #996;
  font: normal 90%/140% verdana, arial, helvetica, sans-serif;
  color: #333;
  background: #fffff0;
}

.caption {
  background-color: #222;
  vertical-align: middle;
  text-align: center;
  padding: 15px;
  font-size: 20px;
  color: #fff;
}

td,
th {
  border: 1px solid #cc9;
  padding: 0.3em;
}
thead th,
tfoot th {
  background-color: "#f5deb3";
  border: 1px solid #cc9;
  text-align: center;
  font-size: 1em;
  font-weight: bold;
  color: #444;
  background: #dbd9c0;
}
tbody td a {
  background: transparent;
  color: #72724c;
  text-decoration: none;
  border-bottom: 1px dotted #cc9;
}
tbody td a:hover {
  background: transparent;
  color: #666;
  border-bottom: 1px dotted #72724c;
}
tbody th a {
  background: transparent;
  color: #72724c;
  text-decoration: none;
  font-weight: bold;
  border-bottom: 1px dotted #cc9;
}
tbody th a:hover {
  background: transparent;
  color: #666;
  border-bottom: 1px dotted #72724c;
}
tbody th,
tbody td {
  vertical-align: top;
  text-align: center;
}
tfoot td {
  border: 1px solid #996;
}
.odd {
  color: #333;
  background: #f7f5dc;
}
tbody tr:hover {
  color: #333;
  background: #fff;
}
tbody tr:hover th,
tbody tr.odd:hover th {
  color: #333;
  background: #ddd59b;
}

tbody tr {
  height: 50px;
  line-height: 50px;
}
ul {
  padding: 22px 50px 50px 490px;
  width: 940px;
  list-style: none;
}
#gnb li {
  display: inline;
}
#gnb li a {
  display: inline-block;
  background: #222;
  color: #fff;
  width: 150px;
  height: 23px;
  padding-top: 3px;
  text-align: center;
}
#gnb li a:hover {
  background: #900;
}
</style>