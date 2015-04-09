AJSON  = require "../lib/"
should = require("chai").should()
expect = require("chai").expect

describe "AJSON", ->
  describe "stringify", ->
    it "should stringify an object", (done) ->
      data =
        a: "b"
        c: "d"

      AJSON.stringify data, (err, stringified) ->
        expect(err).to.equal null

        expected = "{\"a\":\"b\",\"c\":\"d\"}"
        expect(stringified).to.equal expected

        done()

    it "should stringify a string", (done) ->
      data = "foo"

      AJSON.stringify data, (err, stringified) ->
        expect(err).to.equal null

        expected = "\"foo\""
        expect(stringified).to.equal expected

        done()

    it "should stringify a number", (done) ->
      data = 5

      AJSON.stringify data, (err, stringified) ->
        expect(err).to.equal null

        expected = "5"
        expect(stringified).to.equal expected

        done()


  describe "parse", ->
    it "should parse a valid JSON object", (done) ->
      data = "{\"a\":\"b\",\"c\":\"d\"}"

      AJSON.parse data, (err, stringified) ->
        expect(err).to.equal null

        expected =
          a: "b"
          c: "d"
        expect(stringified).to.eql expected

        done()

    it "should throw an error for invalid JSON strings", (done) ->
      data = "{\"a\":\"b\",\"c\":}"

      AJSON.parse data, (err, stringified) ->
        expectedErr = new Error "Invalid JSON string provided"
        expect(stringified).to.equal null
        expect(err).to.eql expectedErr

        done()
