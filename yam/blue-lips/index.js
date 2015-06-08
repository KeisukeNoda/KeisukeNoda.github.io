var express = require('express');
var app = express();

app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));

//story 1
app.get('/', function(req, res) {
    res.render('welcome', {
        title: 'welcome - story 1',
        instructionsLink: '/instructions/1'
    });
});
app.get('/welcome/1', function(req, res) {
    res.render('welcome', {
        title: 'welcome - story 1',
        instructionsLink: '/instructions/1'
    });
});
app.get('/instructions/1', function(req, res) {
    res.render('instructions', {
        title: 'instructions - story 1',
        storyLink: '/story/1',
        backLink: '/welcome/1'
    });
});
app.get('/story/1', function(req, res) {
    res.render('story', {
        title: 'story 1',
        storyData: 'story-1',
        backLink: '/instructions/1'
    });
});
// app.get('/view/story/1', function(req, res) {
//     res.render('view', {
//         title: 'view story 1',
//         storyData: 'story-1',
//         backLink: '/instructions/1'
//     });
// });


//story 2
app.get('/welcome/2', function(req, res) {
    res.render('welcome', {
        title: 'welcome - story 2',
        instructionsLink: '/instructions/2'
    });
});
app.get('/instructions/2', function(req, res) {
    res.render('instructions', {
        title: 'instructions - story 2',
        storyLink: '/story/2',
        backLink: '/welcome/2'
    });
});
app.get('/story/2', function(req, res) {
    res.render('story', {
        title: 'story 2',
        storyData: 'story-2',
        backLink: '/instructions/2'
    });
});

//story 3
app.get('/welcome/3', function(req, res) {
    res.render('welcome', {
        title: 'welcome - story 3',
        instructionsLink: '/instructions/3'
    });
});

app.get('/instructions/3', function(req, res) {
    res.render('instructions', {
        title: 'instructions - story 3',
        storyLink: '/story/3',
        backLink: '/welcome/3'
    });
});

app.get('/story/3', function(req, res) {
    res.render('story', {
        title: 'story 3',
        storyData: 'story-3',
        backLink: '/instructions/3'
    });
});


//etc

app.get('/emotion-detector', function(req, res) {
    res.render('emotion-detector', {
        title: 'blue lips'
    });
});


app.get('/expression-maker', function(req, res) {
    res.render('expression-maker', {
        title: 'expression maker'
    });
});

var server = app.listen(process.env.PORT || 8000, function() {
    var host = server.address().address;
    var port = server.address().port;

    console.log('Listening at http://%s:%s', host, port);
});

// var io = require('socket.io')(server);
// var path = require('path');

// io.on('connection', function(socket) {
//     socket.on('joinView', function(data) {
//         var view = data.view;
//         socket.join(view);
//         console.log('socket just joined room ', view);
//     });

//     socket.on('videoStarted', function(data) {
//         if (data.hasOwnProperty('video1')) {
//             console.log('should be broadcasting');
//             socket.broadcast.to('view1').emit('streamVideo', data);
//         }
//     });

//     socket.on('disconnect', function() {
//         io.sockets.emit('user disconnected');
//     });
// });
