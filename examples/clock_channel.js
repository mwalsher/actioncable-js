ActionCable.startDebugging()
window.App = {}
window.App.cable = ActionCable.createConsumer("ws://localhost:3000/cable")
window.App.clockChannel = window.App.cable.subscriptions.create({channel: "ClockChannel", uuid: guid()}, {
  // ActionCable callbacks
  connected: function() {
    writeLog("connected", this.identifier)
  },
  disconnected: function() {
    writeLog("disconnected", this.identifier)
  },
  rejected: function() {
    writeLog("rejected")
  },
  received: function(data) {
    this.tick(data)
  },
  // Custom methods
  start: function() {
    writeLog("starting clock")
    this.perform("start")
  },
  stop: function() {
    writeLog("stopping clock")
    this.perform("stop")
  },
  tick: function(data) {
    writeLog("tick received", data)
    this.tock("ack")
  },
  tock: function(message) {
    writeLog("tock sent", message)
    return this.perform("tock", { message: message })
  }
});

function writeLog(message, data) {
  node = document.createElement("p")
  node.innerHTML = "<p>" +
    message + (data !== undefined ? ": " + deserialize(data) : "")
    "</p>"
  document.getElementById("log").appendChild(node)
}

function deserialize(data) {
  return JSON.stringify(data)
}

function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}
