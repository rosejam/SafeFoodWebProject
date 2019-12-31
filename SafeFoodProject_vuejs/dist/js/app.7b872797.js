(function(t){function n(n){for(var a,i,s=n[0],u=n[1],c=n[2],p=0,d=[];p<s.length;p++)i=s[p],Object.prototype.hasOwnProperty.call(r,i)&&r[i]&&d.push(r[i][0]),r[i]=0;for(a in u)Object.prototype.hasOwnProperty.call(u,a)&&(t[a]=u[a]);l&&l(n);while(d.length)d.shift()();return o.push.apply(o,c||[]),e()}function e(){for(var t,n=0;n<o.length;n++){for(var e=o[n],a=!0,s=1;s<e.length;s++){var u=e[s];0!==r[u]&&(a=!1)}a&&(o.splice(n--,1),t=i(i.s=e[0]))}return t}var a={},r={app:0},o=[];function i(n){if(a[n])return a[n].exports;var e=a[n]={i:n,l:!1,exports:{}};return t[n].call(e.exports,e,e.exports,i),e.l=!0,e.exports}i.m=t,i.c=a,i.d=function(t,n,e){i.o(t,n)||Object.defineProperty(t,n,{enumerable:!0,get:e})},i.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},i.t=function(t,n){if(1&n&&(t=i(t)),8&n)return t;if(4&n&&"object"===typeof t&&t&&t.__esModule)return t;var e=Object.create(null);if(i.r(e),Object.defineProperty(e,"default",{enumerable:!0,value:t}),2&n&&"string"!=typeof t)for(var a in t)i.d(e,a,function(n){return t[n]}.bind(null,a));return e},i.n=function(t){var n=t&&t.__esModule?function(){return t["default"]}:function(){return t};return i.d(n,"a",n),n},i.o=function(t,n){return Object.prototype.hasOwnProperty.call(t,n)},i.p="/";var s=window["webpackJsonp"]=window["webpackJsonp"]||[],u=s.push.bind(s);s.push=n,s=s.slice();for(var c=0;c<s.length;c++)n(s[c]);var l=u;o.push([0,"chunk-vendors"]),e()})({0:function(t,n,e){t.exports=e("56d7")},1756:function(t,n,e){},"19ed":function(t,n,e){"use strict";var a=e("d817"),r=e.n(a);r.a},"2c4b":function(t,n,e){"use strict";var a=e("b18a"),r=e.n(a);r.a},3795:function(t,n,e){"use strict";var a=e("f6c0"),r=e.n(a);r.a},"40ba":function(t,n,e){"use strict";var a=e("f405"),r=e.n(a);r.a},"4aac":function(t,n,e){"use strict";var a=e("1756"),r=e.n(a);r.a},"53db":function(t,n,e){"use strict";var a=e("5884"),r=e.n(a);r.a},"56d7":function(t,n,e){"use strict";e.r(n);e("e260"),e("e6cf"),e("cca6"),e("a79d");var a=e("2b0e"),r=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{attrs:{id:"app"}},[e("QnaHeader"),e("br"),e("div",[e("router-view")],1)],1)},o=[],i=e("8c4f"),s=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",[e("router-link",{staticStyle:{"text-decoration":"none"},attrs:{to:"/input"}},[t._v("+Question")]),t._v(" / "),e("router-link",{staticStyle:{"text-decoration":"none"},attrs:{to:"/list"}},[t._v("QnA List")])],1)},u=[],c={created:function(){this.$router.push("/list")}},l=c,p=(e("3795"),e("2877")),d=Object(p["a"])(l,s,u,!1,null,"7bfbe6ed",null),f=d.exports,h=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",[e("ul",t._l(t.qnalist,(function(n){return e("li",{key:n.num,staticClass:"shadow",class:{done:null!=n.answer},on:{click:function(e){return e.stopPropagation(),t.getQna(n.num)}}},[null==n.answer?e("span",{staticClass:"answer-request"},[t._v("답변 요청")]):e("span",{staticClass:"answer-complete"},[t._v("답변 완료")]),t._v(" "+t._s(n.qna)+":"+t._s(n.writer)+" "),e("span",{staticClass:"removeBtn",on:{click:function(e){return e.stopPropagation(),t.removeQna(n.num)}}},[e("i",[t._v("삭제")])])])})),0)])},v=[],m={GET_QNALIST:"getQnaList",GET_QNA:"getQna",ADD_Q:"addQ",ADD_A:"addA",REMOVE_QNA:"removeQna",UPDATE_QNA:"updateQna"},_={computed:{qnalist:function(){return this.$store.state.qnalist}},created:function(){var t=this;this.$store.dispatch(m.GET_QNALIST).then((function(){return t.$router.push("/list")}))},methods:{getQna:function(t){this.$router.push("/detail/"+t)},removeQna:function(t){this.$store.dispatch(m.REMOVE_QNA,t)},AnswerQna:function(t){this.$router.push("/answer/"+t)}}},q=_,b=(e("53db"),Object(p["a"])(q,h,v,!1,null,"c82d6ebe",null)),Q=b.exports,w=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"inputBox"},[t._v(" 제목 : "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.qna.title,expression:"qna.title"}],attrs:{type:"text",placeholder:"제목"},domProps:{value:t.qna.title},on:{input:function(n){n.target.composing||t.$set(t.qna,"title",n.target.value)}}}),t._v(" 작성자 : "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.qna.writer,expression:"qna.writer"}],attrs:{type:"text",placeholder:"작성자"},domProps:{value:t.qna.writer},on:{input:function(n){n.target.composing||t.$set(t.qna,"writer",n.target.value)}}}),e("br"),e("textarea",{directives:[{name:"model",rawName:"v-model",value:t.qna.question,expression:"qna.question"}],attrs:{placeholder:"내용"},domProps:{value:t.qna.question},on:{input:function(n){n.target.composing||t.$set(t.qna,"question",n.target.value)}}}),e("br"),e("button",{staticClass:"w3-button w3-light-grey w3-block",on:{click:t.addQ}},[t._v(" 입력 ")])])},g=[],A={data:function(){return{qna:{title:"",writer:"",question:""}}},methods:{addQ:function(){this.$store.dispatch(m.ADD_Q,{qna:this.qna}),this.$router.push("/list"),this.clear()},clear:function(){this.qna={}}}},$=A,E=(e("40ba"),Object(p["a"])($,w,g,!1,null,"24b750b0",null)),T=E.exports,O=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"inputBox shadow"},[t._v(" 내용 : "),e("textarea",{directives:[{name:"model",rawName:"v-model",value:t.qna.answer,expression:"qna.answer"}],attrs:{placeholder:"내용"},domProps:{value:t.qna.answer},on:{input:function(n){n.target.composing||t.$set(t.qna,"answer",n.target.value)}}}),e("button",{on:{click:t.addA}},[t._v("확인")])])},x=[],j={created:function(){this.getQna(this.$route.params.num)},computed:{qna:function(){return this.$store.state.qna}},methods:{getQna:function(t){this.$store.dispatch(m.GET_QNA,t)},addA:function(){var t=this;this.$store.dispatch(m.ADD_A,{qna:this.qna}).then((function(){t.$router.push("/list"),t.clear()}))},clear:function(){this.qna={}}}},N=j,y=(e("bc8a"),Object(p["a"])(N,O,x,!1,null,"6328d648",null)),P=y.exports,S=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"inputBox shadow"},[t._v(" 수정 내용 : "),e("textarea",{directives:[{name:"model",rawName:"v-model",value:t.qna.question,expression:"qna.question"}],attrs:{placeholder:"내용"},domProps:{value:t.qna.question},on:{input:function(n){n.target.composing||t.$set(t.qna,"question",n.target.value)}}}),e("button",{on:{click:t.updateQ}},[t._v("확인")])])},D=[],G={created:function(){this.getQna(this.$route.params.num)},computed:{qna:function(){return this.$store.state.qna}},methods:{updateQ:function(){this.$store.dispatch(m.UPDATE_QNA,{qna:this.qna}),this.$router.push("/list"),this.clear()},clear:function(){this.qna={}}}},k=G,L=(e("4aac"),Object(p["a"])(k,S,D,!1,null,"558075bc",null)),C=L.exports,I=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",[e("table",[e("tbody",[e("tr",[e("td",[t._v("번호")]),e("td",[t._v(" "+t._s(t.qna.num)+" ")])]),e("tr",[e("td",[t._v("제목")]),e("td",[t._v(" "+t._s(t.qna.title)+" ")])]),e("tr",[e("td",[t._v("작성자")]),e("td",[t._v(" "+t._s(t.qna.writer)+" ")])]),e("tr",[e("td",[t._v("작성일")]),e("td",[t._v(" "+t._s(t.qna.wdate)+" ")])]),e("tr",[e("td",[t._v("질문")]),e("td",[e("div",[t._v(" "+t._s(t.qna.question))]),e("button",{on:{click:t.updateQ}},[t._v("수정")])])]),e("tr",[e("td",[t._v("답변")]),e("td",[null!=t.qna.answer?e("span",[t._v(t._s(t.qna.answer))]):e("span",[e("button",{on:{click:t.AnswerQna}},[t._v("답변달기")])])])])])])])},M=[],B={created:function(){this.getQna(this.$route.params.num)},computed:{qna:function(){return this.$store.state.qna}},methods:{getQna:function(t){this.$store.dispatch(m.GET_QNA,t)},updateQ:function(){this.$router.push("/update/"+this.num)},AnswerQna:function(){this.$router.push("/answer/"+this.$route.params.num)},clear:function(){this.qna={}}}},R=B,U=(e("2c4b"),Object(p["a"])(R,I,M,!1,null,"35ccb139",null)),V=U.exports;a["a"].use(i["a"]);var H,J,z=new i["a"]({routes:[{path:"/",component:Q},{path:"/list",component:Q},{path:"/input",component:T},{path:"/asd.jsp",component:Q},{path:"/answer/:num",component:P},{path:"/detail/:num",component:V},{path:"/update/:num",component:C}]}),F={name:"app",router:z,components:{QnaHeader:f}},K=F,W=(e("19ed"),Object(p["a"])(K,r,o,!1,null,"78f5800e",null)),X=W.exports,Y=e("2fa7"),Z=e("2f62"),tt=e("bc3a"),nt=e.n(tt),et=nt.a.create({baseURL:"http://70.12.108.207:9000",headers:{"Content-type":"application/json"}});a["a"].use(Z["a"]);var at=new Z["a"].Store({state:{qnalist:[],qna:{}},actions:(H={},Object(Y["a"])(H,m.GET_QNALIST,(function(t){et.get("/list").then((function(n){t.commit(m.GET_QNALIST,{qnalist:n.data})})).catch((function(t){return alert("getQnaList처리에 실패하였습니다. "+t)}))})),Object(Y["a"])(H,m.GET_QNA,(function(t,n){et.get("/list/id/"+n).then((function(n){t.commit(m.GET_QNA,{qna:n.data})})).catch((function(t){return alert("getQna처리에 실패하였습니다. "+t)}))})),Object(Y["a"])(H,m.ADD_Q,(function(t,n){et.post("/add/question",n.qna).then((function(){t.dispatch(m.GET_QNALIST)})).catch((function(t){return alert("삽입 처리에 실패하였습니다. "+t)}))})),Object(Y["a"])(H,m.ADD_A,(function(t,n){et.put("/add/answer",n.qna).then((function(){t.dispatch(m.GET_QNALIST)})).catch((function(t){return alert("삽입 처리에 실패하였습니다. "+t)}))})),Object(Y["a"])(H,m.REMOVE_QNA,(function(t,n){et.delete("/question/delete/"+n).then((function(){t.dispatch(m.GET_QNALIST)})).catch((function(t){return alert("삭제 처리에 실패하였습니다. "+t)}))})),Object(Y["a"])(H,m.UPDATE_QNA,(function(t,n){et.put("/question/update",n.qna).then((function(){t.dispatch(m.GET_QNALIST)})).catch((function(t){return alert("업뎃 처리에 실패하였습니다. "+t)}))})),H),mutations:(J={},Object(Y["a"])(J,m.GET_QNALIST,(function(t,n){t.qnalist=n.qnalist})),Object(Y["a"])(J,m.GET_QNA,(function(t,n){t.qna=n.qna})),J)}),rt=at;a["a"].config.productionTip=!1,new a["a"]({render:function(t){return t(X)},store:rt}).$mount("#app")},5884:function(t,n,e){},"7e13":function(t,n,e){},b18a:function(t,n,e){},bc8a:function(t,n,e){"use strict";var a=e("7e13"),r=e.n(a);r.a},d817:function(t,n,e){},f405:function(t,n,e){},f6c0:function(t,n,e){}});
//# sourceMappingURL=app.7b872797.js.map