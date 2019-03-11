<template>
  <div id="sidebar">
    <ul>
      <li class="find-status">
        <img class="portrait status-icon" src="@/assets/portraits/wally.png" alt>
        <p>Wally</p>
      </li>
      <li class="find-status">
        <img class="portrait status-icon" src="@/assets/portraits/wenda.png" alt>
        <p>Wenda</p>
      </li>
      <li class="find-status">
        <img class="portrait status-icon" src="@/assets/portraits/woof.png" alt>
        <p>Woof</p>
      </li>
      <li class="find-status">
        <img class="portrait status-icon" src="@/assets/portraits/wbeard.png" alt>
        <p>Whitebeard</p>
      </li>
      <li class="find-status">
        <img class="portrait status-icon" src="@/assets/portraits/odlaw.png" alt>
        <p>Odlaw</p>
      </li>
    </ul>
    <div id="time">
      <h2>Time</h2>
      <h1>00:00</h1>
    </div>
  </div>
</template>

<script>
export default {};
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
  border: 5px solid #8b0a24;
  width: 60px;
}

.status-icon:hover {
  border: 5px solid #0a8b4f;
}

#time {
  margin-bottom: 1em;
}
</style>
