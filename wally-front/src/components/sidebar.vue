<template>
  <div id="sidebar">
    <ul id="character-status">
      <li class="find-status">
        <img
          class="portrait status-icon"
          :class="{'found': found.wally, 'not-found': !found.wally }"
          src="@/assets/portraits/wally.png"
        >
        <p>Wally</p>
      </li>
      <li class="find-status">
        <img
          class="portrait status-icon"
          :class="{'found': found.wenda, 'not-found': !found.wenda }"
          src="@/assets/portraits/wenda.png"
        >
        <p>Wenda</p>
      </li>
      <li class="find-status">
        <img
          class="portrait status-icon"
          :class="{'found': found.woof, 'not-found': !found.woof }"
          src="@/assets/portraits/woof.png"
        >
        <p>Woof</p>
      </li>
      <li class="find-status">
        <img
          class="portrait status-icon"
          :class="{'found': found.wbeard, 'not-found': !found.wbeard }"
          src="@/assets/portraits/wbeard.png"
        >
        <p>Whitebeard</p>
      </li>
      <li class="find-status">
        <img
          class="portrait status-icon"
          :class="{'found': found.odlaw, 'not-found': !found.odlaw }"
          src="@/assets/portraits/odlaw.png"
        >
        <p>Odlaw</p>
      </li>
    </ul>
    <timer/>
    <highscores/>
  </div>
</template>

<script>
import timer from "./timer.vue";
import highscores from "./highscores.vue";

export default {
  name: "sidebar",
  data() {
    return {};
  },
  components: {
    timer,
    highscores
  },
  props: ["found"]
};
</script>

<style>
#sidebar {
  display: grid;
  grid-template-rows: 1fr auto auto;
  grid-gap: 1em;
  justify-content: center;
  position: relative;
  background: #2c3e50;
  border-left: 2px solid white;
  color: white;
  font-weight: 700;
  text-align: center;
  padding-top: 1em;
  min-height: 700px;
  z-index: 10;
}

#sidebar ul {
  list-style-type: none;
}

#character-status {
  margin-bottom: 1em;
}

#character-status li {
  margin: 1em 0;
}

#character-status p { 
  border-radius: 0.25em;
}

.portrait {
  border-radius: 50%;
  box-shadow: 0px 0px 10px #00000080;
}

.status-icon {
  border: 5px solid;
  width: 60px;
}

.found {
  border-color: #0a8b4f;
}

.not-found {
  border-color: #8b0a24;
}
</style>
