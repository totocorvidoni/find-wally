<template>
  <div v-dragscroll id="play-area">
    <transition name="fade">
      <character-picker
        v-if="guessing"
        :mouseX="mouseX"
        :mouseY="mouseY"
        :found="found"
        :style="{ left: pixelPosition.x, top: pixelPosition.y }"
        @close-picker="guessing = false"
        @found-it="onFoundIt(...arguments)"
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
  directives: {
    dragscroll
  },
  components: { characterPicker },
  data() {
    return {
      guessing: false,
      mouseX: 0,
      mouseY: 0
    };
  },
  props: {
    found: Object
  },
  methods: {
    positionOnPhoto(e) {
      if(this.musemove) { return }
      const photoX = Math.round(e.srcElement.getBoundingClientRect().left);
      const photoY = Math.round(e.srcElement.getBoundingClientRect().top);
      const mouseX = Math.abs(photoX - e.clientX);
      const mouseY = Math.abs(photoY - e.clientY);
      // console.log(mouseX, mouseY)
      return { x: mouseX, y: mouseY };
    },
    selectArea(e) {
      const position = this.positionOnPhoto(e);
      this.guessing = true; //
      this.mouseX = position.x;
      this.mouseY = position.y;
    },
    onFoundIt(args) {
      this.$emit("character-found", args);
    }
  },
  computed: {
    pixelPosition() {
      // -25px offset so the box gets centered around the mouse pointer
      return { x: `${this.mouseX - 25}px`, y: `${this.mouseY - 25}px` };
    }
  }
};
</script>
<style>
#play-area {
  position: relative;
  border: 10px solid #2c3e50;
  border-right: none;
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
