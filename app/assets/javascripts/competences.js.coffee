$ ->
  $('.new_competence').on('ajax:success', (e, data, status, xhr) ->
    $('.competences').append(xhr.responseText)
  )
