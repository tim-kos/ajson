class AJSON
  @stringify: (data, cb) ->
    result = JSON.stringify data

    cb null, result


  @parse: (s, cb) ->
    try
      result = JSON.parse s
    catch e
      err = new Error "Invalid JSON string provided"
      return cb err, null

    cb null, result

module.exports = AJSON
