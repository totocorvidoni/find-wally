<template>
  <div id="app">
    <play-area @character-found="onCharacterFound(...arguments)" :found="found"></play-area>
    <sidebar :found="found"></sidebar>
  </div>
</template>

<script>
import playArea from "./components/play-area";
import sidebar from "./components/sidebar";

export default {
  name: "App",
  components: {
    playArea,
    sidebar
  },
  data() {
    return {
      found: {
        wally: false,
        wenda: false,
        woof: false,
        wbeard: false,
        odlaw: false
      }
    };
  },
  methods: {
    onCharacterFound(results) {
      this.found[results.character] = results.status;
      console.log(results.status);
    }
  }
};
</script>

<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

#app {
  display: flex;
  font-family: "Avenir", Helvetica, Arial, sans-serif;
}
</style>
