Kermit = do ->
	
	app = require('express').createServer()
	io  = require('socket.io').listen(app)
	fs  = require('fs')

	app.listen 81

	app.get '/', (req, res) ->
		res.sendfile __dirname+'/index.html'
		console.log 'found'
	
	io.sockets.on 'connection', (socket) ->
		console.log 'someone connected'

	fs.readdir __dirname, (err, files) ->
		for file in files
		  do (file) ->
				watch file

	watch = (file) ->
		fs.watchFile file, {interval:100}, (current, previous) ->
	  	console.log '  --> '+file+' was changed'
	  	io.sockets.emit 'change', file+' - @ '+current.mtime