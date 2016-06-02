var fs = require('fs');

module.exports = function (robot) {

    var base='/mnt/hdd/in/motion'
    var log= base + '/kkat.txt'
    var last= base + '/last.jpg'
    var last_gif= base + '/last.gif'
    var last_mp4= base + '/last.mp4'
    var last_snap= base + '/last-snap.jpg'

    robot.hear(/bot kkat/i, function (res) {

        robot.emit('telegram:invoke', 'sendPhoto', { chat_id: res.message.room, photo: fs.createReadStream(last_snap) }, function (error, response) {
            console.log(error);
            console.log(response);
        });
    });

    robot.hear(/bot gif kkat/i, function (res) {

        robot.emit('telegram:invoke', 'sendDocument', { chat_id: res.message.room, document: fs.createReadStream(last_gif) }, function (error, response) {
            console.log(error);
            console.log(response);
        });
    });


    robot.hear(/bot last kkat/i, function (res) {

        robot.emit('telegram:invoke', 'sendPhoto', { chat_id: res.message.room, photo: fs.createReadStream(last) }, function (error, response) {
            console.log(error);
            console.log(response);
        });
    });

    robot.hear(/bot log kkat/i, function (res) {

        robot.emit('telegram:invoke', 'sendDocument', { chat_id: res.message.room, document: fs.createReadStream(log) }, function (error, response) {
            console.log(error);
            console.log(response);
        });
    });

    robot.hear(/bot video kkat/i, function (res) {

        robot.emit('telegram:invoke', 'sendVideo', { chat_id: res.message.room, video: fs.createReadStream(last_mp4) }, function (error, response) {
            console.log(error);
            console.log(response);
        });
    });

};
