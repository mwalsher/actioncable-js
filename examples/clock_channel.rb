# Place in app/channels/clock_channel.rb
# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class ClockChannel < ApplicationCable::Channel
  def subscribed
    @uuid = params[:uuid]
    stop_all_streams
    stream_from "clock_#{@uuid}"
    @subscribed = true
    logger.info ">>> Subscribed #{@uuid}!"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info ">>> Unsubscribed #{@uuid}!"
    stop_all_streams
    @subscribed = false
  end

  def start
    @run = true
    tick
  end

  def stop
    @run = false
  end

  def tick
    loop do
      logger.info ">>> Tick!"
      broadcast(random_number: rand(1..100))
      sleep 1
      break unless @subscribed && @run
    end
  end

  def tock(data)
    logger.info ">>> Tock! #{data}"
  end

  private

  def broadcast(data)
    ActionCable.server.broadcast "clock_#{@uuid}", data
  end
end
