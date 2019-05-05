class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	Message.create!(content: data['message'])
  	ActionCable.sever.broadcast 'room_channnel', data['message']
  end
end
