# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#users-search #term').on 'keyup', ->
    jqxhr = $.get($('#users-search').attr('action'), { term: $('#users-search #term').val() }, ->
      result = $('#users-result').html()
      if !result
        $('#users-search #term').popover
          content: 'No result found.'
          placement: 'bottom'
          html: true
          trigger: 'focus'
      else
        $('#users-search #term').popover
          content: $('#users-result')
          placement: 'bottom'
          html: true
          trigger: 'focus'
      $('#users-search #term').popover 'show'
      return
    )
    return
  return

jQuery ->
  $('#search').autocomplete
    source: "/search_suggestions"

