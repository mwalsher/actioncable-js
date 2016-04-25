# actioncable-js
Standalone ActionCable Javascript from Rails 5 for usage outside of Ruby on Rails (e.g. with ES6/ES7 apps, React/Angular JS, etc.)

## Usage

Simply include `dist/action_cable.js` in your project and use per the instructions [here](https://github.com/rails/rails/tree/master/actioncable).

## Example

A simple HTML/JS example app is provided in `examples/`. Simply put `examples/clock_channel.rb` in your Rails 5 app, launch the Rails server, and open `examples/clock_channel.html` in your web brower. This app assumes that ActionCable is mounted at `http://localhost:3000`.

## Updating

You can update and recompile action_cable.js by running `./update.sh`.

## TODO

1. Fix issues with webpack inclusion

## License

actioncable-js is released under the MIT license:

http://www.opensource.org/licenses/MIT
