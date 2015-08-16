# DescriptionS
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
#
#   raelga (raelga at gmail dot com)
#

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

  robot.respond /// imbecil///i, (res) ->
    res.send "Se escribe imbécil, con acento, imbécil."

  robot.hear /dormir/i, (res) ->
    res.send "No soy mucho de dormir."
  
  resDisN = require './rael.data/disrespectN.json'
  resDisT = require './rael.data/disrespectT.json'

  robot.respond /// (tonto|imbécil|inútil) ///i, (res) ->
    dice = Math.floor(Math.random() * 6) + 1
    if dice == 1
      res.send "Un momento..."
      setTimeout () ->
        res.send res.random resDisT
      , 30 * 1000
    else
      res.send res.random resDisN

  resHello = ['hola', 'saludos', 'buenas', 'hello']

  robot.hear /// (hola) ///i, (res) ->
    res.send "#{res.random resHello} #{res.message.user.first_name}!"

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

  resHaiteos = require './rael.data/haiteos.json'

  robot.respond /haitea/i, (res) ->
    res.send res.random resHaiteos
