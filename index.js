// global object is required for webpack to compile action_cable.js
require("imports-loader?this=>global!./dist/action_cable.js")
module.exports = {
  ActionCable: global.ActionCable
}
