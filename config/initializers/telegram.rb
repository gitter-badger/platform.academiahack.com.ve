require 'telegram/bot'
class TelegramHack
  attr_accessor :telegram_token, :telegram_clients

  def self.get_instance
    unless @instance
      @instance = TelegramHack.new
      @instance.telegram_token = '93681148:AAG663kODhQvYLFrvhfX55uk1JnNZOFWwZc'
      @instance.telegram_clients = []
    end
    @instance
  end

  def go!
    Telegram::Bot::Client.run(@telegram_token) do |bot|
      bot.listen do |message|
        case message.text
          when '/start'
            @telegram_clients.push message.chat.id
            bot.api.send_message(chat_id: message.chat.id, text: "Hola, #{message.from.first_name} bienvenido a Hack, te notificare cada vez que un mentor suba un reto.")
          when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "Chao, #{message.from.first_name} ya no te notificare mas")
        end
      end
    end
  end

  def challenge_published! name
    Telegram::Bot::Client.run(@telegram_token) do |bot|
      @telegram_clients.each do |client|
        bot.api.send_message(chat_id: client, text: "Hay un reto nuevo en la plataforma para el dia #{name}")
      end
    end
  end
end

telegram_hack = TelegramHack.get_instance
Thread.new do
  telegram_hack.go!
end

