$(document).on 'turbolinks:load', ->
  $('body').on 'click', 'a.leave_team', (e) ->
    current_user_id = e.target.id
    $('#leave_team_modal').modal('open')
    $('.leave_user_form').attr('action', 'team_users/' + current_user_id)
    $('#leave_team_modal').find('#user_remove_id').val(current_user_id)
    return false

  $('.leave_user_form').on 'submit', (e) ->
    $.ajax e.target.action,
      type: 'DELETE'
      dataType: 'json',
      data: {team_id: $(".team_id").val()}
      success: (data, text, jqXHR) ->
        $('.user_' + $('#user_remove_id').val()).remove()
        Materialize.toast('Success in remove User &nbsp;<b>:(</b>', 4000, 'green')
      error: (jqXHR, textStatus, errorThrown) ->
        Materialize.toast('Problem to remove User &nbsp;<b>:(</b>', 4000, 'red')

    $('#leave_team_modal').modal('close')
    document.location.href="/";
    return false
