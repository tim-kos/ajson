asyncJSON = require "async-json"
resumer   = require "resumer"
es        = require "event-stream"

class AJSON
  @stringify: (data, cb) ->
    asyncJSON.stringify data, (err, result) ->
      cb err, result

  @parse: (s, cb) ->
    stream = resumer()
    stream.queue s

    stream.pipe es.parse({error: true})

    .on "error", (theErr) ->
      err = new Error "Invalid JSON string provided"
      cb err, null

    .pipe(es.map((data, callback) ->
      callback null, data
      cb null, data
    ))

module.exports = AJSON
