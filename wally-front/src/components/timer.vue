<template>
  <div id="time">
    <h2>Time</h2>
    <h1>{{ showTimer }}</h1>
  </div>
</template>

<script>
export default {
  name: "timer",
  data() {
    return {
      sec: 0,
      min: 0,
      hour: 0
    };
  },
  mounted: function runTimer() {
    setInterval(() => {
      this.addSec();
    }, 1000);
  },
  methods: {
    addSec() {
      if (this.sec === 59) {
        this.sec = 0;
        this.addMin();
      } else {
        this.sec += 1;
      }
    },
    addMin() {
      if (this.min === 59) {
        this.min = 0;
        this.addHour();
      } else {
        this.min += 1;
      }
    },
    addHour() {
      this.hour = 1;
    },
    padTime(time) {
      return time < 10 ? `0${time}` : time;
    }
  },
  computed: {
    showTimer: function() {
      return `
      ${this.padTime(this.hour)}:${this.padTime(this.min)}:${this.padTime(this.sec)}`;
    }
  }
};
</script>

<style>
#time {
  margin-bottom: 1em;
}
</style>
