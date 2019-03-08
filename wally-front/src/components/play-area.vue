<template>
  <div v-dragscroll="true" class="container">
    <img id="play-area" src="@/assets/play-photo-troy.jpg">
  </div>
</template>

<script>
import { dragscroll } from "vue-dragscroll";

export default {
  name: "playArea",
  directives: {
    dragscroll
  }
};
</script>
<style>
.container {
  border: 10px solid #2c3e50;
  max-height: 100vh;
  overflow: hidden;
  min-height: 650px;
}

#play-area {
  display: block;
  border-right: none;
  cursor: grab;
}

#play-area:active {
  cursor: grabbing;
}
</style>
