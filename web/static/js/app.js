// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import $ from "jquery"
import jQuery from "jquery"
import "Flot"
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import flot from "./flot"
import socket from "./socket"


// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("events", {})
channel.join()
  .receive("ok", resp => {
    console.log("Joined Channel!")
  })
  .receive("error", resp => { console.log("Unable to join", resp) })


channel.on("new_value", payload => {
  flot.addDataPoint(payload.value, payload.label)
})
