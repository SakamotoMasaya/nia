class TransacionChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "transacion_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(text: data['message'])
    ActionCable.server.broadcast 'transacion_channel', message: data['message']
  end
end
