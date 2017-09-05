class DraftChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'pick'
  end
end
