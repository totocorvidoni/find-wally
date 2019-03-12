<template>
  <div v-dragscroll id="play-area">
    <transition name="fade">
      <character-picker
        v-if="guessing"
        :style="{ left: mouseX, top: mouseY }"
        @close-picker="guessing = false"
        @results="onResults(...arguments)"
      ></character-picker>
    </transition>
    <img id="photo" @click="selectArea" src="@/assets/play-photo-troy.jpg">
  </div>
</template>

<script>
import { dragscroll } from "vue-dragscroll";
import characterPicker from "./character-picker";

export default {
  name: "playArea",
  components: { characterPicker },
  data() {
    return {
      guessing: false,
      mouseX: 0,
      mouseY: 0
    };
  },
  directives: {
    dragscroll
  },
  methods: {
    positionOnPhoto(e) {
      const photoX = Math.round(e.srcElement.getBoundingClientRect().left);
      const photoY = Math.round(e.srcElement.getBoundingClientRect().top);
      const mouseX = Math.abs(photoX - e.clientX);
      const mouseY = Math.abs(photoY - e.clientY);
      return { x: mouseX, y: mouseY };
    },
    selectArea(e) {
      const position = this.positionOnPhoto(e);
      this.guessing = true; // !this.guessing;
      this.mouseX = position.x - 25 + "px"; // 25px offset to center the box on cursor pointer.
      this.mouseY = position.y - 25 + "px";
    },
    onResults(args) {
      this.$emit('check-results', args)
    }
  }
};
</script>
<style>
#play-area {
  position: relative;
  border: 10px solid #2c3e50;
  max-height: 100vh;
  min-height: 650px;
  overflow: hidden;
}

#photo {
  display: block;
  border-right: none;
  cursor: grab;
}

#photo:active {
  cursor: grabbing;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
