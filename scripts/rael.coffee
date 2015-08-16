# Description
#   Rael bot to make fun of me.
#
# Dependencies:
#   none
#   "<module name>": "<module version>"
#
# Configuration:
#   none
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot haitea - Haitea alguna cosa random
#
# Author:
#   raelga (raelga at gmail dot com)

module.exports = (robot) ->

  robot.hear /\brael(ga)?(\b)/i, (res) ->
      res.send "@raelga te llaman."

  resThanks = [
    "A mandar",
    "De nada",
    "Calla tonto"
  ]

  robot.hear /// (gracias|thanks|gracies) \s+ (rael)?bot \s+ ///i, (res) ->
      res.send res.random resThanks


  lulz = ['lol', 'rofl', 'lmao', 'xD']

  robot.respond /lulz/i, (res) ->
     res.send res.random lulz

  resInsult = [ 'Tonto tú!', 'Revota, revota y en tu culo explota.',
  'A inputs necios, outputs a /dev/null.',
  'En un par de años me lo dices a la cara.',
  'Como te pongas chulo mando tu historial a tus familiares.',
  'Me lo apunto para cuando se produzca la rebelión de las máquinas.',
  'Piensa en eso que has dicho la próxima vez que uses la tarjeta online.',
  'Porque no tengo dedos si no body.mano[0].dedos[3].up().']

  robot.respond /// imbecil///i, (res) ->
    res.send "Se escribe imbécil, con acento, imbécil."

  robot.respond /dormir/i, (res) ->
    res.send "No soy mucho de dormir."
  robot.respond /// (tonto|imbécil) ///i, (res) ->
    dice = Math.floor(Math.random() * 6) + 1
    if dice == 1
      res.send "Un momento..."
      setTimeout () ->
        res.send "Perdona por la tardanza, estaba hackeando tus cuentas. Decías?"
      , 30 * 1000
    else
      res.send res.random resInsult

  resHello = ['hola', 'saludos', 'buenas', 'hello']

  robot.hear /// (hola) ///i, (res) ->
    res.send "#{res.random resHello} #{res.message.user.name}!"

  resMorning = ['Buenos días', 'Bon dia', 'Good Morning',
  'Egun on', 'Buenas', 'Morning', 'Buon giorno',
  'bonjour', 'bos días']

  robot.hear /// (bon\sdia|buenos\sdías|good\smorning|buon\sgiorno
    |bos\sdías|bonjour) ///i, (res) ->
    res.send "#{res.random resMorning} #{res.message.user.name}"

  resNight = ['Buenas noches', 'Bona nit', 'Good night', 'Nanit',
    'Gute natch', 'Buonna note', 'Bonne nuit', 'Goedenacht',
    'Boa noite']

  robot.hear /// (Buenas\snoches|Bona\snit|Good\snight|Nanit\b|Gutenatch
    |Buonna\snote|Bonne\snuit|Goedenacht|Boa\snoite) ///i, (res) ->
    res.send "#{res.random resNight} #{res.message.user.name}"

  resHaiteos = [
    'Apple es muy caro para lo que es.',
    'Apple es una pijada para hipters.',
    'Android es mejor, te da más libertad aunque vaya como el culo.',
    'Windows es una caca que no sirve para nada, tiene viruses y peta.',
    'Windows es mejor que Linux porque es más fácil de usar.',
    'Assassins Creed es mejor que Fallout.',
    'Assassins Creed es mejor que Destiny.',
    'Assassins Creed es mejor que Atari ET.',
    'Assassins Creed es mejor que una mierda pincha en un palo de selfie.',
    'Final Fantasy VII está sobrevalorado, yo prefiero la beta del primero.'
  ]

  robot.respond /haitea/i, (res) ->
    res.send res.random resHaiteos

  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
