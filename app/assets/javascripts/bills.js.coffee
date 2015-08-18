$ ->
  $('#new_bill').on('ajax:success', (e, data, status, xhr) ->
    $('body').append xhr.responseText
    $('#new_bill').hide()
    $('#guide').html('Goedzo, de volgende stap is de competenties toevoegen')
  ).on 'ajax:error', (e, xhr, status, error) ->
    $('#new_bill').append '<p>ERROR</p>'