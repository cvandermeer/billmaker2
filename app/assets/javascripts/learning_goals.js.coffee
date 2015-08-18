$ ->
  $('.new_learning_goal').on('ajax:success', (e, data, status, xhr) ->
    $(this).parent().find('.learning_goals').append(xhr.responseText)
  )
