# ```
# broadcast.js
# 
# ! CopyRight: binnng http://github.com/binnng/broadcast.js
# Licensed under: MIT
# ```

# ```
# var broadcast = require("./broadcast.js");
# broadcast.on("test", function(data, event) {
#   console.log(event); // test
#   console.log(data); // [1,2,3]
# });
# broadcast.fire("test", [1,2,3]);
# ```

WIN = window

broadcast = 
  on: (name, fn) ->
    eventData = broadcast.data

    if eventData.hasOwnProperty name
      eventData[name].push fn
    else
      eventData[name] = [fn]

    @

  fire: (name, data, thisArg) ->
    thisArg = thisArg or WIN
    fnList = broadcast.data[name]

    unless fnList.length
      return throw new Error "Cannot find broadcast event #{name}"

    fn.apply thisArg, [data, name] for fn in fnList

    @

  data: {}

if typeof exports isnt "undefined" and module.exports
  module.exports = broadcast
else
  WIN.broadcast = broadcast
