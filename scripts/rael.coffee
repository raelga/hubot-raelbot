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
#
# Author:
#
#   raelga (raelga at gmail dot com)
#

module.exports = (robot) ->

  robot.hear /\brael(ga)?(\b)/i, (res) ->
      res.send "@raelga te nombran."

  robot.hear /\b[Ww]+har(\b)/i, (res) ->
      res.send "@Reifeen te nombran."
  
  lulz = ['lol', 'rofl', 'lmao', 'xD']

  robot.respond /lulz/i, (res) ->
     res.send res.random lulz

  robot.respond /// imbecil///i, (res) ->
    res.send "Se escribe imbécil, con acento, imbécil."

  robot.respond /// cabron///i, (res) ->
    res.send "Se escribe cabrón, con acento, cabrón."

  robot.hear /(rael)?bot dormir/i, (res) ->
    res.send "Yo no duermo, soy un bot."

  resDisN = require './rael.data/disrespectN.json'
  resDisT = require './rael.data/disrespectT.json'

  resInsultos = ['tonto', 'imbécil', 'imbecil', 'inútil', 'inutil',
                'capullo' , 'gili', 'botarate', 'joputa', 'cabrón',
                'caca']

  regInsultos = new RegExp resInsultos.join('|'), 'gi'

  robot.respond regInsultos, (res) ->
    dice = Math.floor(Math.random() * 6) + 1
    if dice == 1
      res.send "Un momento..."
      setTimeout () ->
        res.send res.random resDisT
      , 30 * 1000
    else
      res.send res.random resDisN

  resGreetings = ['ola k ase', 'Hola', 'Saludos']
  regGreetings = new RegExp resGreetings.join('|'), 'gi'

  robot.hear regGreetings, (res) ->
    username = "#{res.message.user.name}"
    username = "packet" if (isFinite(username))
    res.send "#{res.random resGreetings} #{username}"

  resMorning = ['Buenos días', 'Bon dia', 'Good Morning',
                'Egun on', 'Morning', 'Buon giorno',
                'Bonjour', 'Bos días', 'Buenos días arsa',
                'Hola miarma', 'Goede morgen', 'Bom dia',
                'Días buenos a ti también']
  regMorning = new RegExp resMorning.join('|'), 'gi'

  robot.hear regMorning, (res) ->
    username = "#{res.message.user.name}"
    username = "packet" if (isFinite(username))
    res.send "#{res.random resMorning} #{username}"

  resNight = ['Buenas noches', 'Bona nit', 'Good night',
              'Nanit', 'Gute natch', 'Buonna note',
              'Bonne nuit','Goedenacht', 'Boa noite']
  regNight = new RegExp resNight.join('|'), 'gi'

  robot.hear regNight, (res) ->
    username = "#{res.message.user.name}"
    username = "packet" if (isFinite(username))
    res.send "#{res.random resNight} #{username}"

  resAIthoughts = require './rael.data/AIthoughts.json'

  robot.hear /think/i, (res) ->
    res.send res.random resAIthoughts

  robot.hear ///(rael)?bot\s(mata)///i, (res) ->
    res.send '1. Un robot no hará daño a un ser humano o, por inacción, permitir que un ser humano sufra daño.'
    res.send '2. Un robot debe obedecer las órdenes dadas por los seres humanos, excepto si estas órdenes entrasen en conflicto con la 1ª Ley.'
    res.send '3. Un robot debe proteger su propia existencia en la medida en que esta protección no entre en conflicto con la 1ª o la 2ª Ley.'
    res.send 'https://es.wikipedia.org/wiki/Tres_leyes_de_la_rob%C3%B3tica'
