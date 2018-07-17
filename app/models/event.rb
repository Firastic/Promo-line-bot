require 'line/bot'

class Event
  attr_reader :errors
  def initialize(params, signature, body)
    @body = body
    @signature = signature
    @type = params[0]["type"]
    if(@type == "message")
      @replyToken = params[0]["replyToken"]
      @source = params[0]["source"]
      @message = params[0]["message"]
    end
  end

  def valid?
    #todo: better validation
    @errors = []
    unless client.validate_signature(@body, @signature)
      @errors.push("Bad request")
    end
    @errors.empty?
    true
  end

  def response
    body = {}
    if(@type == "message")
      #todo post into line using faraday
      # link = "https://api.line.me"
      # conn = Faraday.new(url: link) do |faraday|
      #   faraday.authorization = true #todo: add channel access token
      # end
      body["replyToken"] = 1 #todo: add replyToken
      reply_messages = []
      case @message["text"]
      when "!update"
        data = Crawler.new.update
        data.each do |json|
          #todo: insert image into message
          reply_messages.push({type: "imagemap", baseUrl: data, altText: "", baseSize: {height: 1040, width: 1040},})
          if(messages.size == 5)
            break;
          end
        end
      when "UwU"
        reply_messages.push("Berisik") 
      else
        reply_messages.push("Command not recognized!")
      end
      response = client.reply_message(@replyToken, reply_messages)
      puts(response)
      response
    end
  end

private
  def client
    @client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_BOT_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_BOT_CHANNEL_TOKEN"]
    }
  end
end