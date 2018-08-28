Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'gsearch:google-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://www.google.com/search?q=#{cased}&oq=#{cased}"
        Shell.openExternal url
