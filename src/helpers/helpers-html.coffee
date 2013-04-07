Handlebars = require('./helpers').Handlebars
HTML       = require '../utils/html'
Utils      = require '../utils/utils'



Handlebars.registerHelper 'ul', (context, options) ->
    "<ul #{HTML.parseAttributes(options.hash)}>" + context.map((item) ->
        "<li>#{options.fn(item)}</li>"
    ).join('\n') + "</ul>"

Handlebars.registerHelper 'ol', (context, options) ->
    "<ol #{HTML.parseAttributes(options.hash)}>" + context.map((item) ->
        "<li>#{options.fn(item)}</li>"
    ).join('\n') + "</ol>"

Handlebars.registerHelper 'br', (count, options) ->
    br = '<br>'

    unless Utils.isUndefined count
        i = 0

        while i < count - 1
            br += '<br>'
            i++

    Utils.safeString br

###
Convert new line (\n) to <br>
from http://phpjs.org/functions/nl2br:480
###
Handlebars.registerHelper "nl2br", (text) ->
  nl2br = (text + "").replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, "$1" + "<br>" + "$2")
  new Handlebars.SafeString(nl2br)
