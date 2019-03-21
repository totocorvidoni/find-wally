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
      userToken: "",
      found: {
        wally: false,
        wenda: false,
        woof: false,
        wbeard: false,
        odlaw: false
      }
    };
  },
  mounted: async function getUserToken() {
    try {
      const response = await this.axios.get(`${process.env.VUE_API_URL}/game/start`);
      // console.log(response.data);
      this.userToken = response.data;
      // console.log(this.userToken)
    } catch (error) {
      alert("Something went really wrong, we are sorry.");
      console.error(error);
    }
  },
  methods: {
    onCharacterFound(results) {
      this.found[results.character] = results.status;
      if (Object.values(this.found).every(status => status)) {
        this.finishGame();
      }
    },
    async sendScore() {
      return await this.axios.post(`${process.env.VUE_API_URL}/game/score`, {
        token: this.userToken
      });
    },
    async sendName(name) {
      return await this.axios.post(`${process.env.VUE_API_URL}/game/name`, {
        token: this.userToken,
        name: name
      });
    },
    async finishGame() {
      try {
        const response = await this.sendScore();
        const name = prompt(
          `Congratulations, you solved the game! Your time is: ${
            response.data
          }. Would you like to save your score?`
        );
        this.sendName(name);        
      } catch (error) {
        console.error(error);
        
      }
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

[v-cloak] {
  display: none
}

</style>
