# app = require('express')
# io = require('socket.io')
# 
# app.listen '81'
# 
# app.get '/', (req, res) ->
# 	res.sendfile __dirname + '/index.html'
# 	
# io.sockets.on 'connection', (socket) ->
# 	socket.emit 'mews', { hello:'world' }
# 	socket.on 'my other event', (data) ->
# 		console.log data


app = require('express').createServer()
io  = require('socket.io').listen(app)
fs  = require('fs')

app.listen 81

app.get '/', (req, res) ->
	res.sendfile __dirname+'/index.html'
	console.log 'found'
	
io.sockets.on 'connection', (socket) ->
	console.log 'someone connected'
	
fs.watchFile 'README.md', (current, previous) ->
	console.log 'file was changed'
	io.sockets.emit 'change', "HIHIHI"

