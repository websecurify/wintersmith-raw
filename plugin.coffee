'use strict'

# ---
# ---
# ---

fs = require 'fs'
path = require 'path'

# ---
# ---
# ---

module.exports = (env, callback) ->
	return callback null unless env?.config?.raw
	
	# ---
	
	class RawPlugin extends env.ContentPlugin
		constructor: (@filepath, @src) -> @metadata = JSON.parse @src if (path.extname @filepath.relative) is '.json'
		
		# ---
		
		getFilename: -> @filepath.relative
		
		# ---
		
		getView: -> (env, locals, contents, templates, callback) -> callback null, new Buffer @src
		
	# ---
	
	RawPlugin.fromFile = (filepath, callback) -> fs.readFile filepath.full, (err, buffer) ->
		return callback err if err
		return callback null, new RawPlugin filepath, buffer.toString()
		
	# ---
	
	env.registerContentPlugin 'raw', glob, RawPlugin for glob in env.config.raw
	
	# ---
	
	return callback null
	
# ---
