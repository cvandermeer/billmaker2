$ ->
  $('.new_competence').on 'ajax:success', (e, data, status, xhr) ->
    $(this).before xhr.responseText
    $('.new_learning_goal').last().bind 'ajax:success', (e, data, status, xhr) ->
      $(this).before xhr.responseText
      $(this).find('#learning_goal_learned').val('')
      $(this).find('#learning_goal_goal').val('')
    $('.destroy_competence').on 'ajax:success', (e, data, status, xhr) ->
      $(this).parent().parent().siblings().closest('.new_learning_goal').hide()
      $(this).parent().parent().hide()
  
  $('.destroy_competence').on 'ajax:success', (e, data, status, xhr) ->
    $(this).parent().parent().siblings().closest('.new_learning_goal').hide()
    $(this).parent().parent().hide()
