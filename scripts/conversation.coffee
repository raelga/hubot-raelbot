# Description:
#   Magic 8 ball simulator
#
# Dependencies:
#   none
#
# Configuration:
#   none
#
# Commands:
#   hubot bola-8 <frase> - Obtiene una respuesta de la bola 8 en castellano.
#
# Notes:
#   None
#
# Author:
#   raelga
#

magic8Esp = [
  'En mi opinión, sí',
  'Es cierto',
  'Es decididamente así',
  'Probablemente',
  'Buen pronóstico',
  'Todo apunta a que sí',
  'Sin duda',
  'Sí',
  'Sí - definitivamente',
  'Debes confiar en ello',
  'Respuesta vaga, vuelve a intentarlo',
  'Pregunta en otro momento',
  'Será mejor que no te lo diga ahora',
  'No puedo predecirlo ahora',
  'Concéntrate y vuelve a preguntar',
  'No cuentes con ello',
  'Mi respuesta es no',
  'Mis fuentes me dicen que no',
  'Las perspectivas no son buenas',
  'Muy dudoso'
]

magic8Eng = [
  'It is certain',
  'It is decidedly so',
  'Without a doubt',
  'Yes definitely',
  'You may rely on it',
  'As I see it, yes',
  'Most likely',
  'Outlook good',
  'Yes',
  'Signs point to yes',
  'Reply hazy try again',
  'Ask again later',
  'Better not tell you now',
  'Cannot predict now',
  'Concentrate and ask again',
  'Don\'t count on it',
  'My reply is no',
  'My sources say no',
  'Outlook not so good',
  'Very doubtful'
]

module.exports = (robot) ->
  
  d = 0

  robot.hear /(rael)?bot estás bien\?/i, (res) ->
    d = 0
    res.send "Estoy bien! Estoy bien!!"

  robot.hear /(rael)?bot \?/i, (res) ->
    d = 0
    res.send "Estoy bien! Estoy bien!!"
  
  robot.hear /(.*)(rael)?bot(.*)\?+/i, (msg) ->
      msg.send msg.random magic8Esp if d
