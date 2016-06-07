module.exports = function (robot) {

  robot.hear(/bot keyboard/i, function (res) {
    robot.emit(
      'telegram:invoke',
      'sendMessage',
      {
        chat_id: res.message.room,
        text: 'kkat | litter box assistant.',
        reply_markup:
          {
            inline_keyboard:
              [[ { text: "Current", callback_data: "1" } ],
              [ { text: "Last", callback_data: "2" } ],
              [ { text: "Log", callback_data: "3" } ]]
          }
      },
      function (error, response) {
        console.log(error);
        console.log(response);
      }
    );
  });

  robot.on('inlineQuery', function (query) {

    var cbq;
    console.log(query);

    try {
      cbq = query.callback_query;
    } catch (e) {
      console.log(e.name + ': ' + e.message);
      return false;
    }

    robot.emit(
      'telegram:invoke',
      'answerCallbackQuery',
      {
        callback_query_id: cbq.id,
        text: "Read :" + cbq.data
      },
      function(error, response) {
        console.log(error);
        console.log(response);
      }
    );

    cbq.message("Data read: " +cbq.data);

    switch(cbq.data) {
      case 1: console.log("Option 1");
      case 2: console.log("Option 2");
      case 3: console.log("Option 3");
      default: console.log("Option d");
    }
  },
    function (error, response) {
      console.log(error);
      console.log(response);
    }
  );
};
