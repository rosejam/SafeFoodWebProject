<template>

   
    <div>
      <router-link to="/input" style="text-decoration:none">+Question</router-link>&nbsp;/
      
      <router-link to="/list" style="text-decoration:none">QnA List</router-link>
    </div>

</template>

<script>
export default {
  created(){
    this
      .$router
      .push("/list");
  }
};
</script>

<style scoped>
div {
 float : left;
 margin-left : 0.8rem;
}
h1 {
  color: #2f3b52;
  font-weight: 900;
  margin: 2.5rem 0 1.5rem;
}
</style>