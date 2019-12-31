<template>
    <div class="inputBox">
        제목 : <input type="text" v-model="qna.title" placeholder="제목" >
        작성자 : <input type="text" v-model="qna.writer" placeholder="작성자">
        <br>
        <textarea v-model="qna.question" placeholder="내용"></textarea><br>
        <button class="w3-button w3-light-grey w3-block" @click="addQ" >
            입력
        </button>
      
    </div>
</template>

<script>
import Constant from '../Constant';
export default {
    data() {
        return {
            qna : {
                title: '',
                writer: '',
                question: ''
            }//json객체
        }
    },
    
    methods: {
        addQ(){
            //action call(액션 호출)
            this.$store.dispatch(Constant.ADD_Q, {qna: this.qna}); //db insert
            this.$router.push('/list'); //router로 목록화면으로 넘어감(insert된 것까지 추가된 리스트)
            this.clear();
        },
        clear(){ //qna를 다시 비움
            this.qna = {};
        }
    }
}     
</script>

<style scoped>
textarea {
  
  width : 450px;
  height:  450px;
}
input:focus {
  outline: none;
}
.inputBox {
 
  background: white;
  line-height: 50px;
  border-radius: 5px;
}
.inputBox input {
  border-style: none;
  font-size: 0.9rem;
}

.addContainer{
  background: linear-gradient(to right, #647811, #527810);
  display: inline-block;
  width: 3rem;
  border-radius: 5px 5px 5px 5px;
}
.modifyBtn, .addBtn {
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