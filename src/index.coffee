asyncJSON = require "async-json"

class AJSON
  @stringify: (data, cb) ->
    asyncJSON.stringify data, (err, result) ->
      cb err, result

  @parse: (s, cb) ->
    try
      result = JSON.parse s
    catch e
      err = new Error "Invalid JSON string provided"
      return cb err, null

    cb null, result

module.exports = AJSON
