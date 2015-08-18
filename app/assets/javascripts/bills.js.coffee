$ ->
  $('#bill_name').focus()
  $('#bill_period').focus()
  $('.edit_bill').on('ajax:success', (e, data, status, xhr) ->
    $('body').html(xhr.responseText)
    $('.edit_bill').hide()
  ).on 'ajax:error', (e, xhr, status, error) ->
    $('.edit_bill').append '<p>Vul alle waarden in!</p>'
