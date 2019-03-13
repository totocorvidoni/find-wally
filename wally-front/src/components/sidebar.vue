<template>
  <div id="sidebar">
    <ul>
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
    <timer />
  </div>
</template>

<script>
import timer from './timer.vue'

export default {
  name: "sidebar",
  data() {
    return {};
  },
  components: {
    timer
  },
  props: ["found"]
};
</script>

<style>
#sidebar {
  display: flex;
  flex-flow: column;
  justify-content: space-between;
  align-content: center;
  width: 120px;
  background: #2c3e50;
  font-weight: 700;
  color: white;
  text-align: center;
  min-height: 650px;
}

#sidebar ul {
  list-style-type: none;
  padding: 0 0.5em;
  margin-bottom: 1em;
}

#sidebar li {
  margin: 1em 0;
}

#sidebar p {
  display: inline-block;
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

.status-icon:hover {
  /* border: 5px solid #0a8b4f; */
}
</style>
