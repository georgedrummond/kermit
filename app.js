var app = require('express').createServer()
  , io = require('socket.io').listen(app);

app.listen(81);

app.get('/', function (req, res) {
  res.sendfile(__dirname + '/index.html');
});

io.sockets.on('connection', function (socket) {
  socket.emit('news', { hello: 'world' });
  socket.on('my other event', function (data) {
    document.write(data);
  });
});