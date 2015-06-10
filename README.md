broadcast.js
============

事件注册，广播

统一的事件管理中心

## 示例

``` javascript
var broadcast = require("./broadcast.js");

broadcast.on("testEvent", function(data, event) {
	console.log(event); // test
	console.log(data); // [1,2,3]
});
broadcast.fire("testEvent", [1,2,3]);
```