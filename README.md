# actioncable-js
Standalone ActionCable Javascript from Rails 5 for usage outside of Ruby on Rails (e.g. with ES6/ES7 apps, React/Angular JS, etc.)

## Usage

actioncable-js can be installed using npm:

`npm install actioncable-js`

And included in your ES6+ project with:

`import { ActionCable } from 'actioncable-js';`

Alternatively, simply include `dist/action_cable.js` in your project.

ActionCable documentation is available [here](https://github.com/rails/rails/tree/master/actioncable).

## Example

A simple HTML/JS example app is provided in `examples/`. Simply put `examples/clock_channel.rb` in your Rails 5 app, launch the Rails server, and open `examples/clock_channel.html` in your web browser. This app assumes that ActionCable is mounted at `http://localhost:3000`.

## Updating

You can update and recompile action_cable.js by running `./update.sh`.


## License

actioncable-js is released under the MIT license:

http://www.opensource.org/licenses/MIT
