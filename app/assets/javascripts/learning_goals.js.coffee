$ ->
  $('.new_learning_goal').on('ajax:success', (e, data, status, xhr) ->
    $('.learning_goals').append(xhr.responseText)
  )
