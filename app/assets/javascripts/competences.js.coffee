$ ->
  $('.new_competence').on('ajax:success', (e, data, status, xhr) ->
    $(this).before(xhr.responseText)
  )
