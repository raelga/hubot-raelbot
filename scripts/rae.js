// Description:
//   Defines words in spanish (RAE)
//
// Commands:
//   hubot define <palabra> - Devuelve la primera definición.
//
// Author:
//   Guillermo Moreno
//   raelga - fixed regex (?->+), added -todas arg.

var Rae = require('rae');


module.exports = function(robot) {

  robot.respond(/(rae|define)(\s-all|\s-todas)?(\s\S+)+/i, function(res) {
    console.log(res.match);
    if(!res.match[3]) {
      res.send('¿Qué quieres que defina?');
      return false;
    }
    var word = res.match[3].trim();
    var meanings = Rae.search(word);
    meanings.then(function(lemas) {
      if(res.match[2]) {
          msg = lemas[0].definitions.join("\n");
        res.send('Todos los significados para '+word+":\n"+msg);
      }
      else {
        res.send(word+': '+lemas[0].definitions[0]);
      }
    }).fail(function(err) {
      res.send('Error al buscar definición.');
    });
  });

};
