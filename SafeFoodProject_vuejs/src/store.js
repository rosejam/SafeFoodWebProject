import Vue from 'vue';
import Vuex from 'vuex';
import Constant from './Constant';
import axios from './axios-common';

Vue.use(Vuex);

const store = new Vuex.Store({
    
    //state
    state: {
        qnalist: [],
        qna: {}
    },

    actions: { // 외부와의 통신을 통해 데이터 처리 dispath에 의해 호출됨.    
        [Constant.GET_QNALIST]: (store) =>{
            axios
            .get("/list")
            .then(response => {
                store.commit(Constant.GET_QNALIST, {qnalist: response.data});
            })
            .catch(exp => alert("getQnaList처리에 실패하였습니다. " + exp));  
        }
        ,
        [Constant.GET_QNA]: (store, payload) => {
            axios
            .get("/list/id/" + payload)
            .then(response => {
                store.commit(Constant.GET_QNA, {qna: response.data});
            })
            .catch(exp => alert("getQna처리에 실패하였습니다. " + exp));
        },
        [Constant.ADD_Q]: (store, payload) => {
            axios
            .post("/add/question", payload.qna) //this.qna로 넣었던 qna객체
            .then(() => {
                store.dispatch(Constant.GET_QNALIST); //위와 두줄 순서는 상관없는듯
                //console.log(response.data);
            })
            .catch(exp => alert("삽입 처리에 실패하였습니다. " + exp));
        },
        [Constant.ADD_A]: (store, payload) => {
            axios
            .put("/add/answer", payload.qna) //this.qna로 넣었던 qna객체
            .then(() => {
                store.dispatch(Constant.GET_QNALIST); //위와 두줄 순서는 상관없는듯
                //console.log(response.data);
            })
            .catch(exp => alert("삽입 처리에 실패하였습니다. " + exp));
        },
        [Constant.REMOVE_QNA]: (store, payload) => {
            axios
            .delete("/question/delete/" + payload)
            .then(() => {
                store.dispatch(Constant.GET_QNALIST);
            })
            .catch(exp => alert("삭제 처리에 실패하였습니다. " + exp));
        },
        [Constant.UPDATE_QNA]: (store, payload) => {
            axios
            .put("/question/update", payload.qna)
            .then(() => {
                store.dispatch(Constant.GET_QNALIST);
            })
            .catch(exp => alert("업뎃 처리에 실패하였습니다. " + exp));
        }
    },

    mutations: { // 저장소에 데이터 실제 반영(commit시 호출됨)
        [Constant.GET_QNALIST]: (state, payload) => {
            state.qnalist = payload.qnalist;
        },
        [Constant.GET_QNA]: (state, payload) => {            
            state.qna = payload.qna;
        }
    }
});


export default store;