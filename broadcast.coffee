# ```
# broadcast.js
# 
# ! CopyRight: binnng http://github.com/binnng/debug.js
# Licensed under: MIT
# ```

# ```
# var broadcast = require("broadcast");
#	broadcast.on("test", function(event, data) {
#		console.log(event);
#		console.log(data); 
#	});
#	broadcast.fire("test", [1,2,3]);
# ```

define "broadcast", (require, exports, module) ->

	WIN = window

	broadcast = 
		on: (name, fn) ->
			eventData = broadcast.data

			if eventData.hasOwnProperty(name)
				eventData[name].push fn
			else
				eventData[name] = [fn]

		fire: (name, data, thisArg) ->
			thisArg = thisArg or WIN
			fnList = broadcast.data[name] or []

			fn.apply thisArg, [name, data] for fn in fnList

		data: {}

	module.exports = broadcast
