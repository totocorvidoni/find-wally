<template>
  <div id="character-picker">
    <button id="picker-closer" class="selection-icon" @click="$emit('close-picker')">X</button>
    <img
      v-if="!found.wally"
      id="wally"
      class="portrait selection-icon"
      src="@/assets/portraits/wally.png"
      @click="checkArea"
    >
    <img
      v-if="!found.wenda"
      id="wenda"
      class="portrait selection-icon"
      src="@/assets/portraits/wenda.png"
      @click="checkArea"
    >
    <img
      v-if="!found.woof"
      id="woof"
      class="portrait selection-icon"
      src="@/assets/portraits/woof.png"
      @click="checkArea"
    >
    <img
      v-if="!found.wbeard"
      id="wbeard"
      class="portrait selection-icon"
      src="@/assets/portraits/wbeard.png"
      @click="checkArea"
    >
    <img
      v-if="!found.odlaw"
      id="odlaw"
      class="portrait selection-icon"
      src="@/assets/portraits/odlaw.png"
      @click="checkArea"
    >
  </div>
</template>

<script>
export default {
  name: "characterPicker",
  names: {
    wally: 'Wally',
    wenda: 'Wenda',
    woof: 'Woof',
    wbeard: 'Whitebeard',
    odlaw: 'Odlaw'
  },
  props: {
    mouseX: Number,
    mouseY: Number,
    found: Object
  },
  methods: {
    async askToAPI(character, area) {
      const response = await this.axios.post(
        `${process.env.VUE_API_URL}/game/${character}`,
        area
      );
      return response.data;
    },
    async checkArea(e) {
      const character = e.target.id;
      const area = {
        x: [this.mouseX - 25, this.mouseX + 25],
        y: [this.mouseY - 25, this.mouseY + 25] // 50x50 square around the pixel clicked.
      };
      try {
        const response = await this.askToAPI(character, area);
        if (response) {
          alert(`You found ${this.$options.names[character]}!`);
          this.$emit("found-it", {
            character: character,
            status: response
          });
        } else {
          alert(`${character} is not here!`);
        }
      } catch (error) {
        alert(
          "Something terrible and unexpected has happend. Please try again."
        );
        console.error(error);
      }
    }
  }
};
</script>

<style>
#character-picker {
  position: absolute;
  height: 50px;
  width: 50px;
  background: rgba(186, 218, 255, 0.4);
  border: 2px solid white;
  transition: all 250ms cubic-bezier(0.2, 0.24, 0, 1.3);
}

#picker-closer {
  top: -15px;
  right: -15px;
  background: #b10f0f;
  border: 2px solid white;
  border-radius: 50%;
  color: white;
  font-size: 11pt;
  font-weight: 700;
  line-height: 0;
  height: 25px;
  width: 25px;
}

.selection-icon {
  cursor: pointer;
  position: absolute;
  width: 50px;
}

.selection-icon:hover {
  transform: scale(1.3);
  box-shadow: 0px 0px 10px rgba(186, 218, 255, 0.4);
}

#wally {
  top: -65px;
}

#wenda {
  left: -65px;
}

#woof {
  right: -65px;
}

#wbeard {
  left: -35px;
  bottom: -65px;
}

#odlaw {
  right: -35px;
  bottom: -65px;
}
</style>
