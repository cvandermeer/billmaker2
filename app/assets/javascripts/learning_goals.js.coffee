$ ->
  $('.new_learning_goal').on('ajax:success', (e, data, status, xhr) ->
    $(this).parent().find('.learning_goals').append(xhr.responseText)
    $('.new_learning_goal textarea').val('').focus()
    $('.new_learning_goal input').val('')
  )
