AJSON
============================

Gives you asynchronous versions of JSON.parse and JSON.stringify to prevent
blocking the event loop too much when you parse and stringify big amounts of data.


# Installation

`npm install --save ajson`

or

* Clone or fork this repo
* Run `npm install .`

# Execution

```
var AJSON = require('ajson');

AJSON.parse("some_json_string", function(err, parsedData) {
  console.log(parsedData);
});

AJSON.stringify(someJsonObject, function(err, stringified) {
  console.log(stringified);
});
```

# TODO

- [ ] include a giant.json file
