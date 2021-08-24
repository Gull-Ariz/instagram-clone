# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#images-count').change ->
    limit = 10 - $('#images-count').data('images-count')
    files = $(this)[0].files
    if files.length > limit
      alert 'You can select max ' + limit + ' images.'
      $('#images-count').val ''
  return

setTimeout (->
  $('#flashmessage').fadeOut 'fast'
  return
), 3000
