<template>
   <div id="app">
    <QnaHeader></QnaHeader><br>

    <div><router-view></router-view></div>
    
  </div> 
</template>

<script>
import Vue from 'vue';
import VueRouter from 'vue-router'
import QnaHeader from './components/QnaHeader.vue'
import QnaList from './components/QnaList.vue'
import Q_Input from './components/Q_Input.vue'
import A_Input from './components/A_Input.vue'
import updateQ from './components/updateQ.vue'
import QnaDetail from './components/QnaDetail.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  
  routes: [
    {
      path: '/', 
      component: QnaList  
    },
    {
      path: '/list', 
      component: QnaList
    },
    {
      path: '/input', 
      component: Q_Input
    },
    {
      path: '/asd.jsp', 
      component: QnaList
    },
    {
      path: '/answer/:num', 
      component: A_Input
    },
    {
      path: '/detail/:num', 
      component: QnaDetail
    },
    {
      path: '/update/:num', 
      component: updateQ
    }
  ]
})
export default {
  name: 'app',
  router,
  components: {
    QnaHeader
  }
}
</script>

<style scoped>
#app {
font-family: 'Avenir', Helvetica, Arial, sans-serif;
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
text-align: center;
color: #2c3e50;
margin-top: 60px;
}
body {
text-align: center;
background-color: #F6F6F8;
}
input {
border-style: groove;
width: 200px;
}
button {
border-style: groove;
}
.shadow {
box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.03)
}
</style>
