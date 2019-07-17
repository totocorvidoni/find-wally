<template>
  <div id="highscores">
    <button id="show-board" @click="onShowBoardClick">HIGHSCORES</button>
    <transition name="slide">
      <ul v-if="scores.length === 0" id="score-board" v-show="boardActive" @click="boardActive = false">
        <li>No one has summited a Highscore yet. Be the first!</li>
      </ul>
      <ul v-else id="score-board" v-show="boardActive" @click="boardActive = false">
        <li v-for="score in scores" :key="score.id">
          <h3>{{ score.name }}</h3>
          <p class="score">{{ score.total_time }}</p>
        </li>
      </ul>
    </transition>
  </div>
</template>

<script>
export default {
  name: "highscores",
  data() {
    return {
      boardActive: false,
      scores: []
    };
  },
  methods: {
    async onShowBoardClick() {
      await this.getScores();
      this.boardActive = !this.boardActive;
    },
    async getScores() {
      try {
        const response = await this.axios.get(
          `${process.env.VUE_API_URL}/game/scores`
        );
        this.scores = response.data;
      } catch (error) {
        console.error(error);
      }
    }
  },
  computed: {
    emptyScore() {
      this.scores.length === 0 ? true : false;
    }
  }
};
</script>

<style>
#show-board {
  background: white;
  border: none;
  color: #2c3e50;
  cursor: pointer;
  padding: 1em 0.5em;
  font-weight: 700;
  font-size: 1em;
}

#score-board {
  position: absolute;
  right: 100%;
  bottom: 0;
  background: #2c3e50;
  border: 2px solid white;
  border-radius: 0.25em;
  cursor: pointer;
  margin: 0 1em 1em 0;
  width: 175px;
  z-index: -10;
}

#score-board li {
  padding: 0.5em 0.5em;
  font-size: 1.1em;
}

#score-board li:nth-child(even) {
  background: #3f5973;
}

.score {
  display: inline-block;
  margin-top: 0.5em;
  background: white;
  border-radius: 0.25em;
  padding: 0.2em 0.5em;
  color: #2c3e50;
}

#score-board li:first-child .score {
  border: 5px ridge rgb(112, 240, 229);
}

.slide-enter-active,
.slide-leave-active {
  transition: all 150ms ease-out;
}

.slide-enter,
.slide-leave-to {
  transform: translateX(20%);
  opacity: 0;
}
</style>
