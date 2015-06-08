var socket = io.connect('http://localhost');

socket.emit('joinView', { view: 'view1' });

socket.on('streamVideo', function(data) {
    console.log('view got video stream')
    console.log(data);
    var url = data.video1;
    var newUrl = url.replace(/%3A/g, ':');
    var newestUrl = newUrl.replace('blob:', '');
    console.log(url);
    console.log(newUrl);
    var video = document.getElementById('video-el');
    video.src = newUrl;
    video.play();
});
