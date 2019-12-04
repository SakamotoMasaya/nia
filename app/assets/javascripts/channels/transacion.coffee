App.transacion = App.cable.subscriptions.create "TransacionChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append('<p>' + data['message'] + '<p>');
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=transacion_speak]', (event) ->
  if event.keyCode is 13 # return = send
    App.transacion.speak event.target.value
    event.target.value = ''
    event.preventDefault()

# $(document).on('keypress', '[data-behavior~=transacion_speak]', function(event) {
#   if (event.keyCode === 13) {
#     var chatForm = $('#chat-form');
#     App.transacion.speak(chatForm.val());
#     return chatForm.val('');
#   }