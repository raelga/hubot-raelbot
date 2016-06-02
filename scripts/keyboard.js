/*
   class InlineKeyboardButton {
  constructor(text, callback_url) {
    this.text = text;
    this.callback_url = callback_url;
  }
}
*/

module.exports = function (robot) {

    robot.hear(/bot keyboard/i, function (res) {
        robot.emit('telegram:invoke', 
                   'sendMessage', 
                    { 
                      chat_id: res.message.room, 
                      text: 'Select an option.',
                      reply_markup: 
                      {
                        inline_keyboard: [[ { text: "1", callback_data: "1" } ],
                                          [ { text: "2", callback_data: "2" } ]]  
                      }
                    },
                    function (error, response) {
                      console.log(error);
                      console.log(response);
                    });
    });
    robot.on('inlineQuery', function (query) {
          var cbd = query.callback_query.data;
          switch(cbd) {
            case 1: console.log("Opcion 1");
            case 2: console.log("Opcion 2");
            default: console.log("Opcion 3");

          }
          
          },
          function (error, response) {
            console.log(error);
            console.log(response);
    });
};
