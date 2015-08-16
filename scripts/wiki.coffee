# Description:
#   Search and Display Relevant Wikipedia Link
#
# Dependencies:
#   request
#
# Configuration:
#   none
#
# Commands:
#   hubot wiki <query> - Consulta la wiki en Inglés
#   hubot info <consulta> - Consulta la wiki en Español
#
# Notes:
#   None
#
# Author:
#   rdodev, raelga

r = require('request')

base_url = [
  'http://en.wikipedia.org/w/api.php?',
  'http://es.wikipedia.org/w/api.php?'
  ]

url_args = '&format=json&action=query&prop=info&inprop=url'

errorMsg = [
  'wah wah something broke :~(',
  'ya lo has roto :('
]

infoMsg = [
  'Here\'s the Wikipedia link for',
  'Aquí tienes el link a la Wikipedia para '
]
noresMsg = [
  'returned no results from wikipedia.',
  'no está en la wikipedia así que ni idea.'
]

module.exports = (robot) ->

    get_wiki = (msg, lang) ->
      req = r.get base_url[lang] + 'titles='+ encodeURIComponent(msg.match[2].trim()) + url_args, (error, req, body) ->
          if not error
            handle_response msg, body, lang
          else
            msg.send 'wah wah something broke :~('

    handle_response = (msg, body, lang) ->
        jsn = JSON.parse body
        pages = (p for p of jsn.query.pages when p isnt '-1')
        if pages.length > 0
            text = "#{infoMsg[lang]} #{msg.match[1]}: #{jsn.query.pages[pages[0]].fullurl}"
            msg.send text
        else if lang > 0
            get_wiki msg, 0
        else
            text = "#{msg.match[2]} #{noresMsg[lang]}"
            msg.send text

    robot.respond /wiki (about)?(.+)/i, (msg) ->
        get_wiki msg, 0

    robot.respond /info (sobre)?(.+)/i, (msg) ->
        get_wiki msg, 1
