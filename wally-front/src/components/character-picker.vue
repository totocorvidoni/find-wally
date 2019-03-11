<template>
  <div id="character-picker">
    <button id="close-picker" class="selection-icon" @click="$emit('closePicker')">X</button>
    <img id="wally" class="portrait selection-icon" src="@/assets/portraits/wally.png">
    <img id="wenda" class="portrait selection-icon" src="@/assets/portraits/wenda.png">
    <img id="woof" class="portrait selection-icon" src="@/assets/portraits/woof.png">
    <img id="wbeard" class="portrait selection-icon" src="@/assets/portraits/wbeard.png">
    <img id="odlaw" class="portrait selection-icon" src="@/assets/portraits/odlaw.png">
  </div>
</template>

<script>
export default {
  name: 'characterPicker',
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

#close-picker {
  top: -15px;
  right: -15px;
  background: #b10f0f ;
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
